///**
/**
ContactApp
Created by: Jefry Eko Mulya on 01/07/19
https://github.com/jefrydagucci
Copyright (c) 2019 DAGUCI

*/

import Alamofire

class APIRequest: APIRequestProtocol {
    let url: URLConvertible
    let params: Parameters?
    let method: HTTPMethod
    let headers: HTTPHeaders?
    let encoding: ParameterEncoding
    
    init(url: String,
         method: HTTPMethod,
         params: Parameters? = nil,
         additionalHeaders: HTTPHeaders? = nil,
         encoding: ParameterEncoding) {
        self.url = url
        self.params = params
        self.method = method
        self.headers = additionalHeaders
        self.encoding = encoding
    }
}

extension APIRequest: APIRequestResponseDecoder {
    var dataRequest: DataRequest {
        return Alamofire.SessionManager.default
            .request(url,
                     method: method,
                     parameters: params,
                     encoding: encoding,
                     headers: headers)
            .validate()
    }
}


//MARK: APIRequest + NetworkManager
extension APIRequest {
    //    MARK: request call
    @discardableResult
    func perform<T>(completion: @escaping (NetworkResult<T>) -> Void) -> DataRequest {
        let request = dataRequest.responseJSON { response in
            switch response.result {
            case .success:
                do {
                    guard let data = response.data else {
                        return
                    }
                    let model = try self.decoder.decode(T.self, from: data)
                    completion(.success(model: model))
                } catch let error {
                    let resultError = NetworkError(
                        status: "\((error as NSError).code)",
                        error: error.localizedDescription)
                    completion(.failure(err: resultError))
                }
            case .failure(let error):
                var resultError: NetworkError?
                defer {
                    if let resultError = resultError {
                        completion(.failure(err: resultError))
                    } else {
                        completion(.failure(err: NetworkError(
                            status: "\((error as NSError).code)",
                            error: error.localizedDescription)))
                    }
                }
                do {
                    guard let data = response.data else {
                        resultError = NetworkError(
                            status: "\((error as NSError).code)",
                            error: error.localizedDescription)
                        return
                    }
                    resultError = try self.decoder.decode(NetworkError.self, from: data)
                } catch { return }
            }
        }
        return request
    }
}

///**
/**
 ECommerce
 Created by: Jefry Eko Mulya on 02/07/20
 https://github.com/jefrydagucci
 Copyright (c) 2020 DAGUCI
 
 */

import XCTest
import OHHTTPStubs
@testable import ECommerce

class HomeServiceTests: XCTestCase {
    
    override func setUp() {
        
    }
    
    override func tearDown() {
        
    }
    
    func testHomeServiceGetHome() {
        let expect = expectation(description: "get correct data from json and transform it to contacts")
        let service = HomeService()
        stub(condition: { (request:URLRequest) -> Bool in
            return request.url?.absoluteString == "https://private-4639ce-ecommerce56.apiary-mock.com/home"
        }, response: { (request:URLRequest) -> OHHTTPStubsResponse in
            
            do {
                guard let path = Bundle.main.path(forResource: "MockHome", ofType: "json") else {
                    assertionFailure("failed")
                    return OHHTTPStubsResponse(error: NetworkError.init(status: "500", error: "failed json"))
                }
                let jsonData = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return OHHTTPStubsResponse(data: jsonData, statusCode: 200, headers: nil)
                
            } catch {
                return OHHTTPStubsResponse(error: NetworkError.init(status: "500", error: "json error"))
            }
        })
        
        service.get { (response) in
            switch response {
            case .success(let result):
                XCTAssertEqual(result.count, 1)
                guard let firstElement = result.first,
                    let homeModel = firstElement.data else {
                    XCTFail()
                    return
                }
                XCTAssertEqual(homeModel.category.count, 5)
                XCTAssertEqual(homeModel.productPromo.count, 4)
                guard let firstCategory = homeModel.category.first,
                    let secondCategory = homeModel.category[safe: 1]  else {
                    XCTFail()
                    return
                }
                XCTAssertEqual(firstCategory.id, 21)
                XCTAssertEqual(firstCategory.name, "Baju")
                XCTAssertEqual(secondCategory.id, 42)
                XCTAssertEqual(secondCategory.name, "Celana")
                
                guard let firstProduct = homeModel.productPromo.first,
                    let secondProduct = homeModel.productPromo[safe: 1]  else {
                    XCTFail()
                    return
                }
                XCTAssertEqual(firstProduct.id, "6723")
                XCTAssertEqual(firstProduct.title, "Nitendo Switch")
                XCTAssertEqual(secondProduct.id, "6724")
                XCTAssertEqual(secondProduct.title, "Nitendo Entertainment System ")
                expect.fulfill()
            case .failure(let error):
                print(error)
                XCTFail()
            }
        }
        
        self.waitForExpectations(timeout: 30, handler: .none)
        OHHTTPStubs.removeAllStubs()
    }
}

///**
/**
ECommerce
Created by: Jefry Eko Mulya on 02/07/20
https://github.com/jefrydagucci
Copyright (c) 2020 DAGUCI

*/

import UIKit
import GoogleSignIn

final class LoginViewController: UIViewController {
    @IBOutlet weak private var signInButton: GIDSignInButton!
    
    private let viewModel: LoginViewModelType
    init(viewModel: LoginViewModelType) {
        self.viewModel = viewModel
        super.init(
            nibName: String(describing: LoginViewController.self),
            bundle: Bundle(for: LoginViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
      super.viewDidLoad()

        configureView()
        configureGoogle()
        bind()
    }
    
    private func configureView() {
        signInButton.style = .standard
    }
    
    private func configureGoogle() {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.delegate = self
    }
}

private extension LoginViewController {
    func bind() {
        viewModel.outputs.showHome.observeNext {
            TabBarWireframe().show(in: UIApplication.shared.keyWindow)
        }.dispose(in: bag)
    }
}

extension LoginViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        viewModel.inputs.onConnectGoogle(user: user)
    }
}

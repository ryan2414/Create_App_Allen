//
//  LoginViewController.swift
//  Nav&TapCode
//
//  Created by 이승재 on 2023/06/21.
//

import UIKit

class LoginViewConroller: UIViewController {
    
    private let loginView = LoginView()
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc func loginButtonTapped() {
        dismiss(animated: true)
    }
}

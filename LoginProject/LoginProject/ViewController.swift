//
//  ViewController.swift
//  LoginProject
//
//  Created by 이승재 on 2023/06/17.
//

import UIKit

class ViewController: UIViewController {

    let emailTextFieldView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
    }

    func makeUI() {
        emailTextFieldView.backgroundColor = UIColor.darkGray
        
        emailTextFieldView.layer.cornerRadius = 8
        emailTextFieldView.layer.masksToBounds = true
        
        view.addSubview(emailTextFieldView)
        
        emailTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        emailTextFieldView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true//왼쪽
        emailTextFieldView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true//오른쪽
        emailTextFieldView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        emailTextFieldView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
}


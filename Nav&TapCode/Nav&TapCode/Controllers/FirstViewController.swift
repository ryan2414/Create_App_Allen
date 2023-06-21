//
//  FirstViewController.swift
//  Nav&TapCode
//
//  Created by 이승재 on 2023/06/21.
//

import UIKit

class FirstViewControler: UIViewController {
    var isLoggedIn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
    
        
        if !isLoggedIn {
            let vc = LoginViewConroller()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false, completion: nil)
        }
        
    }
    
    func makeUI() {
        view.backgroundColor = .gray
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground() //불투명으로
        
        navigationController?.navigationBar.tintColor = .blue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        title = "Main"
    }
}

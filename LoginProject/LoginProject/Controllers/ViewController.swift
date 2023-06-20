//
//  ViewController.swift
//  LoginProject
//
//  Created by 이승재 on 2023/06/17.
//

import UIKit

final class ViewController: UIViewController {
    private let loginView = LoginView()
    
    // view(메인뷰)를 만들어 내는 시점/지점 (한번만 호출): 코드로 짤때 뷰 교체 가능 시점
    // 스토리보드로 이용할 때, 호출하면 화면 로드 안됨.
    override func loadView() {
        //구현할 때 상위호출 하면 안됨
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAddTarget()
    }
    
    func setupAddTarget() {
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginView.passwordResetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        
    }
    
    @objc func loginButtonTapped() {
        print("다음 화면으로 넘어가기")
//        썬 전환 관련 기능 은 여기에 구현
//        let vc = SecondViewController()
//
//        present(vc, animated: true)
    }
    
    @objc func resetButtonTapped() {
        let alert = UIAlertController(title: "비밀번호 바꾸기", message: "비밀번호를 바꾸시겠습니까?", preferredStyle: .alert)
        let sucess = UIAlertAction(title: "확인", style: .default) { action in
            print("확인버튼이 눌렸습니다.")
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel) { action in
            print("취소버튼이 눌렸습니다.")
        }
        
        alert.addAction(sucess)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
    }
}

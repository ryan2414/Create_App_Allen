//
//  SecondViewController.swift
//  BMI
//
//  Created by 이승재 on 2023/06/19.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var bmiNumberLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    @IBOutlet weak var backButton: UIButton!
    
    var bmi: BMI?
    
//    var bmiNumber: Double?
//    var adviceString: String?
//    var bmiColor: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()

       makeUI()
    }
    
    func makeUI(){
        
        bmiNumberLabel.clipsToBounds = true
        bmiNumberLabel.layer.cornerRadius = 8
        bmiNumberLabel.backgroundColor = .gray
        
        backButton.setTitle("다시 계산하기", for: .normal)
        backButton.layer.cornerRadius = 5
        backButton.clipsToBounds = true
        
        guard let bmi = bmi else {return}
        
        bmiNumberLabel.text = "\(bmi.value)"
        adviceLabel.text = bmi.advice
        bmiNumberLabel.backgroundColor = bmi.matchColor
    }
    

    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}

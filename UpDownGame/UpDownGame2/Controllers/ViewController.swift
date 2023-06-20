//
//  ViewController.swift
//  UpDownGame2
//
//  Created by 이승재 on 2023/06/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
    
    var upDownManager = UpDownManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reset()
    }
    
    func reset() {
        mainLabel.text = "선택하세요"
        numberLabel.text = ""
        upDownManager.resetNum()
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let numString = sender.currentTitle else { return }
        numberLabel.text = numString
        
        guard let num = Int(numString) else { return }
        upDownManager.setUserNum(num: num)
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        guard let numString = numberLabel.text, let myNum = Int(numString) else {
            return
        }
        
        upDownManager.setUserNum(num: myNum)
        mainLabel.text = upDownManager.getUpDownResult()
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        reset()
    }
    
}


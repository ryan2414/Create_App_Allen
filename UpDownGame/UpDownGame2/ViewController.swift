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
    
    var comNum = Int.random(in: 1...10)
    
    //var myNum = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainLabel.text = "선택하세요"
        numberLabel.text = ""
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let numString = sender.currentTitle else { return }
        
        numberLabel.text = numString
        
//        guard let num = Int(numString) else { return }
//
//        myNum = num
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        guard let numString = numberLabel.text else { return }
        guard let myNum = Int(numString) else { return }
        
        if comNum > myNum {
            mainLabel.text = "UP"
        } else if comNum < myNum {
            mainLabel.text = "DOWN"
        } else {
            mainLabel.text = "BINGO😂"
        }
        
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        mainLabel.text = "선택하세요"
        numberLabel.text = ""
        comNum = Int.random(in: 1...10)
    }
    
}


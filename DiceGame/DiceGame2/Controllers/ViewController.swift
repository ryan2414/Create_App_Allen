//
//  ViewController.swift
//  DiceGame2
//
//  Created by 이승재 on 2023/06/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imgDice1: UIImageView!
    @IBOutlet var imgDice2: UIImageView!
    
    let diceManager = DiceManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        diceManager.getFirstDice()
        diceManager.getFirstDice()
    }


    
    @IBAction func onBtnRoll(_ sender: UIButton) {
        imgDice1.image = diceManager.getRandomDice()
        imgDice2.image = diceManager.getRandomDice()
        
        
    }
    
    
    
}


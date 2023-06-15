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
    
    var diceArray: [UIImage] = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2"), #imageLiteral(resourceName: "black3"), #imageLiteral(resourceName: "black4"), #imageLiteral(resourceName: "black5"), #imageLiteral(resourceName: "black6")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    @IBAction func onBtnRoll(_ sender: UIButton) {
        imgDice1.image = diceArray.randomElement()
        imgDice2.image = diceArray.randomElement()
        
        
    }
    
    
    
}


//
//  ViewController.swift
//  RPSGame2
//
//  Created by 이승재 on 2023/06/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblMain: UILabel!
    
    @IBOutlet var imgCom: UIImageView!
    @IBOutlet var imgMy: UIImageView!
    
    @IBOutlet var lblComChoice: UILabel!
    @IBOutlet var lblMyChoice: UILabel!
    
    var myChoice:Rps = Rps.rock
    var comChoice:Rps = Rps(rawValue: Int.random(in: 0...2))!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgCom.image = #imageLiteral(resourceName: "ready")
        imgMy.image = UIImage(named: "ready.png")

        let ready = "준비"
        lblComChoice.text = ready
        lblMyChoice.text = ready
        
    }


    @IBAction func onButtonRPS(_ sender: UIButton) {
        let title = sender.currentTitle!
       
        switch title {
        case "가위":
            myChoice = Rps.scissors
        case "바위":
            myChoice = Rps.rock
        case "보":
            myChoice = Rps.paper
        default:
            break
        }
    }
    
    
    @IBAction func onButtonPlay(_ sender: UIButton) {
        switch comChoice {
        case .rock:
            imgCom.image = #imageLiteral(resourceName: "rock")
            lblComChoice.text = "바위"
        case .paper:
            imgCom.image = #imageLiteral(resourceName: "paper")
            lblComChoice.text = "보"
        case .scissors:
            imgCom.image = #imageLiteral(resourceName: "scissors")
            lblComChoice.text = "가위"
        }
        
        
        switch myChoice {
        case .rock:
            imgMy.image = #imageLiteral(resourceName: "rock")
            lblMyChoice.text = "바위"
        case .paper:
            imgMy.image = #imageLiteral(resourceName: "paper")
            lblMyChoice.text = "보"
        case .scissors:
            imgMy.image = #imageLiteral(resourceName: "scissors")
            lblMyChoice.text = "가위"
        }
        
        
        if comChoice == myChoice {
            lblMain.text = "비겼다"
        } else if comChoice == .rock && myChoice == .paper {
            lblMain.text = "이겼다"
        } else if comChoice == .paper && myChoice == .scissors {
            lblMain.text = "이겼다"
        } else if comChoice == .scissors && myChoice == .rock {
            lblMain.text = "이겼다"
        } else {
            lblMain.text = "졌다."
        }
    }
    
    @IBAction func onButtonReset(_ sender: UIButton) {
        imgCom.image = #imageLiteral(resourceName: "ready")
        imgMy.image = UIImage(named: "ready.png")

        let ready = "준비"
        lblComChoice.text = ready
        lblMyChoice.text = ready
        
        lblMain.text = "선택하세요"
        comChoice = Rps(rawValue: Int.random(in: 0...2))!
        
    }
    
    
}

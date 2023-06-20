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
    
    var rpsManager = RPSManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
       
        
    }
    
    func configureUI() {
        imgCom.image = rpsManager.getReady().rpsInfo.image
        imgMy.image = rpsManager.getReady().rpsInfo.image
        
        lblComChoice.text = rpsManager.getReady().rpsInfo.name
        lblMyChoice.text = rpsManager.getReady().rpsInfo.name
    }


    @IBAction func onButtonRPS(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        
        rpsManager.userGetSelected(name: title)
    }
    
    
    @IBAction func onButtonPlay(_ sender: UIButton) {
        imgCom.image = rpsManager.getComputerRPS().rpsInfo.image
        lblComChoice.text = rpsManager.getComputerRPS().rpsInfo.name
        
        imgMy.image = rpsManager.getUserRPS().rpsInfo.image
        lblMyChoice.text = rpsManager.getUserRPS().rpsInfo.name
        
        lblMain.text = rpsManager.getRpsResult()
    }
    
    @IBAction func onButtonReset(_ sender: UIButton) {
        imgCom.image = rpsManager.getReady().rpsInfo.image
        lblComChoice.text = rpsManager.getReady().rpsInfo.name
        
        imgMy.image = rpsManager.getReady().rpsInfo.image
        lblMyChoice.text = rpsManager.getReady().rpsInfo.name
        
        lblMain.text = "선택하세요"
        
        rpsManager.allReset()
        
    }
    
    
}

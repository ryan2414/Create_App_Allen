//
//  ViewController.swift
//  MyFirstApp2
//
//  Created by 이승재 on 2023/06/15.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var mainLabel: UILabel!
    
    @IBOutlet var myButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainLabel.text = "신짜오"
    }
    
    
    @IBAction func btnPressed(_ sender: UIButton) {
        mainLabel.text = "안녕하세요"
        //        mainLabel.backgroundColor = UIColor.red
        mainLabel.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        myButton.backgroundColor = UIColor.yellow
        myButton.setTitleColor(UIColor.black, for: .normal)
    }
    
    
    
}


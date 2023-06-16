//
//  ViewController.swift
//  Timer
//
//  Created by 이승재 on 2023/06/16.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    weak var timer: Timer?
    var number: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }

    func configureUI() {
        mainLabel.text = "초를 선택하세요"
        slider.setValue(0.5, animated: true)
        number = 30
        timer?.invalidate()
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        let time = sender.value * 60
        let timeInt = Int(time)
        mainLabel.text = "\(timeInt) 초"
        number = timeInt
    }
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
        
        //셀렉터 사용
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(doSomethingAfter1Second), userInfo: nil, repeats: true)
       
        //클로저 사용
//        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [self] _ in
//            if number > 0 {
//                number -= 1
//                slider.value = Float(number)/Float(60)
//                mainLabel.text = "\(number) 초"
//            } else {
//                number = 0
//                mainLabel.text = "초를 선택하세요"
//
//                timer?.invalidate()
//
//                AudioServicesPlayAlertSound(SystemSoundID(1322))
//            }
//
//        })
    }
    
    @objc func doSomethingAfter1Second() {
        if number > 0 {
            number -= 1
            slider.value = Float(number)/Float(60)
            mainLabel.text = "\(number) 초"
        } else {
            number = 0
            mainLabel.text = "초를 선택하세요"
            
            timer?.invalidate()
            
            AudioServicesPlayAlertSound(SystemSoundID(1322))
        }
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        configureUI()
    }
}


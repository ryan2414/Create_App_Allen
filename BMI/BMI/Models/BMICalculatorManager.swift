//
//  BMICalculatorManager.swift
//  BMI
//
//  Created by 이승재 on 2023/06/20.
//

import Foundation
import UIKit

//프로젝트가 작고 단일 컨트롤러에서 접근 중임으로 struct로 제작
//규모가 커질 경우 class로 변경 
struct BMICalculatorManaer {
    
    var bmi: Double?
    
    
    mutating func calculateBMI(height: String, weight:String) {
        guard let h = Double(height), let w = Double(weight) else {
            bmi = 0.0
            return
            
        }
        var bmiNumber = w / (h * h) * 10000
        bmi = round(bmiNumber * 10) / 10
        print("BMI결과값: \(bmi!)")
    }
    
    
    func getBMIResult() -> Double {
        return bmi ?? 0.0
    }
    
    
    func getBackgroundColor() -> UIColor {
        guard let bmi = bmi else { return UIColor.black}
        switch bmi {
        case ..<18.6:
            return UIColor(displayP3Red: 22/255, green: 231/255, blue: 207/255, alpha: 1)
        case 18.6..<23.0:
            return UIColor(displayP3Red: 212/255, green: 251/255, blue: 121/255, alpha: 1)
        case 23.0..<25.0:
            return UIColor(displayP3Red: 218/255, green: 127/255, blue: 141/255, alpha: 1)
        case 25..<30.0:
            return UIColor(displayP3Red: 255/255, green: 150/255, blue: 141/255, alpha: 1)
        case 30.0...:
            return UIColor(displayP3Red: 255/255, green: 100/255, blue: 78/255, alpha: 1)
        default:
            return UIColor.black
        }
    }
    
    func getBMIAdviceString() -> String {
        guard let bmi = bmi else { return "" }
        switch bmi {
        case ..<18.6:
            return "저체중"
        case 18.6..<23.0:
            return "표준"
        case 23.0..<25.0:
            return "과체중"
        case 25..<30.0:
            return "중도비만"
        case 30.0...:
            return "고도비만"
        default:
            return ""
            
        }
    }
    
    
    
    
}

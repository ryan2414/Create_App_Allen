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
    
    var bmi: BMI?
    var defaultBMI: BMI = BMI(value: 0.0, matchColor: UIColor.black, advice: "문제발생")
    
    mutating func getBMI(height: String, weight: String) -> BMI {
        calculateBMI(height: height, weight: weight)
        
        return bmi ?? defaultBMI
    }
    
    
    mutating func calculateBMI(height: String, weight:String) {
        guard let h = Double(height), let w = Double(weight) else {
            bmi = defaultBMI
            return
            
        }
        
        var bmiNumber = w / (h * h) * 10000
        bmiNumber = round(bmiNumber * 10) / 10
        
        
        switch bmiNumber {
        case ..<18.6:
            let color = UIColor(displayP3Red: 22/255, green: 231/255, blue: 207/255, alpha: 1)
            return bmi = BMI(value: bmiNumber, matchColor: color, advice: "저체중")
        case 18.6..<23.0:
            let color = UIColor(displayP3Red: 212/255, green: 251/255, blue: 121/255, alpha: 1)
            return bmi = BMI(value: bmiNumber, matchColor: color, advice: "표준")
        case 23.0..<25.0:
            let color = UIColor(displayP3Red: 218/255, green: 127/255, blue: 141/255, alpha: 1)
            return bmi = BMI(value: bmiNumber, matchColor: color, advice: "과체중")
        case 25..<30.0:
            let color = UIColor(displayP3Red: 255/255, green: 150/255, blue: 141/255, alpha: 1)
            return bmi = BMI(value: bmiNumber, matchColor: color, advice: "중도비만")
        case 30.0...:
            let color = UIColor(displayP3Red: 255/255, green: 100/255, blue: 78/255, alpha: 1)
            return bmi = BMI(value: bmiNumber, matchColor: color, advice: "고도비만")
        default:
            return bmi = defaultBMI
        }
    }
    
}

//
//  UpDownManager.swift
//  UpDownGame2
//
//  Created by 이승재 on 2023/06/20.
//

import Foundation

class UpDownManager {
    private var comNumber = Int.random(in: 1...10)
    
    private var myNumber: Int = 1
    
    func resetNum() {
        comNumber = Int.random(in: 1...10)
    }
    
    func setUserNum(num: Int) {
        myNumber = num
    }
    
    func getUpDownResult() -> String {
        if comNumber > myNumber {
            return "Up"
        } else if comNumber < myNumber {
            return "Down"
        } else {
            return "Bingo😎"
        }
    }
}

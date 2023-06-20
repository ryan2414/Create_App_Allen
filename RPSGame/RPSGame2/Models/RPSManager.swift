//
//  RPSManager.swift
//  RPSGame2
//
//  Created by 이승재 on 2023/06/20.
//

import UIKit

class RPSManager {
    private var comChoice: Rps = Rps(rawValue: Int.random(in: 1...3))!
    private var myChoice: Rps = Rps(rawValue: Int.random(in: 1...3))!
    
    func getReady() -> Rps {
        return Rps.ready
    }
    
    func getUserRPS() -> Rps {
        return myChoice
    }
    
    func getComputerRPS() -> Rps {
        return comChoice
    }
    
    func userGetSelected(name: String) {
        switch name {
        case "가위":
            myChoice = Rps.scissors
        case "바위":
            myChoice = Rps.rock
        case "보":
            myChoice = Rps.paper
        default:
            myChoice = Rps.ready
        }
    }
    
    func getRpsResult() -> String {
        if comChoice == myChoice {
            return "비겼다"
        } else if comChoice == .rock && myChoice == .paper {
            return "이겼다"
        } else if comChoice == .paper && myChoice == .scissors {
            return "이겼다"
        } else if comChoice == .scissors && myChoice == .rock {
            return "이겼다"
        } else {
            return "졌다"
        }
    }
    
    
    func allReset() {
        comChoice = Rps(rawValue: Int.random(in: 1...3))!
        myChoice = Rps(rawValue: Int.random(in: 1...3))!
    }
    
}

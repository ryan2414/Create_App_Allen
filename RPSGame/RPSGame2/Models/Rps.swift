//
//  Rps.swift
//  RPSGame2
//
//  Created by 이승재 on 2023/06/15.
//

import UIKit


enum Rps: Int {
    case ready
    case rock
    case paper
    case scissors
    
    var rpsInfo: (image: UIImage, name: String) {
        switch self {
        case .ready:
            return (#imageLiteral(resourceName: "ready"), "준비")
        case .rock:
            return (#imageLiteral(resourceName: "rock"),"바위")
        case .paper:
            return (#imageLiteral(resourceName: "paper"),"보")
        case .scissors:
            return (#imageLiteral(resourceName: "scissors"),"가위")
 
        }
    }
    
}

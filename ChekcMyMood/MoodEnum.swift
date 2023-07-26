//
//  emotionEnum.swift
//  ChekcMyMood
//
//  Created by 권현석 on 2023/07/25.
//

import Foundation

enum Mood: Int, CaseIterable {
    case superHappy = 0
    case happy = 1
    case soso = 2
    case sad = 3
    case superSad = 4
    
    var myMood: String {
        switch self {
        case.superHappy:
            return "Super Happy"
        case  .happy:
            return "Happy"
        case .soso:
            return "So So"
        case .sad:
            return "Sad"
        case .superSad:
            return "Super Sad"
        }
    }
}

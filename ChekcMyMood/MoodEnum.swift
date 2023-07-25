//
//  emotionEnum.swift
//  ChekcMyMood
//
//  Created by 권현석 on 2023/07/25.
//

import Foundation

enum Mood: String, CaseIterable {
    case superHappy = "Super Happy"
    case happy = "Happy"
    case soso = "So So"
    case sad = "Sad"
    case superSad = "Super Sad"
    
    var myMool: String {
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

//
//  ImageSingleton.swift
//  ChekcMyMood
//
//  Created by 권현석 on 2023/07/25.
//

import Foundation

struct ImageAsset {
    static var shared = ImageAsset()
    
    var superHappy: String = "emoji1"
    var happy: String = "emoji2"
    var soso: String = "emoji3"
    var sad: String = "emoji4"
    var superSad: String = "emoji5"
}

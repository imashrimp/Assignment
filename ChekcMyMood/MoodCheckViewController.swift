//
//  ViewController.swift
//  ChekcMyMood
//
//  Created by 권현석 on 2023/07/25.
//

import UIKit

class MoodCheckViewController: UIViewController {
    
    var imageName = ImageAsset.shared
    let statVC = StatViewController()
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var superHappyButton: UIButton!
    @IBOutlet var happyButton: UIButton!
    @IBOutlet var sosoButton: UIButton!
    @IBOutlet var sadButton: UIButton!
    @IBOutlet var superSadButton: UIButton!
    
    var superHappyCount: Int = 0
    var happyCount: Int = 0
    var sosoCount: Int = 0
    var sadCount: Int = 0
    var superSadCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabelConfigure()
        moodButtonConfigure(button: superHappyButton, image: imageName.superHappy, backgroundColor: .systemPink, tagNumber: 0)
        moodButtonConfigure(button: happyButton, image: imageName.happy, backgroundColor: .systemOrange,  tagNumber: 1)
        moodButtonConfigure(button: sosoButton, image: imageName.soso, backgroundColor: .systemYellow,  tagNumber: 2)
        moodButtonConfigure(button: sadButton, image: imageName.sad, backgroundColor: .systemBlue,  tagNumber: 3)
        moodButtonConfigure(button: superSadButton, image: imageName.superSad, backgroundColor: .systemPurple,  tagNumber: 4)
    }
    
    @IBAction func moodButtonTapped(_ sender: UIButton) {
        
        guard let moodValue = Mood(rawValue: sender.tag) else { return }
  
        switch moodValue {
        case .superHappy:
            superHappyCount += 1
            statVC.moodCountDictionary[moodValue.myMood] = superHappyCount
        case .happy:
            happyCount += 1
            statVC.moodCountDictionary[moodValue.myMood] = happyCount
        case .soso:
            sosoCount += 1
            statVC.moodCountDictionary[moodValue.myMood] = sosoCount
        case .sad:
            sadCount += 1
            statVC.moodCountDictionary[moodValue.myMood] = sadCount
        case .superSad:
            superSadCount += 1
            statVC.moodCountDictionary[moodValue.myMood] = superSadCount
        }
        
        print("SUPER HAPPY: \(superSadCount)번")
        print("HAPPY: \(happyCount)번")
        print("SOSO: \(sosoCount)번")
        print("SAD: \(sadCount)번")
        print("SUPER SAD: \(superSadCount)번")
    }
    
    private func titleLabelConfigure() {
        titleLabel.textAlignment = .center
        titleLabel.text = "CHECK MY MOOD"
        titleLabel.font = .systemFont(ofSize: 30, weight: .bold)
    }
    
    func moodButtonConfigure(button: UIButton, image: String, backgroundColor: UIColor, tagNumber: Int) {
        button.setTitle("", for: .normal)
        button.setImage(UIImage(named: image), for: .normal)
        button.backgroundColor = backgroundColor
        button.tag = tagNumber
    }
}


//
//  StatViewController.swift
//  ChekcMyMood
//
//  Created by 권현석 on 2023/07/25.
//

import UIKit

class StatViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var moodView: [UIView]!
    @IBOutlet var moodLabelCollection: [UILabel]!
    @IBOutlet var countLabelCollection: [UILabel]!
    let moodCheckVC = MoodCheckViewController().moodCountClass.moodCountDictionary
    
    var backgroundColor: [UIColor] = [.systemPink, .systemOrange, .systemYellow, .systemBlue, .systemPurple]
    var moodLabelTitle: [String] = ["Super Happy", "Happy", "So So","Sad", "Super Sad"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTitleLabel()
        configureMoodview()
        configureMoodLabel()
        configureCountLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showMyMoodCount()
    }
    
    private func configureTitleLabel() {
        titleLabel.textAlignment = .center
        titleLabel.text = "CHECK MY MOOD"
        titleLabel.font = .systemFont(ofSize: 30, weight: .bold)
    }
    
    func configureMoodview() {
        for i in 0..<moodView.count {
            moodView[i].layer.cornerRadius = 8
            moodView[i].backgroundColor = backgroundColor[i]
        }
    }
    
    func configureMoodLabel() {
        for i in 0..<moodLabelCollection.count {
            moodLabelCollection[i].textColor = .black
            moodLabelCollection[i].font = .systemFont(ofSize: 30, weight: .bold)
            moodLabelCollection[i].text = moodLabelTitle[i]
        }
    }
    
    func configureCountLabel() {
        for i in 0..<countLabelCollection.count {
            countLabelCollection[i].textColor = .black
            countLabelCollection[i].font = .systemFont(ofSize: 30, weight: .bold)
            countLabelCollection[i].text = "0번"
            countLabelCollection[i].textAlignment = .right
        }
    }
    
    func showMyMoodCount() {
        for i in 0..<countLabelCollection.count {
            guard let moodText = Mood(rawValue: i) else { return }
            
            switch moodText {
            case .superHappy:
                countLabelCollection[i].text = "\(UserDefaults.standard.integer(forKey: moodText.myMood))번"
            case .happy:
                countLabelCollection[i].text = "\(UserDefaults.standard.integer(forKey: moodText.myMood))번"
            case .soso:
                countLabelCollection[i].text = "\(UserDefaults.standard.integer(forKey: moodText.myMood))번"
            case .sad:
                countLabelCollection[i].text = "\(UserDefaults.standard.integer(forKey: moodText.myMood))번"
            case .superSad:
                countLabelCollection[i].text = "\(UserDefaults.standard.integer(forKey: moodText.myMood))번"
            }
        }
    }
}

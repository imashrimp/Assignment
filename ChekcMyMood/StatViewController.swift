//
//  StatViewController.swift
//  ChekcMyMood
//
//  Created by 권현석 on 2023/07/25.
//

//TODO: 노란 경고 뜸. 레이블에 width 줘야함
import UIKit

class StatViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var moodView: [UIView]!
    @IBOutlet var moodLabelCollection: [UILabel]!
    @IBOutlet var countLabelCollection: [UILabel]!
    let moodCheckVC = MoodCheckViewController().moodCountClass.moodCountDictionary
    
    var backgroundColor: [UIColor] = [.systemPink, .systemOrange, .systemYellow, .systemBlue, .systemPurple]
    /// 배열의 아이템 값을 열거형의 String 타입 원시값으로 설정하고 이걸 identifier처럼 사용해도 될듯?
    var moodLabelTitle: [String] = ["Super Happy", "Happy", "So So","Sad", "Super Sad"]
    /// 이걸로  MoodCheckVC에서 화면전환 할 때 데이터 넘길 때 여기에 값 넣어서 label에 값 넣으면 될 듯...?
        var moodCountDictionary: [String: Int] = ["Super Happy": 0, "Happy": 0, "So So": 0, "Sad": 0, "Super Sad": 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTitleLabel()
        configureMoodview()
        configureMoodLabel()
        configureCountLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 여기서 우측 라벨의 값(버튼눌린 횟수) 업데이트 메서드 호출하면 될 듯
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
//
//    func showMyMoodCount() {
//        for i in 0..<moodCount.moodCountDictionary.keys.count {
//            guard let moodValue = Mood(rawValue: i), let emotionCount = moodCount.moodCountDictionary[moodValue.myMood] else { return }
//
//            switch moodValue {
//            case .superHappy:
//                countLabelCollection[i].text = "\(emotionCount)번"
//            case .happy:
//                countLabelCollection[i].text = "\(emotionCount)번"
//            case .soso:
//                countLabelCollection[i].text = "\(emotionCount)번"
//            case .sad:
//                countLabelCollection[i].text = "\(emotionCount)번"
//            case .superSad:
//                countLabelCollection[i].text = "\(emotionCount)번"
//            }
//        }
//    }
}

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
    
    
    
    /// 이 버튼이 눌릴 때 마다 StatVC의 딕셔너리에 값을 할당하면 됨. => 이걸 하려면 StatVC 인스턴스가 필요하고, StatVC에 있는 딕셔너리에 접근하기 위해 딕셔너리의 키와 똑같은 값을 가지는 enum case를 사용해야함.(dictionary[enumCaseName] = 내 감정Count)
    @IBAction func moodButtonTapped(_ sender: UIButton) {
        /// 열거형 사용하면 default 없어져서 더 깔끔할 듯.
        
        switch sender.tag {
        case 0:
            superHappyCount += 1

        case 1:
            happyCount += 1
        case 2:
            sosoCount += 1
        case 3:
            sadCount += 1
        case 4:
            superSadCount += 1
        default:
            print("내 기분이 어떤지 모르겠음.")
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


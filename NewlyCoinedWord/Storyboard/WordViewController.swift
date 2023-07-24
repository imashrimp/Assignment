//
//  WordViewController.swift
//  NewlyCoinedWord
//
//  Created by 권현석 on 2023/07/21.
//

import UIKit

class WordViewController: UIViewController {

    @IBOutlet var testImageView: UIImageView!
    @IBOutlet var wordTextField: UITextField!
    @IBOutlet var explanationLabel: UILabel!
    @IBOutlet var firstKeywordButton: UIButton!
    @IBOutlet var secondKeywordButton: UIButton!
    @IBOutlet var thirdKeywordButton: UIButton!
    
    let newWordArray: [String] = ["맑눈광", "하남자", "이왜진", "쩝쩝박사", "중꺽마"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonconfigure()
        
        wordTextField.text = getRandomWord()
        getRandomWord()
        
        firstKeywordButton.isHidden = true
        
        }
    
    @discardableResult // 아이템을 써도되고 안써도 되는 두 가지 상황 모두 대비 가능 => 이거 공부하기
    func getRandomWord() -> String {
        let random = ["김승종", "강경순", "박지홍", "카를로스", "김민선"]
        let result = random.randomElement()!
        print(result)
        return result

    }
    
    func buttonconfigure() {
        firstKeywordButton.titleLabel?.font = .systemFont(ofSize: 20)
        firstKeywordButton.titleLabel?.textColor = .white
        secondKeywordButton.titleLabel?.textColor = .yellow
        thirdKeywordButton.titleLabel?.textColor = .yellow
        
        explanationLabel.numberOfLines = 0
    }
    
    @IBAction func wordButtonTapped(_ sender: UIButton) {
        wordTextField.text = sender.currentTitle
        textFieldKeyboardTapped(wordTextField)
    }
    
    @IBAction func textFieldKeyboardTapped(_ sender: UITextField)  {
        
        if wordTextField.text == "매튜아저씨" {
            explanationLabel.text = "5 years in a row Fittest man on the earth."
        } else if wordTextField.text == "오브라이언" {
            explanationLabel.text = "매튜 아저씨 제자이자 차세대 Fittest woman on the earth."
        } else if wordTextField.text == "리치아저씨" {
            explanationLabel.text = "메이햄 주인 아저씨."
        } else {
            explanationLabel.text = "티아 아줌마는...?"
        }
        
//        switch wordTextField.text {
//        case "매튜아저씨":
//            explanationLabel.text = "5 years in a row Fittest man on the earth."
//        case "오브라이언":
//            explanationLabel.text = "매튜 아저씨 제자이자 차세대 Fittest woman on the earth."
//        case "리치아저씨":
//            explanationLabel.text = "메이햄 주인 아저씨."
//        default:
//            explanationLabel.text = "티아 아줌마는...?"
//        }
        

    }
}

//
//  NewWordSearchViewController.swift
//  NewlyCoinedWord
//
//  Created by 권현석 on 2023/07/23.
//

import UIKit

// .systemCyan이 iOS 15.0 이후 버전부터 가능해서 붙임
//@available(iOS 15.0, *)
class NewWordSearchViewController: UIViewController {

    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var firstRelatedWordButton: UIButton!
    @IBOutlet var secondRelatedWordButton: UIButton!
    @IBOutlet var thirdRelatedWordButton: UIButton!
    @IBOutlet var fourthRelatedWordButton: UIButton!
    @IBOutlet var fifthRelatedWordButton: UIButton!
    @IBOutlet var explanationLabel: UILabel!
    
    
    var newWordArray: [String] = ["맑눈광", "하남자", "이왜진", "쩝쩝박사", "중꺾마"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchTextField()
        configureSearchButton()
        configureRelatedWordButton(wordButton: firstRelatedWordButton, backgroundColor: .systemBlue, newWord: newWordArray[0], textColor: .systemYellow)
        configureRelatedWordButton(wordButton: secondRelatedWordButton, backgroundColor: .systemPink, newWord: newWordArray[1], textColor: .white)
        if #available(iOS 15.0, *) {
            configureRelatedWordButton(wordButton: thirdRelatedWordButton, backgroundColor: .cyan, newWord: newWordArray[2], textColor: .systemPink)
        } else {
            configureRelatedWordButton(wordButton: thirdRelatedWordButton, backgroundColor: .systemFill, newWord: newWordArray[2], textColor: .systemGreen)
        }
        configureRelatedWordButton(wordButton: fourthRelatedWordButton, backgroundColor: .systemOrange, newWord: newWordArray[3], textColor: .black)
        configureRelatedWordButton(wordButton: fifthRelatedWordButton, backgroundColor: .brown, newWord: newWordArray[4], textColor: .blue)
        configureExplantionLabel()
    }
    
    @IBAction func tapScreenToDismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    

    @IBAction func searchButtonTapped(_ sender: UIButton) {
        switch searchTextField.text {
        case "맑눈광":
            explanationLabel.text = #""맑은 눈의 광인"을 뜻하는 말로 맑은 눈에서 광기가 느껴지는 사람을 가리킴."#
        case "하남자":
            explanationLabel.text = "상남자의 반대 의미."
        case "이왜진":
            explanationLabel.text = #""이거 왜 진짜임?"의 줄임말로 상식을 벗어난 내용이 사실일때 사용."#
        case "쩝쩝박사":
            explanationLabel.text = "맛있는 음식 조합을 잘 아는 사람을 가리킬 때 쓰는 말."
        case "중꺾마":
            explanationLabel.text = #"중요한건 꺾이지 않은 마음"의 줄임말로 무언가를 할 때 끈기를 갖고 한다면 위기의 상황도 역전할 수 있음을 의미."#
        default:
            explanationLabel.text = "검색어에 대한 설명을 찾을 수 없습니다."
        }
        mixNewWordOrder()
    }
    
    
    @IBAction func wordButtonTapped(_ sender: UIButton) {
        searchTextField.text = sender.currentTitle
        searchButtonTapped(searchButton)
    }
    
    
    @IBAction func textFieldkeyboardTapped(_ sender: UITextField) {
        searchButtonTapped(searchButton)
    }
    
    func configureSearchTextField() {
        searchTextField.backgroundColor = .black
        searchTextField.textColor = .white
        searchTextField.attributedPlaceholder = NSAttributedString(string: "신조어를 입력하세요.", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        searchTextField.font = .systemFont(ofSize: 20)
    }
    
    func configureSearchButton() {
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.setTitle("", for: .normal)
        searchButton.backgroundColor = .systemYellow
        searchButton.tintColor = .black
        searchButton.layer.cornerRadius = 8
    }
    
    func configureRelatedWordButton(wordButton: UIButton,
                                    backgroundColor: UIColor,
                                    newWord: String?,
                                    textColor: UIColor) {
        wordButton.layer.cornerRadius = 5
        wordButton.titleLabel?.font = .systemFont(ofSize: 18)
        wordButton.backgroundColor = backgroundColor
        wordButton.setTitle(newWord, for: .normal)
        wordButton.setTitleColor(textColor, for: .normal)
    }
    
    func configureExplantionLabel() {
        explanationLabel.textAlignment = .center
        explanationLabel.font = .systemFont(ofSize: 25)
        explanationLabel.backgroundColor = .systemBlue
        explanationLabel.textColor = .yellow
        explanationLabel.clipsToBounds = true
        explanationLabel.layer.cornerRadius = 5
        explanationLabel.text = "신조어가 무슨 뜻인지 알려드림."
        explanationLabel.numberOfLines = 0
    }
    
    func mixNewWordOrder() {
        newWordArray.shuffle()
        
        let wordButtonArray: [UIButton] = [firstRelatedWordButton, secondRelatedWordButton, thirdRelatedWordButton, fourthRelatedWordButton, fifthRelatedWordButton]
        
        for i in 0..<wordButtonArray.count {
            wordButtonArray[i].setTitle(newWordArray[i], for: .normal)
        }
    }
    
}

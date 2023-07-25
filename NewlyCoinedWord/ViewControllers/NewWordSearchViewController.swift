//
//  NewWordSearchViewController.swift
//  NewlyCoinedWord
//
//  Created by 권현석 on 2023/07/23.
//

import UIKit

class NewWordSearchViewController: UIViewController {
    
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var firstRelatedWordButton: UIButton!
    @IBOutlet var secondRelatedWordButton: UIButton!
    @IBOutlet var thirdRelatedWordButton: UIButton!
    @IBOutlet var fourthRelatedWordButton: UIButton!
    @IBOutlet var fifthRelatedWordButton: UIButton!
    @IBOutlet var explanationLabel: UILabel!
    
    var newWordList = NewWord.allCases
    var newWordDictionary: [String : String] = ["맑눈광" : #""맑은 눈의 광인"을 뜻하는 말로 맑은 눈에서 광기가 느껴지는 사람을 가리킴."#,
                                                "하남자" : "상남자의 반대 의미.",
                                                "이왜진" : #""이거 왜 진짜임?"의 줄임말로 상식을 벗어난 내용이 사실일때 사용."#,
                                                "쩝쩝박사" : "맛있는 음식 조합을 잘 아는 사람을 가리킬 때 쓰는 말.",
                                                "중꺾마" : #"중요한건 꺾이지 않은 마음"의 줄임말로 무언가를 할 때 끈기를 갖고 한다면 위기의 상황도 역전할 수 있음을 의미."#]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSearchTextField()
        configureSearchButton()
        configureWordButton(wordButton: firstRelatedWordButton, backgroundColor: .systemBlue, textColor: .systemYellow)
        configureWordButton(wordButton: secondRelatedWordButton, backgroundColor: .systemPink, textColor: .white)
        configureWordButton(wordButton: thirdRelatedWordButton, backgroundColor: .cyan, textColor: .systemPink)
        configureWordButton(wordButton: fourthRelatedWordButton, backgroundColor: .systemOrange, textColor: .black)
        configureWordButton(wordButton: fifthRelatedWordButton, backgroundColor: .brown, textColor: .blue)
        setWordButtonAtFirst()
        configureExplantionLabel()
    }
    
    @IBAction func tapScreenToDismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        
        guard let keyWord = searchTextField.text else { return }
        //TODO: 예외처리해야함
        for i in 0..<newWordList.count {
            if keyWord == "\(newWordList[i])" {
                explanationLabel.text = newWordList[i].rawValue
            }
        }
        
//        if let searchText = searchTextField.text {
//            if newWordDictionary.keys.contains(searchText) {
//                explanationLabel.text = newWordDictionary[searchText]
//            } else if  searchText.count <= 1 {
//                let alert = UIAlertController(title: "알림", message: "검색어가 너무 짧습니다.", preferredStyle: .alert)
//                let ok = UIAlertAction(title: "다시 검색하기", style: .default)
//                alert.addAction(ok)
//                present(alert, animated: true)
//                explanationLabel.text = "신조어가 무슨 뜻인지 알려드림."
//                searchTextField.text = ""
//            } else if newWordDictionary.keys.contains(searchText) == false {
//                explanationLabel.text = "검색어에 대한 설명을 찾을 수 없습니다."
//            }
//        }
//        setWordButtonAtFirst()
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
    
    func configureWordButton(wordButton: UIButton,
                             backgroundColor: UIColor,
                             textColor: UIColor) {
        wordButton.layer.cornerRadius = 5
        wordButton.titleLabel?.font = .systemFont(ofSize: 18)
        wordButton.backgroundColor = backgroundColor
        wordButton.setTitleColor(textColor, for: .normal)
    }
    
    func setWordButtonAtFirst() {
        let wordButtonArray: [UIButton] = [firstRelatedWordButton, secondRelatedWordButton, thirdRelatedWordButton, fourthRelatedWordButton, fifthRelatedWordButton]


        newWordList.shuffle()
        
        for wordButton in wordButtonArray {
            wordButton.setTitle("\(newWordList[wordButton.tag])", for: .normal)
        }
    }
}

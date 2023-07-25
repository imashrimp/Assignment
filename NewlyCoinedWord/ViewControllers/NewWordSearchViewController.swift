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
        
        if let newWord = NewWord(rawValue: keyWord) {
            explanationLabel.text = newWord.content
        } else if keyWord.count <= 1 {
            let alert = UIAlertController(title: "알림", message: "검색어가 너무 짧습니다.", preferredStyle: .alert)
                            let ok = UIAlertAction(title: "다시 검색하기", style: .default)
                            alert.addAction(ok)
                            present(alert, animated: true)
                            explanationLabel.text = "신조어가 무슨 뜻인지 알려드림."
                            searchTextField.text = ""
        } else {
            explanationLabel.text = "검색어에 대한 설명을 찾을 수 없습니다."
        }
        
        setWordButtonAtFirst()
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
        var newWordList = NewWord.allCases
        
        newWordList.shuffle()
        
        for wordButton in wordButtonArray {
            wordButton.setTitle("\(newWordList[wordButton.tag])", for: .normal)
        }
    }
}

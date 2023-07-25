//
//  NewlyCoinedWordViewController.swift
//  NewlyCoinedWord
//
//  Created by 권현석 on 2023/07/20.
//

import UIKit

class NewlyCoinedWordViewController: UIViewController {

    @IBOutlet var searchBarTextField: UITextField!
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var relatedWordLabelCollection: [UILabel]!
    @IBOutlet var explanationLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiConfigure()

    }
    
    func uiConfigure() {
        searchBarTextField.placeholder = "신조어를 입력하세요"
        searchBarTextField.layer.borderWidth = 2
        
        let buttonImage = UIImage(systemName: "magnifyingglass")
        searchButton.setImage(buttonImage, for: .normal) // 이거 버튼에 계속 텍스트가 들어가있네?
        searchButton.backgroundColor = .black
        searchButton.tintColor = .white
        
        for item in relatedWordLabelCollection {
            item.layer.cornerRadius = 5
            item.layer.borderWidth = 2
            item.clipsToBounds = true
//            item.text = "여기에 신조어 String 배열의 아이템 랜덤으로 넣기"
        }
        
        explanationLabel.layer.cornerRadius = 10
        explanationLabel.layer.borderWidth = 2
        explanationLabel.clipsToBounds = true
        explanationLabel.textAlignment = .center
    }


}

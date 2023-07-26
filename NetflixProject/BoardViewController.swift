//
//  BoardViewController.swift
//  NetflixProject
//
//  Created by 권현석 on 2023/07/19.
//

import UIKit

class BoardViewController: UIViewController {
    
    
    @IBOutlet var test: [UIButton]!
    
    @IBOutlet var testLabel: [UILabel]!
    
    @IBOutlet var boardTextField: UITextField!
    
    @IBOutlet var boardLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for item in testLabel {
            item.textColor = .red
            item.font = .boldSystemFont(ofSize: 15)
        }
        
        
        designResultLabel()
        designTextField()
    }
    
    @IBAction func checkButtonClicked(_ sender: UIButton) {
        boardLabel.text = boardTextField.text
        boardTextField.text = ""
    }


    /// 키보드 내리기
    @IBAction func tapGestureTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    

    func designResultLabel() {
        boardLabel.textAlignment = .center
        boardLabel.text = "안녕하세요."
        boardLabel.font = .boldSystemFont(ofSize: 20)
        boardLabel.textColor = .brown
        boardLabel.numberOfLines = 0
    }
    
    func designTextField() {
        boardTextField.placeholder = "내용을 입력해주세요."
        boardTextField.textColor = .brown
        boardTextField.keyboardType = .emailAddress
        boardTextField.borderStyle = .line
        
    }
    
    
}

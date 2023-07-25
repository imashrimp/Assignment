//
//  ViewController.swift
//  LEDBoard
//
//  Created by 권현석 on 2023/07/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var topView: UIView!
    @IBOutlet var topTextField: UITextField!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var changeColorButton: UIButton!
    @IBOutlet var mainBoardLabel: UILabel!
    
    var randomColor: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        customViewConfigure(view: topView)
        textFieldConfigure(textField: topTextField, placeholderText: "문구를 입력하세요.", fontSize: 28)
        topButtonConfigure()
        labelConfigure()
    }
    
    
    @IBAction func changeTextColorTapped(_ sender: UIButton) {
        mainBoardLabel.textColor = randomColor
    }
    
    
    @IBAction func showTextOnLabel(_ sender: UIButton) {
        
        guard let keyword = topTextField.text else { return }
        
        if keyword.count > 0 {
            mainBoardLabel.text = topTextField.text
        } else {
            let alert = UIAlertController(title: "알림", message: "입력된 값이 없습니다.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default)
            alert.addAction(ok)
            present(alert, animated: true)
        }
                
    }
    
    @IBAction func tapReturnToDismissKeyboard(_ sender: UITextField) {
    }
    
    @IBAction func tapScreenToDismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func tapScreenToHideTopView(_ sender: UITapGestureRecognizer) {
        topView.isHidden.toggle()
    }
    
    func customViewConfigure(view: UIView) {
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
    }
    
    func textFieldConfigure(textField: UITextField, placeholderText: String, fontSize: Int) {
        textField.backgroundColor = .white
        textField.borderStyle = .none
        textField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        textField.font = .systemFont(ofSize: CGFloat(fontSize))
        textField.textColor = .black
    }
    
    func topButtonConfigure() {
        changeColorButton.layer.cornerRadius = 5
        changeColorButton.backgroundColor = .red
        changeColorButton.setTitle("색 변경", for: .normal)
        changeColorButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        changeColorButton.setTitleColor(.yellow, for: .normal)

        sendButton.layer.cornerRadius = 5
        sendButton.backgroundColor = .blue
        sendButton.setTitle("입력 완료", for: .normal)
        sendButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        sendButton.setTitleColor(.yellow, for: .normal)

    }
    
    //TODO: 입력문구 길 경우 처리
    func labelConfigure() {
        mainBoardLabel.backgroundColor = .clear
        mainBoardLabel.textColor = .white
        mainBoardLabel.font = .systemFont(ofSize: 110, weight: .bold)
        mainBoardLabel.text = "전광판에 문구를 입력하세요."
        mainBoardLabel.numberOfLines = 0
        mainBoardLabel.textAlignment = .center
        mainBoardLabel.isUserInteractionEnabled = true
    }

}


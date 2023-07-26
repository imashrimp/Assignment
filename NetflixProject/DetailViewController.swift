//
//  DetailViewController.swift
//  NetflixProject
//
//  Created by 권현석 on 2023/07/19.
//

import UIKit

enum TextFieldType: Int {
    case email = 0
    case password = 1
    case nickname = 2
    case location = 3
    case promoCode = 4
}

class DetailViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var userInfoTextfieldCollection: [UITextField]!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var additionalInfoLabel: UILabel!
    @IBOutlet var switchButton: UISwitch!
    
    var textFieldPlaceHolderTextArray: [String] = ["이메일 주소 또는 전화번호", "비밀번호", "닉네임", "국가", "추천코드 입력"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        setTitle(myLable: titleLabel,
                 color: .red,
                 title: "SHIMFLIX",
                 fontSize: 40,
                 fontStyle: .bold,
                 textAlignment: .center)
        
        configureTextField(placeholderColor: .white,
                           backgroundColor: .lightGray,
                           textAlignment: .center,
                           borderStyle: .roundedRect)
        
        setSignUpButton(title: "회원가입",
                        backgroundColor: .white,
                        titleColor: .black,
                        fontSize: 23,
                        fontWeight: .heavy,
                        cornerRadiusPoint: 8)
        
        configureAddtionalInfoLabel(title: "추가 정보 입력",
                                    backgroundColor: .gray,
                                    fontSize: 18,
                                    cornerRadiusPoint: 5)
        
        setSwitchButton(onTintColor: .red,
                        thumbTintColor: .white)
        
        // 여기에 UserDefaults 사용해서 사용자 정보 나타내기
    }
    
    @IBAction func unwindToMain(_ sender: UIStoryboardSegue) {
        
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        
        //        UserDefaults.standard.set(emailTextField.text!, forKey: "email")
        //        UserDefaults.standard.set(passwordTextField.text!, forKey: "password")
        //        UserDefaults.standard.set(nicknameTextField.text!, forKey: "nickname")
        //        UserDefaults.standard.set(locationTextField.text, forKey: "location")
        //        UserDefaults.standard.set(promoCodeTextField.tag, forKey: "promoCode")
        
        for i in 0..<userInfoTextfieldCollection.count {
            if let userInfo = userInfoTextfieldCollection[i].text {
                if userInfo.isEmpty {
                    let alert = UIAlertController(title: "알림",
                                                  message: "사용자 정보를 입력하세요.",
                                                  preferredStyle: .alert)
                    
                    let ok = UIAlertAction(title: "확인", style: .default)
                    alert.addAction(ok)
                    present(alert, animated: true)
                    return
                }
            }
        }
        self.performSegue(withIdentifier: "toMovieVC", sender: sender)
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func keyBoardTapped(_ sender: UITextField) {
        print("\(sender.tag)")
        
        guard let text = sender.text, let value = TextFieldType(rawValue: sender.tag) else {
            print("오류가 발생했습니다.")
            return
        }
        
        switch value {
        case .email:
            print("이메일은 \(text)입니다.")
        case .password:
            print("비밀번호는 \(text)입니다.")
        case .nickname:
            print("별명은 \(text)입니다.")
        case .location:
            print("위치는 \(text)입니다.")
        case .promoCode:
            print("추천 코드는 \(text)입니다.")
        }
        
        //        switch sender.tag {
        //        case TextFieldType.email.rawValue:
        //            print("이메일은 \(text)입니다.")
        //        case TextFieldType.password.rawValue:
        //            print("비밀번호는 \(text)입니다.")
        //        case TextFieldType.nickname.rawValue:
        //            print("별명은 \(text)입니다.")
        //        case TextFieldType.location.rawValue:
        //            print("위치는 \(text)입니다.")
        //        case TextFieldType.promoCode.rawValue:
        //            print("추천 코드는 \(text)입니다.")
        //        default: print("오류 발생!!!")
        //        }
        
        //        if sender.tag == TextFieldType.email.rawValue {
        //            print("이메일은 \(text)")
        //        } else if sender.tag == TextFieldType.password.rawValue {
        //            print("비밀번호는 \(text)")
        //        } else if sender.tag == TextFieldType.nickname.rawValue {
        //            print("닉네임은 \(text)")
        //        } else if sender.tag == TextFieldType.location.rawValue {
        //            print("위치는 \(text)")
        //        } else if sender.tag == TextFieldType.promoCode.rawValue {
        //            print("추천코드는 \(text)")
        //        }
    }
    
    func setTitle(myLable: UILabel, color: UIColor, title: String, fontSize: CGFloat, fontStyle: UIFont.Weight, textAlignment: NSTextAlignment) {
        myLable.text = title
        myLable.textColor = color
        myLable.font = .systemFont(ofSize: fontSize, weight: fontStyle)
        myLable.textAlignment = textAlignment
    }
    
    func setTextField(textField: UITextField, placeholderText: String, tagNumber: Int) {
        textField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.tag = tagNumber
        textField.backgroundColor = .lightGray
        textField.textAlignment = .center
        textField.keyboardType = .default
        textField.borderStyle = .roundedRect
        
    }
    
    func configureTextField( placeholderColor: UIColor, backgroundColor: UIColor, textAlignment: NSTextAlignment, borderStyle: UITextField.BorderStyle) {
        for i in 0..<userInfoTextfieldCollection.count {
            userInfoTextfieldCollection[i].attributedPlaceholder = NSAttributedString(string: textFieldPlaceHolderTextArray[i], attributes: [NSAttributedString.Key.foregroundColor : placeholderColor])
            userInfoTextfieldCollection[i].backgroundColor = backgroundColor
            userInfoTextfieldCollection[i].textAlignment = textAlignment
            userInfoTextfieldCollection[i].borderStyle = borderStyle
            userInfoTextfieldCollection[i].tag = i
        }
        userInfoTextfieldCollection[1].isSecureTextEntry = true
    }
    
    func setSignUpButton(title: String, backgroundColor: UIColor, titleColor: UIColor, fontSize: CGFloat, fontWeight: UIFont.Weight, cornerRadiusPoint: CGFloat) {
        signUpButton.setTitle(title, for: .normal)
        signUpButton.backgroundColor = backgroundColor
        signUpButton.setTitleColor(titleColor, for: .normal)
        signUpButton.titleLabel?.font = .systemFont(ofSize: fontSize, weight: fontWeight)
        signUpButton.layer.cornerRadius = cornerRadiusPoint
    }
    
    func configureAddtionalInfoLabel(title: String, backgroundColor: UIColor, fontSize: CGFloat, cornerRadiusPoint: CGFloat) {
        additionalInfoLabel.text = title
        additionalInfoLabel.backgroundColor = backgroundColor
        additionalInfoLabel.font = .systemFont(ofSize: fontSize)
        additionalInfoLabel.layer.cornerRadius = cornerRadiusPoint
        additionalInfoLabel.clipsToBounds = true
    }
    
    func setSwitchButton(onTintColor: UIColor, thumbTintColor: UIColor) {
        switchButton.setOn(true, animated: true)
        switchButton.onTintColor = onTintColor
        switchButton.thumbTintColor = thumbTintColor
    }
    
}

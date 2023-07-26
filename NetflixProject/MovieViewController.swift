//
//  MovieViewController.swift
//  NetflixProject
//
//  Created by 권현석 on 2023/07/19.
//

import UIKit

class MovieViewController: UIViewController {
    
    let movieArray: [String] = ["극한직업", "도둑들", "명량", "베테랑", "부산행", "신과함께인과연", "신과함께죄와벌", "아바타", "알라딘", "암살", "어벤져스엔드게임", "왕의남자", "태극기휘날리며", "해운대", "택시운전사"]
    
    var randomColor: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }

    @IBOutlet var logOut: UIButton!
    @IBOutlet var previewImageCollection: [UIImageView]!
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var randomPlayButton: UIButton!
    @IBOutlet var informationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in previewImageCollection {
            setPreviewImage(i, borderColor: UIColor.red.cgColor)
        }
        
        setPlayButton()
        showRandomMovie()
        configureLogOutButton(title: "로그아웃", backgroundColor: .white, titleColor: .red, cornerRadiusPoint: 5, fontSize: 20)
    }
    
    func setPreviewImage(_ imageView: UIImageView, borderColor: CGColor) {
        imageView.layer.cornerRadius = 30
        imageView.layer.borderColor = borderColor
        imageView.layer.borderWidth = 5
        imageView.backgroundColor = .blue
        imageView.contentMode = .scaleAspectFill
    }
    
    
    @IBAction func logOutTapped(_ sender: UIButton) {
        
    }
    
    
    @IBAction func likeButtonTapped(_ sender: UIButton) {
        
        // 1.
        let alert = UIAlertController(title: "허용", message: "무언가를 허용하세요!", preferredStyle: .alert)
        // 2.
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default)
        
        // 3.
        alert.addAction(cancel)
        alert.addAction(ok)
        
        // 4.
        present(alert, animated: true)
    }
    
    @IBAction func randomPlayButtonTapped(_ sender: UIButton) {
      showRandomMovie()
    }
    
    func showRandomMovie() {
        
        let result1 = movieArray.randomElement()
        let result2 = movieArray.randomElement()
        let result3 = movieArray.randomElement()
        let result4 = movieArray.randomElement()
        
        previewImageCollection[0].image = UIImage(named: result1!)
        previewImageCollection[0].layer.borderColor = randomColor.cgColor
        previewImageCollection[1].image = UIImage(named: result2!)
        previewImageCollection[1].layer.borderColor = randomColor.cgColor
        previewImageCollection[2].image = UIImage(named: result3!)
        previewImageCollection[2].layer.borderColor = randomColor.cgColor
        
        posterImageView.image = UIImage(named: result4!)
    }
    
    func setPlayButton() {
        
        randomPlayButton.setImage(UIImage(named: "play_normal"), for: .normal)
        randomPlayButton.setImage(UIImage(named: "play_highlighted"), for: .highlighted)
        
        randomPlayButton.layer.cornerRadius = 10
        randomPlayButton.layer.borderColor = UIColor.red.cgColor
        randomPlayButton.layer.borderWidth = 4
    }
    
    func configureLogOutButton(title: String, backgroundColor: UIColor, titleColor: UIColor, cornerRadiusPoint: CGFloat, fontSize: CGFloat ) {
        logOut.setTitle(title, for: .normal)
        logOut.backgroundColor = backgroundColor
        logOut.setTitleColor(titleColor, for: .normal)
        logOut.layer.cornerRadius = cornerRadiusPoint
        logOut.titleLabel?.font = .systemFont(ofSize: fontSize)
    }
}

//
//  DateViewController.swift
//  NewlyCoinedWord
//
//  Created by 권현석 on 2023/07/20.
//

import UIKit

class DateViewController: UIViewController {
    
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var d100Label: UILabel!
    @IBOutlet var d200Label: UILabel!
    @IBOutlet var d300Label: UILabel!
    @IBOutlet var d400Label: UILabel!
    @IBOutlet var imageViewCollection: [UIImageView]!
    @IBOutlet var d100Day: UILabel!
    @IBOutlet var d200Day: UILabel!
    @IBOutlet var d300Day: UILabel!
    @IBOutlet var d400Day: UILabel!
    @IBOutlet var changeImageButton: UIButton!
    @IBOutlet var d100View: UIView!
    @IBOutlet var d200View: UIView!
    @IBOutlet var d300View: UIView!
    @IBOutlet var d400View: UIView!
    
    
    let imageArray: [String] = ["mono_baedal01", "mono_baedal04", "mono_baedal07", "mono_baedal08"]
    
    var randomImage: String? {
        return imageArray.randomElement()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDatePicker()
        UIConfigure()
        datePickeValueChanged(datePicker)
    }
    
    @IBAction func datePickeValueChanged(_ sender: UIDatePicker) {
        
        // +100일 뒤
        let d100Day = Calendar.current.date(byAdding: .day, value: 100, to: sender.date)
        let d200Day = Calendar.current.date(byAdding: .day, value: 200, to: sender.date)
        let d300Day = Calendar.current.date(byAdding: .day, value: 300, to: sender.date)
        let d400Day = Calendar.current.date(byAdding: .day, value: 400, to: sender.date)
        
        // DateFormatter: 1. 시간대 변경 2. 날짜 포맷 변경
        let formatter = DateFormatter()
        formatter.dateFormat = "yy년 MM월 dd일"
        let d100 = formatter.string(from: d100Day!)
        let d200 = formatter.string(from: d200Day!)
        let d300 = formatter.string(from: d300Day!)
        let d400 = formatter.string(from: d400Day!)

        
        self.d100Day.text = d100
        self.d200Day.text = d200
        self.d300Day.text = d300
        self.d400Day.text = d400
        
    }
    
    @IBAction func changeImageButtonTapped(_ sender: UIButton) {
        for myImage in imageViewCollection {
            myImage.image = UIImage(named: randomImage!)
        }
    }
    
    
    func UIConfigure() {
        
        d100View.layer.shadowOffset = CGSize(width: 10, height: 10)
        d100View.layer.shadowOpacity = 0.5
        d200View.layer.shadowOffset = CGSize(width: 10, height: 10)
        d200View.layer.shadowOpacity = 0.5
        d300View.layer.shadowOffset = CGSize(width: 10, height: 10)
        d300View.layer.shadowOpacity = 0.5
        d400View.layer.shadowOffset = CGSize(width: 10, height: 10)
        d400View.layer.shadowOpacity = 0.5
        
        setDday(label: d100Label, dDay: 100)
        setDday(label: d200Label, dDay: 200)
        setDday(label: d300Label, dDay: 300)
        setDday(label: d400Label, dDay: 400)
        
        for myImage in imageViewCollection {
            myImage.layer.cornerRadius = 20
            myImage.layer.shadowColor = UIColor.black.cgColor
            myImage.layer.shadowRadius = 10
            myImage.clipsToBounds = true // 이미지 뷰는 false true 뭘 해야하지?
            myImage.image = UIImage(named: randomImage!)
        }
        
        
        setCalculatedLabel(label: d100Day, text: "날짜를 선택하세요.")
        setCalculatedLabel(label: d200Day, text: "날짜를 선택하세요.")
        setCalculatedLabel(label: d300Day, text: "날짜를 선택하세요.")
        setCalculatedLabel(label: d400Day, text: "날짜를 선택하세요.")
        
        changeImageButton.setTitle("Roll", for: .normal)
        changeImageButton.setTitleColor(.white, for: .normal)
        changeImageButton.backgroundColor = .orange
        changeImageButton.layer.cornerRadius = 10
    }
    
    func setDatePicker() {
        
        datePicker.tintColor = .systemRed
        
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .inline
        } else {
            datePicker.preferredDatePickerStyle = .wheels
        }
    }
    
    func setDday(label: UILabel, dDay: Int) {
        label.text = "D + \(dDay)"
    }
    
    func setCalculatedLabel(label: UILabel, text: String) {
        label.text = text
        label.textColor = .red
        label.font = .systemFont(ofSize: 20)
    }
}

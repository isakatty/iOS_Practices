//
//  ViewController.swift
//  BMICalculator
//
//  Created by Jisoo Ham on 5/21/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var bgImageView: UIImageView!
    
    @IBOutlet var heightDescriptionLabel: UILabel!
    @IBOutlet var heightTextField: UITextField!
    
    @IBOutlet var weightDescriptionLabel: UILabel!
    @IBOutlet var weightTextField: UITextField!
    
    @IBOutlet var randomBMIButton: UIButton!
    @IBOutlet var calculateBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    
    @IBAction func randomBtnTapped(_ sender: UIButton) {
        
        
    }
    

    func configureUI() {
        configureLabelUI(label: titleLabel, text: "BMI Calculator", fontSize: 17, fontWeight: .bold)
        configureLabelUI(label: descriptionLabel, text: "당신의 BMI 지수를\n알려드릴게요.", fontSize: 13, fontWeight: .medium)
        configureLabelUI(label: heightDescriptionLabel, text: "키가 어떻게 되니사요 ?", fontSize: 12, fontWeight: .medium)
        configureLabelUI(label: weightDescriptionLabel, text: "몸무게는 어떻게 되시나요?", fontSize: 12, fontWeight: .medium)
        configureTFUI(textField: heightTextField)
        configureTFUI(textField: weightTextField)
        configureBtnUI(btn: randomBMIButton, btnTitle: "랜덤으로 BMI 계산하기", fontColor: .red, fontSize: 13, fontWeight: .light, bgColor: .white)
        configureBtnUI(btn: calculateBtn, btnTitle: "결과 확인", fontColor: .white, fontSize: 15, fontWeight: .regular, bgColor: .purple)
        
        bgImageView.image = UIImage(named: "image")?.withRenderingMode(.alwaysOriginal)
        bgImageView.contentMode = .scaleToFill
        
    }
    
    func configureLabelUI(
        label: UILabel,
        text: String,
        fontSize: CGFloat,
        fontWeight: UIFont.Weight
    ) {
        label.numberOfLines = .zero
        label.text = text
        label.font = .systemFont(
            ofSize: fontSize,
            weight: fontWeight
        )
        label.textColor = .black
        label.textAlignment = .left
    }
    
    func configureTFUI(
        textField: UITextField
    ) {
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 3
        // 숫자 입력만 받게 하기
        textField.keyboardType = .numberPad
    }
    
    func configureBtnUI(
        btn: UIButton,
        btnTitle: String,
        fontColor: UIColor,
        fontSize: CGFloat,
        fontWeight: UIFont.Weight,
        bgColor: UIColor
    ) {
        btn.setTitle(btnTitle, for: .normal)
        btn.setTitleColor(fontColor, for: .normal)
        btn.backgroundColor = bgColor
        btn.titleLabel?.font = .systemFont(ofSize: fontSize, weight: fontWeight)
        btn.layer.cornerRadius = 10
    }
}


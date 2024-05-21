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
    
    
    @IBAction func calculateBtnTapped(_ sender: UIButton) {
        
        let gongbaek1 = heightTextField.text != ""
        let gongbaek2 = weightTextField.text != ""
        
        if gongbaek1 && gongbaek2 {
            if let height = Double(heightTextField.text!),
               let weight = Double(weightTextField.text!) {
                let result = calculateBMI(height: height, weight: weight)
                
                configureAlert(result: result, height: height, weight: weight)
            }
        } else {
            let alert = UIAlertController(title: "⚠️Error", message: "모두 입력하세요", preferredStyle: .alert)
            
            let btn = UIAlertAction(title: "확인", style: .destructive)
            alert.addAction(btn)
            
            present(alert, animated: true)
        }
        
    }
    
    
    @IBAction func viewOnTouched(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    
    @IBAction func randomBtnTapped(_ sender: UIButton) {
        let height = Double.random(in: 0...200)
        let weight = Double.random(in: 0...100)
    
        let result = calculateBMI(height: height, weight: weight)
        
        configureAlert(result: result, height: height, weight: weight)
    }
    
    func calculateBMI(
        height: Double,
        weight: Double
    ) -> String {
        let changedHeight = height * 0.01
        let result = weight / (changedHeight * changedHeight)
        
        return determineResult(value: result).rawValue
    }
    
    func determineResult(
        value: Double
    ) -> BMIResult {
        switch value {
        case ...18.5:
            return .underweight
        case 18.5..<22.9:
            return .normalweight
        case 22.9..<24.9:
            return .obesity
        case 25...:
            return .overweight
        default:
            return .errors
        }
    }
    
    func configureAlert(
        result: String,
        height: Double,
        weight: Double
    ) {
        let alert = UIAlertController(
            title: "BMI 계산 결과",
            message: "키: \(height)m 몸무게: \(weight) kg \n당신은 \(result)입니다.",
            preferredStyle: .alert
        )
        
        let button = UIAlertAction(title: "확인", style: .default)
        let button2 = UIAlertAction(title: "취소", style: .destructive)
        
        alert.addAction(button)
        alert.addAction(button2)
        
        present(alert, animated: true)
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

enum BMIResult: String {
    case obesity = "비만"
    case overweight = "과체중"
    case normalweight = "정상"
    case underweight = "저체중"
    case errors = "에러"
}

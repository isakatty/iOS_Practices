//
//  UIViewController+.swift
//  BMICalculator
//
//  Created by Jisoo Ham on 5/24/24.
//

import UIKit

extension UIViewController {
    func configureAlert(
        result: String,
        height: Double,
        weight: Double,
        nickname: String,
        alertTitle: String,
        alertMsg: String,
        alertStyle: UIAlertController.Style
    ) {
        let alert = UIAlertController(
            title: "BMI 계산 결과",
            message: "키: \(height)m 몸무게: \(weight) kg \n\(nickname)님은 \(result)입니다.",
            preferredStyle: .alert
        )
        
        let button = UIAlertAction(title: "확인", style: .default)
        let button2 = UIAlertAction(title: "취소", style: .destructive)
        
        alert.addAction(button)
        alert.addAction(button2)
        
        present(alert, animated: true)
    }
}

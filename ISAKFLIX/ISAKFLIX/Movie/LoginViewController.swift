//
//  LoginViewController.swift
//  ISAKFLIX
//
//  Created by Jisoo Ham on 5/16/24.
//

import UIKit

class LoginViewController: UIViewController {

    // TextField
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var pwTextField: UITextField!
    @IBOutlet var nickNameTextField: UITextField!
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var recommendTextField: UITextField!
    
    // Button
    @IBOutlet var loginBtn: UIButton!
    
    var email: String?
    var pw: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    
    @IBAction func emailTFEnterBtnTapped(_ sender: UITextField) {
        print("enter click")
        
        email = emailTextField.text
    }
    
    @IBAction func pwTFEnterBtnTapped(_ sender: UITextField) {
        print("enter click")
        
        pw = pwTextField.text
    }
    
    // MARK: 이렇게 되면 navigaion bar 영역이 전체 살아나는 이슈 발생.
    @IBAction func joinBtnTapped(_ sender: UIButton) {
        
        email = emailTextField.text
        pw = pwTextField.text
        
        let isAvailableEmail = email?.count ?? 0 > 0
        let isAvailabelPW = pw?.count ?? 0 > 5
        
        if isAvailableEmail && isAvailabelPW {
            guard let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") else { return }
            self.navigationController?.pushViewController(homeVC, animated: true)
        }
        
    }
    
    func configureUI() {
        configTF(
            textFieldName: emailTextField,
            tfBgColor: .lightGray,
            tfPlaceholderText: "이메일 주소",
            tfTextColor: .white
        )
        emailTextField.keyboardType = .emailAddress
        
        configTF(
            textFieldName: pwTextField,
            tfBgColor: .lightGray,
            tfPlaceholderText: "비밀번호(6자리 이상의 숫자만 가능)",
            tfTextColor: .white
        )
        pwTextField.keyboardType = .numberPad
        configTF(
            textFieldName: nickNameTextField,
            tfBgColor: .lightGray,
            tfPlaceholderText: "닉네임",
            tfTextColor: .white
        )
        configTF(
            textFieldName: locationTextField,
            tfBgColor: .lightGray,
            tfPlaceholderText: "위치",
            tfTextColor: .white
        )
        configTF(
            textFieldName: recommendTextField,
            tfBgColor: .lightGray,
            tfPlaceholderText: "추천 코드",
            tfTextColor: .white
        )
    }
    
    private func configTF(
        textFieldName: UITextField,
        tfBgColor: UIColor,
        tfPlaceholderText: String,
        tfTextColor: UIColor
    ) {
        textFieldName.placeholder = tfPlaceholderText
        textFieldName.backgroundColor = tfBgColor
        textFieldName.textColor = tfTextColor
        
        textFieldName.borderStyle = .roundedRect
    }

}

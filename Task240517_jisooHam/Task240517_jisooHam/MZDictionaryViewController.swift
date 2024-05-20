//
//  MZDictionaryViewController.swift
//  Task240517_jisooHam
//
//  Created by Jisoo Ham on 5/18/24.
//

import UIKit


/*
 TODO: -
 1. UI구성
 2. 신조어 데이터 마련
    (배열, 딕셔너리 등)
 3. 기능
    - 검색 -> search btn -> label에 내용 나오기
    - TF 밑 버튼 클릭 -> label에 내용 나오기
 4. TapGesture에 의해 키보드 dismiss
 */

final public class MZDictionaryViewController: UIViewController {

    let mzDictionary: [MZWord] = [
        MZWord(word: "중꺾마", description: "중요한 것은 꺽이지 않는 마음"),
        MZWord(word: "스불재", description: "스스로 불러온 재앙"),
        MZWord(word: "잼얘", description: "재밌는 이야기"),
        MZWord(word: "쓸쓸비용", description: "쓸쓸한 기분을 전환하기 위해 지출하는 비용"),
        MZWord(word: "오우예 씨몬", description: "C'mon"),
        MZWord(word: "디토합니다", description: "동의합니다. 인정합니다."),
        MZWord(word: "추구미", description: "본인이 추구하는 이미지"),
        MZWord(word: "중꺾그마", description: "중요한 건 꺾였지만 그냥 하는 마음"),
        MZWord(word: "ㄱㅂㅈㄱ", description: "가보자고 !! "),
        MZWord(word: "H워얼V", description: "사랑해"),
    ]
    
    let mzDictionary2: [String: String] = [
        "중꺾마" : "중요한 것은 꺽이지 않는 마음",
        "스불재" : "스스로 불러온 재앙",
        "잼얘" : "재밌는 이야기",
        "쓸쓸비용" : "쓸쓸한 기분을 전환하기 위해 지출하는 비용",
        "오우예 씨몬" : "C'mon",
        "디토합니다" : "동의합니다. 인정합니다.",
        "추구미" : "본인이 추구하는 이미지",
        "중꺾그마" : "중요한건 꺾였지만 그냥 하는 마음",
        "ㄱㅂㅈㄱ": "가보자고 !!",
        "H워얼V": "사랑해"
    ]
    
    @IBOutlet var mzWordTextField: UITextField!
    @IBOutlet var searchBtn: UIButton!
    
    @IBOutlet var firstMZWord: UIButton!
    @IBOutlet var secondMZWord: UIButton!
    @IBOutlet var thirdMZWord: UIButton!
    @IBOutlet var fourthMZWord: UIButton!
    
    @IBOutlet var descriptionBgImageView: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    
    var textFieldText: String?
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        
        /*
         self를 붙이는 이유 : UIViewController의 extension으로 구현한 것을 명시적으로 MZDictionaryViewController에서 호출한다고 알려주기 위함.
         (클로저에서 현재 인스턴스를 명확하기 위함)
         
         */
        self.hideKeyboardWhenTappedBackground()
    }
    
    
    @IBAction func firstMZWordBtnTapped(_ sender: UIButton) {
        descriptionLabel.text = "유명인과 무명인을 차별한다."
    }
    
    @IBAction func secondMZWordBtnTapped(_ sender: UIButton) {
        descriptionLabel.text = "실시간 매니저"
    }
    
    @IBAction func thirdMZWordBtnTapped(_ sender: UIButton) {
        descriptionLabel.text = "만난서 반가워 잘 부탁해"
    }
    
    @IBAction func fourthMZWordBtnTapped(_ sender: UIButton) {
        descriptionLabel.text = "꾸민듯 안꾸민듯"
    }
    
    @IBAction func findBtnTapped(_ sender: UIButton) {
        textFieldText = mzWordTextField.text
        
//        for index in mzDictionary {
//            if index.word == textFieldText {
//                descriptionLabel.text = index.description
//                return
//            }
//        }
//        for dic in mzDictionary2 {
//            if dic.key == textFieldText {
//                descriptionLabel.text = dic.value
//                return
//            }
//        }
//        descriptionLabel.text = "새로운 신조어가 나왔나봐요. \n 빠르게 업데이트할게요 ! \n 조금만 기다려주세요"
        
//        findWordToArray(
//            mzWord: textFieldText ?? "",
//            array: mzDictionary
//        )
        
        findWordToDictionary(
            mzWord: textFieldText ?? "",
            dictionary: mzDictionary2
        )
    }
    
    
    @IBAction func textFieldEnterBtnTapped(_ sender: UITextField) {
        textFieldText = mzWordTextField.text
        
        // MARK: 배열
        findWordToArray(
            mzWord: textFieldText ?? "",
            array: mzDictionary
        )
        
        // MARK: 딕셔너리
        findWordToDictionary(
            mzWord: textFieldText ?? "",
            dictionary: mzDictionary2
        )
        
    }
    
    private func findWordToArray(
        mzWord: String,
        array: [MZWord]
    ) {
        for index in array {
            if index.word == mzWord {
                descriptionLabel.text = index.description
                return
            }
        }
        descriptionLabel.text = "새로운 신조어가 나왔나봐요. \n 빠르게 업데이트할게요 ! \n 조금만 기다려주세요"
    }
    
    private func findWordToDictionary(
        mzWord: String,
        dictionary: [String: String]
    ) {
        for dic in dictionary {
            if dic.key == mzWord {
                descriptionLabel.text = dic.value
                return
            }
        }
        descriptionLabel.text = "새로운 신조어가 나왔나봐요. \n 빠르게 업데이트할게요 ! \n 조금만 기다려주세요"
    }
    
    
    private func configureUI() {
        configureTFUI()
        configureSeachUI()
        coonfigureDescripUI()
        configureBtns()
    }
    
    private func configureTFUI() {
        mzWordTextField.placeholder = "MZ 용어를 검색해보세요."
        mzWordTextField.layer.borderWidth = 3
        mzWordTextField.layer.borderColor = UIColor.black.cgColor
    }
    
    private func configureSeachUI() {
        searchBtn.setImage(
            UIImage(systemName: "magnifyingglass"),
            for: .normal
        )
        searchBtn.setTitle(
            "",
            for: .normal
        )
        searchBtn.backgroundColor = UIColor.black
        searchBtn.tintColor = UIColor.white
    }
    
    private func coonfigureDescripUI() {
        descriptionBgImageView.image = UIImage(named: "backgrounds")?.withRenderingMode(.alwaysOriginal)
        descriptionBgImageView.contentMode = .scaleAspectFill
        
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = .zero
        descriptionLabel.text = "검색해주세요."
        descriptionLabel.font = .systemFont(
            ofSize: 15,
            weight: .semibold
        )
    }
    
    private func configureBtns() {
        configureBtnUI(
            btn: firstMZWord,
            btnTitle: "융차"
        )
        configureBtnUI(
            btn: secondMZWord,
            btnTitle: "실매"
        )
        configureBtnUI(
            btn: thirdMZWord,
            btnTitle: "만반잘부"
        )
        configureBtnUI(
            btn: fourthMZWord,
            btnTitle: "꾸안꾸"
        )
    }
    
    private func configureBtnUI(
        btn: UIButton,
        btnTitle: String
    ) {
        // 버튼 크기가 유동적일 수 있나 ? -> 글자 크기에 맞춰서 width가 결정되는
        // 지금은 size inspector로 크기를 수정함
        
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.black.cgColor
        
        btn.setTitle(
            btnTitle,
            for: .normal
        )
        
        btn.titleLabel?.font = .systemFont(ofSize: 13)
        
        btn.setTitleColor(
            .black,
            for: .normal
        )
        
        // 이건 btn width에 맞춰서 폰트 사이즈가 줄어드는 것.
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
    }
}

// 검색해서 붙여넣음
extension UIViewController {
    func hideKeyboardWhenTappedBackground() {
        // tap 인식 -> 키보드 내리겠다
         let tapEvent = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard)
         )
        // 뷰에 탭 제스쳐가 일어나는 이벤트를 전달하겠다.
        // true 일때 제스쳐 인식X
        // 탭 이벤트가 감지 되어야 키보드 dismiss 일어남.
         tapEvent.cancelsTouchesInView = false
         view.addGestureRecognizer(tapEvent)
    }
    
    // 실제 키보드를 내려주는 함수
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

struct MZWord {
    var word: String
    var description: String
}


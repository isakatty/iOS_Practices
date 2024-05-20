//
//  SearchViewController.swift
//  ISAKFLIX
//
//  Created by Jisoo Ham on 5/16/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    // TextField
    @IBOutlet var textFieldBgView: UIView!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var textFieldImageView: UIImageView!
    
    // Btn
    @IBOutlet var soonOpenBtn: UIButton!
    @IBOutlet var mostPopularBtn: UIButton!
    @IBOutlet var topLankedBtn: UIButton!
    
    // Label
    @IBOutlet var searchResultLabel: UILabel!
    @IBOutlet var searchResultDescriptionLabel: UILabel!
    
    var searchText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        configureUI()
    }
    
    func configureUI() {
        textFieldBgView.backgroundColor = .gray
        textFieldBgView.layer.cornerRadius = 10
        
        searchTextField.placeholder = "게임, 시리즈, 영화를 검색하세요..."
        searchTextField.textColor = .darkGray
        searchTextField.backgroundColor = .gray
        searchTextField.borderStyle = .none
        
        textFieldImageView.image = UIImage(systemName: "magnifyingglass")
        textFieldImageView.contentMode = .scaleAspectFit
        textFieldImageView.tintColor = .darkGray
        
        // MARK: btn의 font 적용법
        /*
         iOS 15 > : UIButton.configuration으로 적용해야함.
         default 제외한 plain 등등이 uibutton
         */
        // Default에 적용되는 코드임
        
        // Image Rendering Mode
        // template vs original
        // 형태만 가져와     원본
        // 왜 template 필요할까? -> 이미지에 색상을 추가해주고 싶을 때, 이미지의 선과 면을 따서 거기에 tint color로 채워줄 때 template img가 쓰이는 것.
        soonOpenBtn.titleLabel?.font = .systemFont(ofSize: 15)
        soonOpenBtn.setTitle(
            "공개 예정",
            for: .normal
        )
        soonOpenBtn.setImage(
            UIImage(named: "blue"),
            for: .normal
        )
        // 이미지 렌더링 모드 적용 코드로
        // let image = UIImage(named: "").withRenderingMode(.alwaysOriginal)
        soonOpenBtn.imageView?.image?.withRenderingMode(.alwaysOriginal)
        soonOpenBtn.setTitleColor(
            UIColor.black,
            for: .normal
        )
        soonOpenBtn.layer.cornerRadius = 17
        soonOpenBtn.layer.backgroundColor = UIColor.white.cgColor
        
        mostPopularBtn.titleLabel?.font = .systemFont(ofSize: 14)
        mostPopularBtn.setTitle(
            "모두의 인기 콘텐츠",
            for: .normal
        )
        mostPopularBtn.setImage(
            UIImage(named: "turquoise"),
            for: .normal
        )
        mostPopularBtn.setTitleColor(
            UIColor.black,
            for: .normal
        )
        mostPopularBtn.layer.cornerRadius = 17
        mostPopularBtn.layer.backgroundColor = UIColor.white.cgColor
        
        topLankedBtn.titleLabel?.font = .systemFont(ofSize: 14)
        topLankedBtn.setTitle(
            "TOP 10 시리즈",
            for: .normal
        )
        topLankedBtn.setImage(
            UIImage(named: "pink"),
            for: .normal
        )
        topLankedBtn.setTitleColor(
            UIColor.black,
            for: .normal
        )
        topLankedBtn.layer.cornerRadius = 17
        topLankedBtn.layer.backgroundColor = UIColor.white.cgColor
        
        searchResultLabel.text = "이런! 찾으시는 작품이 없습니다."
        searchResultLabel.textColor = .white
        searchResultLabel.textAlignment = .center
        searchResultLabel.font = .systemFont(
            ofSize: 23,
            weight: .bold
        )
        searchResultDescriptionLabel.text = "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해보세요."
        searchResultDescriptionLabel.textColor = .white
        searchResultDescriptionLabel.textAlignment = .center
        searchResultDescriptionLabel.font = .systemFont(
            ofSize: 15,
            weight: .light
        )
    }
    
    
    @IBAction func soonOpenBtnTapped(_ sender: UIButton) {
        mostPopularBtn.layer.backgroundColor = UIColor.clear.cgColor
        topLankedBtn.layer.backgroundColor = UIColor.clear.cgColor
        mostPopularBtn.setTitleColor(
            UIColor.red,
            for: .normal
        )
        topLankedBtn.setTitleColor(
            UIColor.red,
            for: .normal
        )
        
        searchResultLabel.text = "공개 예정은 뭐가 있을까요 ?"
        searchResultDescriptionLabel.text = "넷플릭스 오리지널 많이 내주세요. "
    }
    
    @IBAction func mostPopularBtnTapped(_ sender: UIButton) {
        topLankedBtn.layer.backgroundColor = UIColor.clear.cgColor
        topLankedBtn.setTitleColor(
            UIColor.red,
            for: .normal
        )
        
        
        searchResultLabel.text = "모두의 인기 콘텐츠는 뭐가 있을까요 ?"
        searchResultLabel.font = .systemFont(ofSize: 20)
        searchResultDescriptionLabel.text = "요즘 넷플릭스를 못봐서 뭐가 인기있는지 모르겠어요. \n아쉬워요."
        
    }
    
    @IBAction func textFieldEnterTapped(_ sender: UITextField) {
        searchText = searchTextField.text ?? ""
        
        if searchText.count > 0 {
            searchResultLabel.text = searchText
            searchResultDescriptionLabel.text = "검색 결과 촤라락"
        }
    }
    
}

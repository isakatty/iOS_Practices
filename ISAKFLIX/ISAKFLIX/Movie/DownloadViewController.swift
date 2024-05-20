//
//  DownloadViewController.swift
//  ISAKFLIX
//
//  Created by Jisoo Ham on 5/16/24.
//

import UIKit

class DownloadViewController: UIViewController {
    

    @IBOutlet var featureLabel: UILabel!
    @IBOutlet var featureDescriptionLabel: UILabel!
    @IBOutlet var recommendImageView: UIImageView!
    
    @IBOutlet var settingBtn: UIButton!
    @IBOutlet var searchAroundBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

        configureUI()
    }
    
    func configureUI() {
        
        featureLabel.text = "'나만의 자동 저장' 기능"
        featureLabel.textAlignment = .center
        featureLabel.font = .systemFont(
            ofSize: 20,
            weight: .semibold
        )
        featureLabel.textColor = .white
        
        featureDescriptionLabel.textAlignment = .center
        featureDescriptionLabel.textColor = .systemGray6
        featureDescriptionLabel.text = "취향에 맞는 영화와 시리즈를 자동으로 저장해 드립니다. \n디바이스에 언제나 시청할 콘텐츠가 준비되니 지루할 틈이 없어요."
        featureDescriptionLabel.numberOfLines = .max
        featureDescriptionLabel.font = .systemFont(
            ofSize: 15,
            weight: .light
        )
        
        recommendImageView.image = UIImage(named: "dummy")
        recommendImageView.contentMode = .scaleToFill
        
        settingBtn.setTitle(
            "설정하기",
            for: .normal
        )
        settingBtn.setTitleColor(
            .white,
            for: .normal
        )
        settingBtn.backgroundColor = .blue
        settingBtn.layer.cornerRadius = 5
        
        searchAroundBtn.setTitle(
            "저장 가능한 콘텐츠 살펴보기",
            for: .normal
        )
        searchAroundBtn.setTitleColor(
            .black,
            for: .normal
        )
        searchAroundBtn.backgroundColor = .white
        searchAroundBtn.layer.cornerRadius = 5
        
        
    }

}

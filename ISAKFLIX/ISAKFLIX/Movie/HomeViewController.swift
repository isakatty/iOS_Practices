//
//  HomeViewController.swift
//  ISAKFLIX
//
//  Created by Jisoo Ham on 5/16/24.
//

import UIKit

class HomeViewController: UIViewController {
    // 메인 포스터 관련
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var mainImageDescriptionLabel: UILabel!
    
    // 메인 포스터에 올려진 요소
    @IBOutlet var clearPlayBtn: UIButton!
    @IBOutlet var playImageView: UIImageView!
    @IBOutlet var bookmarkBtn: UIButton!
    
    // 유명해지는 컨텐츠 관련
    @IBOutlet var boommingContentLabel: UILabel!
    @IBOutlet var firstBoomImageView: UIImageView!
    @IBOutlet var secondBoomImageView: UIImageView!
    @IBOutlet var thirdBoomImageView: UIImageView!
    
    // 랜덤으로 보여질 것들
    @IBOutlet var topTenBadgeImageView: UIImageView!
    @IBOutlet var netflixBadgeImageView: UIImageView!
    @IBOutlet var newEpUploadLabel: UILabel!
    @IBOutlet var viralLabel: UILabel!
    @IBOutlet var newSeriesLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.largeContentImage = UIImage(named: "background")
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        configureUI()
    }
    
    
    func configureUI() {
        cornerChange(imageName: "노량", imgView: mainImageView)
        
        mainImageDescriptionLabel.textAlignment = .center
        plainLabelUI(
            label: mainImageDescriptionLabel,
            labelText: "응원하고픈 흥미 진진 사극 전투 한국 작품",
            textColor: .lightGray,
            fontSize: 15,
            fontWeight: .semibold
        )
        
        
        playImageView.image = UIImage(named: "play_normal")
        playImageView.contentMode = .scaleAspectFill
        clearPlayBtn.setTitle(
            "",
            for: .normal
        )
        
        bookmarkBtn.setImage(
            UIImage(named: "check"),
            for: .normal
        )
        bookmarkBtn.setTitle(
            "내가 찜한 리스트",
            for: .normal
        )
        bookmarkBtn.setTitleColor(
            UIColor.white,
            for: .normal
        )
        bookmarkBtn.backgroundColor = .darkGray
        bookmarkBtn.layer.cornerRadius = 5
        
        plainLabelUI(
            label: boommingContentLabel,
            labelText: "지금 뜨는 콘텐츠",
            textColor: .white,
            fontSize: 15,
            fontWeight: .medium
        )
        
        cornerChange(
            imageName: "오펜하이머",
            imgView: firstBoomImageView
        )
        
        cornerChange(
            imageName: "태극기휘날리며",
            imgView: secondBoomImageView
        )
        
        cornerChange(
            imageName: "어벤져스엔드게임",
            imgView: thirdBoomImageView
        )
        
        labelText(
            labelName: newEpUploadLabel,
            text: "새로운 에피소드",
            labelBgColor: UIColor.clear,
            labelTextColor: UIColor.clear
        )
        labelText(
            labelName: viralLabel,
            text: "지금 시청하기",
            labelBgColor: UIColor.clear,
            labelTextColor: UIColor.clear
        )
        labelText(
            labelName: newSeriesLabel,
            text: "새로운 시리즈",
            labelBgColor: UIColor.clear,
            labelTextColor: UIColor.clear
        )
    }
    
    
    @IBAction func playBtnTapped(_ sender: UIButton) {
        popupUI()
    }
    
    
    private func popupUI() {
        topTenBadgeImageView.image = UIImage(named: "top10 badge")
        topTenBadgeImageView.contentMode = .scaleAspectFit
        
        netflixBadgeImageView.image = UIImage(named: "single-badge")
        netflixBadgeImageView.contentMode = .scaleAspectFit
        
        labelText(
            labelName: newEpUploadLabel,
            text: "새로운 에피소드",
            labelBgColor: UIColor.red,
            labelTextColor: UIColor.white
        )
        labelText(
            labelName: viralLabel,
            text: "지금 시청하기",
            labelBgColor: UIColor.white,
            labelTextColor: UIColor.black
        )
        labelText(
            labelName: newSeriesLabel,
            text: "새로운 시리즈",
            labelBgColor: UIColor.red,
            labelTextColor: UIColor.white
        )
    }
    
    private func cornerChange(
        imageName: String,
        imgView: UIImageView
    ) {
        
        imgView.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        imgView.layer.cornerRadius = 10
        imgView.layer.borderColor = UIColor.yellow.cgColor
        imgView.layer.borderWidth = 5
        imgView.contentMode = .scaleAspectFill
    }
    
    private func labelText(
        labelName: UILabel,
        text: String,
        labelBgColor: UIColor,
        labelTextColor: UIColor
    ) {
        labelName.text = text
        labelName.font = .systemFont(
            ofSize: 10,
            weight: .semibold
        )
        labelName.textAlignment = .center
        labelName.textColor = labelTextColor
        labelName.backgroundColor = labelBgColor
    }
    
    private func plainLabelUI(
        label: UILabel,
        labelText: String,
        textColor: UIColor,
        fontSize: CGFloat,
        fontWeight: UIFont.Weight
    ) {
        label.text = labelText
        label.textColor = textColor
        label.font = .systemFont(
            ofSize: fontSize,
            weight: fontWeight
        )
    }
    
}

//
//  ViewController.swift
//  AutoLayoutWithStoryboard
//
//  Created by Jisoo Ham on 5/20/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var musicTitleLabel: UILabel!
    @IBOutlet var titleImageView: UIImageView!
    @IBOutlet var artistNameLabel: UILabel!
    
    @IBOutlet var albumImageView: UIImageView!
    
    @IBOutlet var zzimButton: UIButton!
    @IBOutlet var countLabel: UILabel!
    
    @IBOutlet var lyricLabel: UILabel!
    
    @IBOutlet var timeImageView: UIImageView!
    @IBOutlet var repeatBtn: UIButton!
    @IBOutlet var shuffleBtn: UIButton!
    
    @IBOutlet var musicListBtn: UIButton!
    @IBOutlet var rewindBtn: UIButton!
    @IBOutlet var forwardBtn: UIButton!
    @IBOutlet var playBtn: UIButton!
    @IBOutlet var volumeKnobBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        configureUI()
    }
    
    private func configureUI() {
        titleImageView.image = UIImage(systemName: "music.quarternote.3")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        titleImageView.contentMode = .scaleAspectFit
        
        configureLabelUI(
            label: musicTitleLabel,
            labelText: "Apartment",
            fontSize: 17,
            fontWeight: .regular,
            fontColor: .white
        )
        
        configureLabelUI(
            label: artistNameLabel,
            labelText: "406호 프로젝트",
            fontSize: 13,
            fontWeight: .light,
            fontColor: .white
        )
        
        albumImageView.image = UIImage(named: "albumImg")?.withRenderingMode(.alwaysOriginal)
        albumImageView.contentMode = .scaleAspectFill
        
        configureLabelUI(label: countLabel, labelText: "140,710", fontSize: 13, fontWeight: .regular, fontColor: .white)
        configureNoTitleBtnUI(btn: zzimButton, btnImgName: "heart.fill", tag: 0)
        
        configureLabelUI(label: lyricLabel, labelText: "Stars of all Life 그 안에 가득한 이야기가 \n깊은 이 밤의 여백을 채워가면\nShine even more", fontSize: 13, fontWeight: .regular, fontColor: .white)
        
        timeImageView.image = UIImage(named: "musicbar")?.withRenderingMode(.alwaysOriginal)
        timeImageView.contentMode = .scaleToFill
        
        configureNoTitleBtnUI(btn: repeatBtn, btnImgName: "repeat", tag: 1)
        configureNoTitleBtnUI(btn: shuffleBtn, btnImgName: "shuffle", tag: 2)
        configureNoTitleBtnUI(btn: musicListBtn, btnImgName: "text.line.last.and.arrowtriangle.forward", tag: 3)
        configureNoTitleBtnUI(btn: rewindBtn, btnImgName: "backward.end.fill", tag: 4)
        configureNoTitleBtnUI(btn: playBtn, btnImgName: "play.fill", tag: 5)
        configureNoTitleBtnUI(btn: forwardBtn, btnImgName: "forward.end.fill", tag: 6)
        configureNoTitleBtnUI(btn: volumeKnobBtn, btnImgName: "speaker.wave.2.fill", tag: 7)
    }

    
    private func configureNoTitleBtnUI(
        btn: UIButton,
        btnImgName: String,
        tag: Int
    ) {
        let img = UIImage(systemName: btnImgName)?.withRenderingMode(.alwaysOriginal)
        
        btn.setTitle(
            "",
            for: .normal
        )
        btn.setImage(
            img,
            for: .normal
        )
        btn.tintColor = .white
        btn.tag = tag
    }
    
    private func configureLabelUI(
        label: UILabel,
        labelText: String,
        fontSize: CGFloat,
        fontWeight: UIFont.Weight,
        fontColor: UIColor
    ) {
        label.text = labelText
        label.textAlignment = .center
        label.numberOfLines = .zero
        label.textColor = fontColor
        label.font = .systemFont(
            ofSize: fontSize,
            weight: fontWeight
        )
    }

}


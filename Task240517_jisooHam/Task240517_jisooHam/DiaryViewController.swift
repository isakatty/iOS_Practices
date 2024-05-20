//
//  DiaryViewController.swift
//  Task240517_jisooHam
//
//  Created by Jisoo Ham on 5/17/24.
//

import UIKit

/*
 TODO: 0. 함수화
 TODO: 1. @IBOutlet collection 사용
 TODO: 2. tag 속성 사용 & 조건문 사용
 */

class DiaryViewController: UIViewController {

    // 버튼
    @IBOutlet var happyBtn: UIButton!
    @IBOutlet var sarangBtn: UIButton!
    @IBOutlet var loveBtn: UIButton!
    @IBOutlet var danghwangBtn: UIButton!
    @IBOutlet var soksangBtn: UIButton!
    @IBOutlet var uulBtn: UIButton!
    @IBOutlet var boringBtn: UIButton!
    @IBOutlet var silmangBtn: UIButton!
    @IBOutlet var sadBtn: UIButton!
    
    // 라벨
    @IBOutlet var happyLabel: UILabel!
    @IBOutlet var sarangLabel: UILabel!
    @IBOutlet var loveLabel: UILabel!
    @IBOutlet var danghwangLabel: UILabel!
    @IBOutlet var soksangLabel: UILabel!
    @IBOutlet var uulLabel: UILabel!
    @IBOutlet var boringLabel: UILabel!
    @IBOutlet var silmangLabel: UILabel!
    @IBOutlet var sadLabel: UILabel!
    
    @IBOutlet var labelCollection: [UILabel]!
    
    var count: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var labelList: [String] = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "우울해", "지루해","심심해", "행복해"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .magenta
        
        configureUI()

    }
    
    @IBAction func btnClicked(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            changeCount(BtnTag: sender.tag)
        case 1:
            changeCount(BtnTag: sender.tag)
        case 2:
            changeCount(BtnTag: sender.tag)
        case 3:
            changeCount(BtnTag: sender.tag)
        case 4:
            changeCount(BtnTag: sender.tag)
        case 5:
            changeCount(BtnTag: sender.tag)
        case 6:
            changeCount(BtnTag: sender.tag)
        case 7:
            changeCount(BtnTag: sender.tag)
        case 8:
            changeCount(BtnTag: sender.tag)
            
        default:
            break
        }
    }
    
    private func changeCount(BtnTag tagNumber: Int) {
        count[tagNumber] += 1
        labelCollection[tagNumber].text = "\(labelList[tagNumber]) \(count[tagNumber])"
    }
    
    
    func configureUI() {
        configureBtn(
            btn: happyBtn,
            btnImgName: "slime1",
            tag: 0
        )
        configureBtn(
            btn: sarangBtn,
            btnImgName: "slime2",
            tag: 1
        )
        configureBtn(
            btn: loveBtn,
            btnImgName: "slime3",
            tag: 2
        )
        configureBtn(
            btn: danghwangBtn,
            btnImgName: "slime4",
            tag: 3
        )
        configureBtn(
            btn: soksangBtn,
            btnImgName: "slime5",
            tag: 4
        )
        configureBtn(
            btn: uulBtn,
            btnImgName: "slime6",
            tag: 5
        )
        configureBtn(
            btn: boringBtn,
            btnImgName: "slime7",
            tag: 6
        )
        configureBtn(
            btn: silmangBtn,
            btnImgName: "slime8",
            tag: 7
        )
        configureBtn(
            btn: sadBtn,
            btnImgName: "slime9",
            tag: 8
        )
        
        configureLabel(
            label: happyLabel,
            text: "행복해"
        )
        configureLabel(
            label: sarangLabel, 
            text: "사랑해"
        )
        configureLabel(
            label: loveLabel, 
            text: "좋아해"
        )
        configureLabel(
            label: danghwangLabel, 
            text: "당황해"
        )
        configureLabel(
            label: soksangLabel, 
            text: "속상해"
        )
        configureLabel(
            label: uulLabel, 
            text: "우울해"
        )
        configureLabel(
            label: boringLabel, 
            text: "지루해"
        )
        configureLabel(
            label: silmangLabel, 
            text: "실망해"
        )
        configureLabel(
            label: sadLabel, 
            text: "슬퍼해"
        )
        
    }
    
    private func configureBtn(
        btn: UIButton,
        btnImgName: String,
        tag: Int
    ) {
        let img = UIImage(named: btnImgName)?.withRenderingMode(.alwaysOriginal)
        btn.setTitle("", for: .normal)
        btn.setImage(
            img,
            for: .normal
        )
        btn.imageView?.contentMode = .scaleAspectFit
        btn.tag = tag
    }
    
    private func configureLabel(
        label: UILabel,
        text: String
    ) {
        label.text = "\(text) "
        label.textAlignment = .center
        label.font = .systemFont(
            ofSize: 13,
            weight: .medium
        )
    }
    
}

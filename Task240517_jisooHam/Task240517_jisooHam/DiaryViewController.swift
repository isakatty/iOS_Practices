//
//  DiaryViewController.swift
//  Task240517_jisooHam
//
//  Created by Jisoo Ham on 5/17/24.
//

import UIKit

/*
 1. button + label or imgView + label + clear btn
 2. 버튼 눌릴 때 -> 증감 필요
 3. navigation title
 4. 좌측 상단에 햄버거 버튼?
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
    
    var happy: Int = 0
    var sarang: Int = 0
    var love: Int = 0
    var danghwang: Int = 0
    var soksang: Int = 0
    var uul: Int = 0
    var boring: Int = 0
    var silmang: Int = 0
    var sad: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .magenta
        
        configureUI()

    }
    
    // MARK: - 버튼마다 변수만 다르고 같은 코드 반복 -> 다른 방법 없을까 ?
    
    @IBAction func happyBtnTapped(_ sender: UIButton) {
        // TODO: - 2단계 : 랜덤으로 숫자 보여주기
//        happy = Int.random(in: 0...100)
        // TODO: - 3단계 : 숫자 +1 씩
//        happy += 1
//        happyLabel.text = "행복해 \(happy)"
        
        if happy == 0 {
            happy = Int.random(in: 0...100)
        } else {
            happy += 1
        }
        happyLabel.text = "행복해 \(happy)"    }
    @IBAction func sarangBtnTapped(_ sender: UIButton) {
        if sarang == 0 {
            sarang = Int.random(in: 0...100)
        } else {
            sarang += 1
        }
        sarangLabel.text = "좋아해 \(sarang)"
        
    }
    @IBAction func loveBtnTapped(_ sender: UIButton) {
        if love == 0 {
            love = Int.random(in: 1...100)
        } else {
            love += 1
        }
        loveLabel.text = "사랑해 \(love)"
        
    }
    @IBAction func danghwangBtnTapped(_ sender: UIButton) {
        if danghwang == 0 {
            danghwang = Int.random(in: 1...100)
        } else {
            danghwang += 1
        }
        danghwangLabel.text = "당황해 \(danghwang)"
        
    }
    @IBAction func soksangBtnTapped(_ sender: UIButton) {
        if soksang == 0 {
            soksang = Int.random(in: 1...100)
        } else {
            soksang += 1
        }
        soksangLabel.text = "속상해 \(soksang)"
        
    }
    @IBAction func uulBtnTapped(_ sender: UIButton) {
        if uul == 0 {
            uul = Int.random(in: 1...100)
        } else {
            uul += 1
        }
        uulLabel.text = "우울해 \(uul)"
        
    }
    @IBAction func boringBtnTapped(_ sender: UIButton) {
        if boring == 0 {
            boring = Int.random(in: 1...100)
        } else {
            boring += 1
        }
        boringLabel.text = "지루해 \(boring)"
        
    }
    @IBAction func silmangBtnTapped(_ sender: UIButton) {
        if silmang == 0 {
            silmang = Int.random(in: 1...100)
        } else {
            silmang += 1
        }
        silmangLabel.text = "실망해 \(silmang)"
        
    }
    @IBAction func sadBtnTapped(_ sender: UIButton) {
        if sad == 0 {
            sad = Int.random(in: 1...100)
        } else {
            sad += 1
        }
        sadLabel.text = "슬퍼해 \(sad)"
        
    }
    
    
    
    func configureUI() {
        configureBtn(
            btn: happyBtn,
            btnImgName: "slime1"
        )
        configureBtn(
            btn: sarangBtn,
            btnImgName: "slime2"
        )
        configureBtn(
            btn: loveBtn,
            btnImgName: "slime3"
        )
        configureBtn(
            btn: danghwangBtn,
            btnImgName: "slime4"
        )
        configureBtn(
            btn: soksangBtn,
            btnImgName: "slime5"
        )
        configureBtn(
            btn: uulBtn,
            btnImgName: "slime6"
        )
        configureBtn(
            btn: boringBtn,
            btnImgName: "slime7"
        )
        configureBtn(
            btn: silmangBtn,
            btnImgName: "slime8"
        )
        configureBtn(
            btn: sadBtn,
            btnImgName: "slime9"
        )
        
        configureLabel(
            label: happyLabel,
            text: "행복해",
            labelCount: happy
        )
        configureLabel(
            label: sarangLabel, 
            text: "사랑해",
            labelCount: sarang
        )
        configureLabel(
            label: loveLabel, 
            text: "좋아해", 
            labelCount: love
        )
        configureLabel(
            label: danghwangLabel, 
            text: "당황해",
            labelCount: danghwang
        )
        configureLabel(
            label: soksangLabel, 
            text: "속상해",
            labelCount: soksang
        )
        configureLabel(
            label: uulLabel, 
            text: "우울해",
            labelCount: uul
        )
        configureLabel(
            label: boringLabel, 
            text: "지루해",
            labelCount: boring
        )
        configureLabel(
            label: silmangLabel, 
            text: "실망해",
            labelCount: silmang
        )
        configureLabel(
            label: sadLabel, 
            text: "슬퍼해",
            labelCount: sad
        )
        
    }
    
    private func configureBtn(
        btn: UIButton,
        btnImgName: String
    ) {
        let img = UIImage(named: btnImgName)?.withRenderingMode(.alwaysOriginal)
        btn.setTitle("", for: .normal)
        btn.setImage(
            img,
            for: .normal
        )
        btn.imageView?.contentMode = .scaleAspectFit
    }
    
    private func configureLabel(
        label: UILabel,
        text: String,
        labelCount: Int
    ) {
        label.text = "\(text) "
        label.textAlignment = .center
        label.font = .systemFont(
            ofSize: 13,
            weight: .medium
        )
    }
    
}

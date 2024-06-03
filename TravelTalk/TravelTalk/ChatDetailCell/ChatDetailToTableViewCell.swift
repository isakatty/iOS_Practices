//
//  ChatDetailToTableViewCell.swift
//  TravelTalk
//
//  Created by Jisoo HAM on 6/1/24.
//

import UIKit

class ChatDetailToTableViewCell: UITableViewCell {
    
    @IBOutlet var profileImageview: UIImageView!
    @IBOutlet var nicknameLabel: UILabel!
    @IBOutlet var msgLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var msgBgView: UIView!
    
    @IBOutlet var separateBgView: UIView!
    @IBOutlet var separateDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImageview.contentMode = .scaleAspectFit
        nicknameLabel.font = .boldSystemFont(ofSize: 17)
        
        msgLabel.backgroundColor = .systemBackground
        msgLabel.numberOfLines = .zero
        
        msgBgView.backgroundColor = .systemBackground
        msgBgView.layer.cornerRadius = 10
        msgBgView.layer.borderWidth = 1.5
        msgBgView.layer.borderColor = UIColor.black.cgColor
        
        awakeLabel(label: msgLabel, fontSize: 15, fontColor: .black)
        awakeLabel(label: dateLabel, fontSize: 13, fontColor: .lightGray)
        awakeLabel(label: separateDateLabel, fontSize: 10, fontColor: .lightGray)
        separateDateLabel.textAlignment = .center
        
        separateBgView.backgroundColor = .systemGray6
        separateBgView.layer.cornerRadius = 10
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        profileImageview.image = nil
        [nicknameLabel, msgLabel,
         dateLabel, separateDateLabel]
            .forEach { $0?.text = "" }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        profileImageview.layer.cornerRadius = profileImageview.bounds.width / 2
    }
    
    func configureCell(msg: Chat) {
        profileImageview.image = UIImage(named: msg.user.profileImage)
        nicknameLabel.text = msg.user.rawValue
        msgLabel.text = msg.message
        dateLabel.text = msg.timeDate
        separateDateLabel.text = msg.separateDate
    }
    
    func configureHideDate(
        hide: Bool
    ) {
        if !hide {
            separateDateLabel.text = nil
            separateBgView.backgroundColor = .clear
        }
    }
    
    private func awakeLabel(
        label: UILabel,
        fontSize: CGFloat,
        fontColor: UIColor
    ) {
        label.font = .systemFont(ofSize: fontSize)
        label.textColor = fontColor
    }
    
}

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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImageview.contentMode = .scaleToFill
        
        msgLabel.layer.cornerRadius = 10
        msgLabel.layer.borderWidth = 1
        msgLabel.layer.borderColor = UIColor.black.cgColor
        msgLabel.backgroundColor = .white
        
        awakeLabel(label: msgLabel, fontSize: 15, fontColor: .black)
        awakeLabel(label: dateLabel, fontSize: 13, fontColor: .lightGray)
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        profileImageview.image = nil
        [nicknameLabel, msgLabel, dateLabel]
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

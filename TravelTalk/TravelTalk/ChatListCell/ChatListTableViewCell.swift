//
//  ChatListTableViewCell.swift
//  TravelTalk
//
//  Created by Jisoo HAM on 6/1/24.
//

import UIKit

class ChatListTableViewCell: UITableViewCell {

    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var msgLabel: UILabel!
    
    /// 반복되는 요소를 미리 구성하는
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImageView.contentMode = .scaleAspectFit
        
        awakeLabel(
            label: nameLabel,
            fontSize: 15,
            fontWeight: .semibold,
            fontcolor: .black
        )
        awakeLabel(label: dateLabel, fontSize: 13, fontWeight: .medium, fontcolor: .lightGray)
        awakeLabel(label: msgLabel, fontSize: 14, fontWeight: .regular, fontcolor: .darkGray)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2
    }
    
    /// 재사용되는 cell을 준비
    override func prepareForReuse() {
        super.prepareForReuse()
        
        profileImageView.image = nil
        
        [nameLabel, dateLabel, msgLabel]
            .forEach { label in
                label?.text = ""
            }
    }
    
    func awakeLabel(
        label: UILabel,
        fontSize: CGFloat,
        fontWeight: UIFont.Weight,
        fontcolor: UIColor
    ) {
        label.font = .systemFont(ofSize: fontSize, weight: fontWeight)
        label.textColor = fontcolor
    }
    
    func configureUI(chat: ChatRoom) {
        nameLabel.text = chat.chatroomName
        msgLabel.text = chat.chatList.last?.message
        dateLabel.text = chat.chatList.last?.dateString
        
        guard let imageName = chat.chatroomImage.first else { return }
        
        profileImageView.image = UIImage(named: imageName)
    }
    
}

//
//  ChatDetailFromTableViewCell.swift
//  TravelTalk
//
//  Created by Jisoo HAM on 6/1/24.
//

import UIKit

class ChatDetailFromTableViewCell: UITableViewCell {

    @IBOutlet var msgLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        msgLabel.layer.cornerRadius = 5
        msgLabel.layer.borderWidth = 1
        msgLabel.layer.borderColor = UIColor.systemGray2.cgColor
        msgLabel.clipsToBounds = true
        msgLabel.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        msgLabel.numberOfLines = .zero
        
        dateLabel.textAlignment = .right
        
        awakeLabel(label: msgLabel, fontSize: 15, fontColor: .black, labelBgColor: .systemGray3)
        awakeLabel(label: dateLabel, fontSize: 13, fontColor: .lightGray, labelBgColor: nil)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        [msgLabel, dateLabel]
            .forEach { $0?.text = "" }
    }
    
    func configureCell(
        msg: Chat
    ) {
        msgLabel.text = msg.message
        dateLabel.text = msg.timeDate
    }
    
    private func awakeLabel(
        label: UILabel,
        fontSize: CGFloat,
        fontColor: UIColor?,
        labelBgColor: UIColor?
    ) {
        label.font = .systemFont(ofSize: fontSize)
        label.backgroundColor = labelBgColor
        label.textColor = fontColor
    }
}

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
        
        msgLabel.layer.cornerRadius = 10
        msgLabel.layer.borderWidth = 1
        msgLabel.layer.borderColor = UIColor.black.cgColor
        
        awakeLabel(label: msgLabel, fontSize: 15, labelBgColor: .white)
        awakeLabel(label: dateLabel, fontSize: 15, labelBgColor: .systemGray4)
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
        labelBgColor: UIColor
    ) {
        label.font = .systemFont(ofSize: fontSize)
        label.backgroundColor = labelBgColor
    }
}

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
    @IBOutlet var msgBgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        msgLabel.numberOfLines = .zero
        msgBgView.backgroundColor = .systemBackground
        msgBgView.layer.cornerRadius = 10
        msgBgView.layer.borderColor = UIColor.black.cgColor
        msgBgView.layer.borderWidth = 1.5
        
        dateLabel.textAlignment = .right
        
        awakeLabel(label: msgLabel, fontSize: 15, fontColor: .black, labelBgColor: nil)
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

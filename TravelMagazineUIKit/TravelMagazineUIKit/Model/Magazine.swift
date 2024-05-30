//
//  Magazine.swift
//  TravelMagazineUIKit
//
//  Created by Jisoo Ham on 5/26/24.
//

import Foundation

struct Magazine {
    let title: String
    let subtitle: String
    let photo_image: String
    let date: String
    let link: String
    
    
    var dateStr: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyMMdd"
        
        var changedFormatter = DateFormatter()
        changedFormatter.dateFormat = "yy년 MM월 dd일"
        
        guard let changingDate = dateFormatter.date(from: date) else { return "\(Date().timeIntervalSince1970)" }
        
        let changedDate = changedFormatter.string(from: changingDate)
        
        return changedDate
    }
}

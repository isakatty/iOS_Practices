//
//  Magazine.swift
//  TravelMagazineUIKit
//
//  Created by Jisoo Ham on 5/26/24.
//

import UIKit

struct Magazine {
    let title: String
    let subtitle: String
    let photo_image: String
    let date: String
    let link: String
    
    var stringToFormattedDate: String {
        let stringToDateFormatter = DateFormatter()
        stringToDateFormatter.dateFormat = "yyMMdd"
        guard let stringDate = stringToDateFormatter.date(from: date) else { return date}
        
        let dateToStringFormatter = DateFormatter()
        dateToStringFormatter.dateFormat = "yy년 MM월 dd일"
        let changedDate = dateToStringFormatter.string(from: stringDate)
        
        return changedDate
    }
    
    var linkToURL: URL? {
        let url = URL(string: photo_image)
        return url
    }
}

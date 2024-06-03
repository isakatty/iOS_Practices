//
//  Date+.swift
//  TravelTalk
//
//  Created by Jisoo HAM on 6/3/24.
//

import UIKit

extension Date{
    
    public func dateCompare(fromDate: Date) -> Bool {
        var past: Bool = false
        let result: ComparisonResult = self.compare(fromDate)
        
        switch result {
        case .orderedAscending:
            past = false
        case .orderedDescending:
            past = true
        case .orderedSame:
            past = false
        }
        return past
    }
}

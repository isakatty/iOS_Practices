//
//  TravelMagazineTableViewController.swift
//  TravelMagazineUIKit
//
//  Created by Jisoo Ham on 5/26/24.
//

import UIKit

import Kingfisher

class TravelMagazineTableViewController: UITableViewController {

    let magazineInfo = MagazineInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 410
    }
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return magazineInfo.magazine.count
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyMMdd"
        
        let changedDateFormatter = DateFormatter()
        changedDateFormatter.dateFormat = "yy년 MM월 dd일"
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "TravelMagazineTableViewCell",
            for: indexPath
        ) as? TravelMagazineTableViewCell,
              let changedDate = dateFormatter.date(from: magazineInfo.magazine[indexPath.row].date)
        else { return UITableViewCell() }
        
        let changedDateString = changedDateFormatter.string(from: changedDate)
        
        cell.configureLabel(
            label: cell.titleLabel,
            text: magazineInfo.magazine[indexPath.row].title,
            textColor: .black,
            textAlignment: .left,
            fontSize: 17,
            fontWeight: .bold
        )
        
        cell.configureLabel(
            label: cell.subtitleLabel,
            text: magazineInfo.magazine[indexPath.row].subtitle,
            textColor: .black,
            textAlignment: .left,
            fontSize: 13,
            fontWeight: .regular
        )
        
        cell.configureLabel(
            label: cell.dateLabel,
            text: changedDateString,
            textColor: .black,
            textAlignment: .right,
            fontSize: 13,
            fontWeight: .regular
        )
        

        let url = URL(string: magazineInfo.magazine[indexPath.row].photo_image)
        cell.travleImageView.kf.setImage(with: url)
        cell.travleImageView.contentMode = .scaleAspectFill
        cell.travleImageView.layer.cornerRadius = 10
        
        return cell
    }
    
    

}
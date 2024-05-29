//
//  PopularCityViewController.swift
//  TravelMagazineUIKit
//
//  Created by Jisoo HAM on 5/29/24.
//

import UIKit

import Kingfisher

class PopularCityViewController: UIViewController {

    let cityList = CityInfo().city
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let xib = UINib(
            nibName: PopularCityTableViewCell.identifier,
            bundle: nil
        )
        tableView.register(
            xib,
            forCellReuseIdentifier: PopularCityTableViewCell.identifier
        )
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 140
        
    }

}

extension PopularCityViewController
: UITableViewDelegate, UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return cityList.count
    }
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: PopularCityTableViewCell.identifier,
            for: indexPath
        ) as? PopularCityTableViewCell else { return UITableViewCell() }
        let data = cityList[indexPath.row]
        
        
        let url = URL(string: data.city_image)
        cell.cityImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "heart"))
        
        cell.cityNameLabel.text = data.dualLangCityName
        cell.citySpotLabel.text = data.city_explain
        
        return cell
    }
    
}

//
//  PopularCityViewController.swift
//  TravelMagazineUIKit
//
//  Created by Jisoo HAM on 5/29/24.
//

import UIKit

import Kingfisher

/* TODO: SegmentedControl 찾아보기
 - insertSegment : 더 추가하겠다 이름, 어디에, 애니메이션
 
 
 */

class PopularCityViewController: UIViewController {

    let cityList = CityInfo().city
    let segName: [String] = ["모두", "국내", "해외"]
    @IBOutlet var tableView: UITableView!
    @IBOutlet var segments: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        configureSegmented()
    }
    
    func configureTableView() {
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
    func configureSegmented() {
        segments.setTitle(segName[0], forSegmentAt: 0)
        segments.setTitle(segName[1], forSegmentAt: 1)
        segments.setTitle(segName[2], forSegmentAt: 2)
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

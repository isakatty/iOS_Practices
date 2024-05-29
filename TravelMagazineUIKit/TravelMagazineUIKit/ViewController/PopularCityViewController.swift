//
//  PopularCityViewController.swift
//  TravelMagazineUIKit
//
//  Created by Jisoo HAM on 5/29/24.
//

import UIKit

import Kingfisher

/* TODO: SegmentedControl 찾아보기
 - segmentedControl -> title 설정
    1. 배열 직접 대입
    2. for-in문 통해서 대입
        -> 배열의 index == seg의 index
 - sender.selectedSegmentIndex 통해 각각의 seg에 접근
    - switch case 문으로 index 분류 / 분류에 맞는 데이터 할당 / tableView.reload()
    - 더 멋진 방법 없나 . . ?
 
 */

class PopularCityViewController: UIViewController {

    let cityList = CityInfo().city
    let segName: [String] = ["모두", "국내", "해외"]
    var filteredCity = [City]()
    @IBOutlet var tableView: UITableView!
    @IBOutlet var segments: UISegmentedControl!
    @IBOutlet var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "인기 도시"
        
        filteredCity = cityList
        
        configureTableView()
        configureSegmented()
        
        hideKeyboard()
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
//        segments.setTitle(segName[0], forSegmentAt: 0)
//        segments.setTitle(segName[1], forSegmentAt: 1)
//        segments.setTitle(segName[2], forSegmentAt: 2)
        
        for compo in segName.indices {
            segments.setTitle(segName[compo], forSegmentAt: compo)
        }
    }
    
    
    @IBAction func segmentSelected(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
        
        switch sender.selectedSegmentIndex {
        case 0:
            filteredCity = cityList
            tableView.reloadData()
        case 1:
            filteredCity = cityList.filter({ city in
                city.domestic_travel == true
            })
            tableView.reloadData()
        case 2:
            filteredCity = cityList.filter({ city in
                city.domestic_travel == false
            })
            tableView.reloadData()
        default:
            break
        }
        
    }
    
    
    
}

extension PopularCityViewController
: UITableViewDelegate, UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return filteredCity.count
    }
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: PopularCityTableViewCell.identifier,
            for: indexPath
        ) as? PopularCityTableViewCell else { return UITableViewCell() }
        let data = filteredCity[indexPath.row]
        
        
        let url = URL(string: data.city_image)
        cell.cityImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "heart"))
        
        cell.cityNameLabel.text = data.dualLangCityName
        cell.citySpotLabel.text = data.city_explain
        
        return cell
    }
    
}

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

enum Region: Int, CaseIterable {
    case all = 0
    case domestic
    case international
    
    func filterData(cityList: [City]) -> [City] {
        switch self {
        case .all:
            return cityList
        case .domestic:
            return cityList.filter { city in
                city.domestic_travel == true
            }
        case .international:
            // 축약버전
            return cityList.filter { $0.domestic_travel == false }
        }
    }
    var toString: String {
        switch self {
        case .all:
            "모두"
        case .domestic:
            "국내"
        case .international:
            "해외"
        }
    }
}

class PopularCityViewController: UIViewController {

    let viewModel: PopularViewModel = PopularViewModel()
    let cityList = CityInfo().city
    var cnt = 0
    // 빈배열을 선언해주고, viewDidLoad되면서 값을 넣어줘서 활용하는 것과 애초에 기본 데이터를 넣어놓고 활용하는 것의 차이가 있나 ?
    // 효율성보다는 데이터가 들어가는 시점
    // 효율성 -> 연산이 들어가는 것.
    var filteredCity = [City]()
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var segments: UISegmentedControl!
    @IBOutlet var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "인기 도시"
        
        bindData()
        configureTableView()
        configureSegmented()
        configureSearchBar()
        
        hideKeyboard()
    }
    func bindData() {
        viewModel.outputCities.bind { [weak self] _ in
            guard let self else { return }
            // 이 cities를 어케 하누 ?
            self.tableView.reloadData()
        }
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
        for compo in Region.allCases {
            segments.setTitle(compo.toString, forSegmentAt: compo.rawValue)
        }
    }
    func configureSearchBar() {
        searchBar.delegate = self
        
        searchBar.placeholder = "인기 도시를 검색해보세요 !"
    }
    
    @IBAction func segmentSelected(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
        
        viewModel.inputSegTrigger.value = sender.selectedSegmentIndex
        
        // ⭐️ 열거형으로 처리해줘도 ?
        
        // MARK: enum의 rawValue를 통해 가져온 값은 optional ?
        // -> segmentIndex랑 enum의 rawValue 값이랑 매칭이 안될 수 있으니까 ?
//        guard let selected = Region(rawValue: sender.selectedSegmentIndex) else { return }
//        filteredCity = selected.filterData(cityList: cityList)
        
    }
    
}

/* TODO: SearchBar
 - enterTap -> 검색 : UISearchBarDelegate를 통해 구현된 함수 사용
 - 실시간 검색 기능 : text에 변동이 있으면 검색 로직
 Ex) segment 국내 -> 서치바 검색 : 분류해서 검색
   1. segments.selectedSegmentIndex 를 통해 seg index 접근 후 데이터 필터링
   2. searchbar.text 필터링
    ---> 데이터 보여주기
 */
extension PopularCityViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        viewModel.inputSearchBarTrigger.value = text
    }
}

extension PopularCityViewController
: UITableViewDelegate, UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return viewModel.outputCities.value.count
    }
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: PopularCityTableViewCell.identifier,
            for: indexPath
        ) as? PopularCityTableViewCell else { return UITableViewCell() }
        let cityInfo = viewModel.outputCities.value[indexPath.row]
        
        cell.configureCell(city: cityInfo)
        return cell
    }
    
}

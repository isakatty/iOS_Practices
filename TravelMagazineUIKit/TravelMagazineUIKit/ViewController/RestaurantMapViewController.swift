//
//  RestaurantMapViewController.swift
//  TravelMagazineUIKit
//
//  Created by Jisoo Ham on 5/30/24.
//

import UIKit

import MapKit


/* TODO: 지도에 레스토랑 핀 찍기 / segments적용
 1. 데이터 주입
 2. 레스토랑 핀찍기 - VC 진입시 전체 어노테이션 적용
    -> 위치 설정 및 몇 미터 반경까지 보여줄지 설정 ⭐️
    -> annotaion 추가
 3. segments 필터
    MARK: ⚠️ 왤까 !!!!
    -> 필터링을 통해 핀을 다시 찍을 때, 일반 tableView.reloadData() 하듯 생성하는 함수를 다시 호출하면 안되는 이유는 뭘까 ?
        남아있을 수 있기 때문에 명시적으로 지우고 다시 추가해주어야한다 ? ?
 */

enum FoodCategory: Int {
    case all = 0
    case korean
    case chinese
    
    func filterRestaurants(stores: [Restaurant]) -> [Restaurant] {
        switch self {
        case .all:
            return stores
        case .korean:
            return stores.filter { restaurant in
                restaurant.category == "한식"
            }
        case .chinese:
            return stores.filter { $0.category == "중식" }
        }
    }
}

class RestaurantMapViewController: UIViewController {

    @IBOutlet var segments: UISegmentedControl!
    @IBOutlet var mapView: MKMapView!
    
    let restaurants = RestaurantList().restaurantArray
    var filteredData = [Restaurant]()
    var annotations = [MKPointAnnotation]()
    var foodCategory = [String]()
    let segName: [String] = ["전체", "한식", "중식"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "레스토랑 지도"
        
        filteredData = restaurants
        
        // MARK: 함수를 계속 호출하게 되는데, 매번 생성하는 것보다 한번 생성해놓는게 더 효율적이지 않은가 ?
        let coordinate = CLLocationCoordinate2D(
            latitude: restaurants[3].latitude,
            longitude: restaurants[3].longitude
        )
        
        mapView.region = MKCoordinateRegion(
            center: coordinate,
            latitudinalMeters: 2000,
            longitudinalMeters: 2000
        )
        
        configureMapAnnotaion(stores: filteredData)
        configureSeg()
        
    }
    
    
    @IBAction func segmentSelected(_ sender: UISegmentedControl) {
        
        guard let selectedSeg = FoodCategory(rawValue: sender.selectedSegmentIndex) else { return }
        
        filteredData = selectedSeg.filterRestaurants(stores: restaurants)
        
//        switch sender.selectedSegmentIndex {
//        case 0:
//            filteredData = restaurants
//        case 1:
//            filteredData = restaurants.filter { res in
//                res.category == "한식"
//            }
//        case 2:
//            filteredData = restaurants.filter({ res in
//                res.category == "중식"
//            })
//        default:
//            filteredData = restaurants
//        }
        
        configureMapAnnotaion(stores: filteredData)
    }
    
    func configureSeg() {
//        for index in segName.indices {
//            segments.setTitle(segName[index], forSegmentAt: index)
//        }
        for (index, str) in segName.enumerated() {
            segments.setTitle(str, forSegmentAt: index)
        }
    }
    func configureMapAnnotaion(stores: [Restaurant]) {
        // 1. 혹시라도 있을 annotaion 제거
        mapView.removeAnnotations(mapView.annotations)
        
        // 2. 생성한 annotions 배열 빈배열 만들기
        annotations.removeAll()
        
        // index를 돌면서 핀 만들기
//        for index in stores.indices {
//            let annotation = MKPointAnnotation()
//            annotation.coordinate = CLLocationCoordinate2D(
//                latitude: stores[index].latitude,
//                longitude: stores[index].longitude
//            )
//            annotation.title = stores[index].name
//            annotations.append(annotation)
//        }
        
        for (_, store) in stores.enumerated() {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(
                latitude: store.latitude,
                longitude: store.longitude
            )
            annotation.title = store.name
            annotations.append(annotation)
        }
        
        mapView.addAnnotations(annotations)
    }
    
    // MARK: 모든 카테고리를 segments로 표현하기엔 HIG에서 벗어남.
    // 전체, 한식, 중식만
    func filterFoodCategoryName() {
        // restaurantArray의 category 가져다가 중복 제거
        for (_, store) in restaurants.enumerated() {
            foodCategory.append(store.category)
        }
        foodCategory = Array(Set(foodCategory))
        
    }
}


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
 */
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
        
        configureMapView(stores: filteredData)
        configureSeg()
        
        
//        filterFoodCategoryName()
    }
    
    
    @IBAction func segmentSelected(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            filteredData = restaurants
        case 1:
            filteredData = restaurants.filter { res in
                res.category == "한식"
            }
        case 2:
            filteredData = restaurants.filter({ res in
                res.category == "중식"
            })
        default:
            filteredData = restaurants
        }
        
        configureMapView(stores: filteredData)
    }
    
    
    func configureMapView(stores: [Restaurant]) {
        mapView.removeAnnotations(mapView.annotations)
        
        let coordinate = CLLocationCoordinate2D(
            latitude: restaurants[3].latitude,
            longitude: restaurants[3].longitude
        )
        
        mapView.region = MKCoordinateRegion(
            center: coordinate,
            latitudinalMeters: 1500,
            longitudinalMeters: 5000
        )
        
        configureMapAnnotaion(stores: stores)
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
        annotations.removeAll()
        
        // index를 돌면서 핀 만들기
        for index in stores.indices {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(
                latitude: stores[index].latitude,
                longitude: stores[index].longitude
            )
            annotation.title = stores[index].name
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


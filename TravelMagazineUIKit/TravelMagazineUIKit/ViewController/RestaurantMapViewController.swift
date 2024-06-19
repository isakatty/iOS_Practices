//
//  RestaurantMapViewController.swift
//  TravelMagazineUIKit
//
//  Created by Jisoo Ham on 5/30/24.
//

import UIKit

import CoreLocation
import MapKit

enum FoodCategory: Int { // rawValue를 string 값으로 변경해서 적용하는것
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
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "레스토랑 지도"
        locationManager.delegate = self
        
        filteredData = restaurants
        
        
        configureMapAnnotaion(stores: filteredData)
        configureSeg()
        checkLocationAuthorization()
        
    }
    
    
    @IBAction func segmentSelected(_ sender: UISegmentedControl) {
        
        guard let selectedSeg = FoodCategory(rawValue: sender.selectedSegmentIndex) else { return }
        
        filteredData = selectedSeg.filterRestaurants(stores: restaurants)
        
        configureMapAnnotaion(stores: filteredData)
    }
    
    func configureSeg() {
        for (index, str) in segName.enumerated() {
            segments.setTitle(str, forSegmentAt: index)
        }
    }
    func configureMapAnnotaion(stores: [Restaurant]) {
        // 1. 혹시라도 있을 annotaion 제거
        mapView.removeAnnotations(mapView.annotations)
        
        // 2. 생성한 annotions 배열 빈배열 만들기
        annotations.removeAll()
        
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
    
    func filterFoodCategoryName() {
        // restaurantArray의 category 가져다가 중복 제거
        for (_, store) in restaurants.enumerated() {
            foodCategory.append(store.category)
        }
        foodCategory = Array(Set(foodCategory))
        
    }
    
    func checkLocationAuthorization() {
        // iphone 위치 설정 확인
        if CLLocationManager.locationServicesEnabled() {
            // device 위치 설정 확인
            checkDeviceLocationAuthorization()
        } else {
            // 설정으로 보내기
            UIApplication.shared.open(
                URL(
                    string: UIApplication.openSettingsURLString
                )!,
                options: [:],
                completionHandler: nil
            )
        }
    }
    
    func checkDeviceLocationAuthorization() {
        
        var status: CLAuthorizationStatus
        
        if #available(iOS 14.0, *) {
            status = locationManager.authorizationStatus
        } else {
            status = CLLocationManager.authorizationStatus()
        }
        
        switch status {
        case .notDetermined:
            // alert 띄우기
            print("위치정보 허용 관련 설정 아무것도 안한 상태")
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            // 위치권한 요청
            locationManager.requestWhenInUseAuthorization()
        case .denied:
            print("거부")
            
            let coordinate = CLLocationCoordinate2D(
                latitude: restaurants[3].latitude,
                longitude: restaurants[3].longitude
            )
            
            setRegionAndAnnotaion(center: coordinate)
            
            let alert = UIAlertController(
                title: "위치정보 허용 거부",
                message: "위치 권한 허용을 허용해야 서비스 이용이 원활합니다.",
                preferredStyle: .alert
            )
            
            let alertAction = UIAlertAction(title: "확인", style: .destructive) { _ in
                UIApplication.shared.open(
                    URL(
                        string: UIApplication.openSettingsURLString
                    )!,
                    options: [:],
                    completionHandler: nil
                )
            }
            alert.addAction(alertAction)
            
            present(alert, animated: true)
            
        case .authorizedWhenInUse:
            print("앱 사용할 때만")
            
            locationManager.startUpdatingLocation()
        default :
            print("빙글")
        }
        
    }
    
    func setRegionAndAnnotaion(center: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion(
            center: center,
            latitudinalMeters: 500,
            longitudinalMeters: 500
        )
        
        mapView.setRegion(region, animated: true)
    }
}

extension RestaurantMapViewController: CLLocationManagerDelegate {
    
    // 위치 권한 허용시 위치정보를 업데이트함
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        print(#function)
        // 실제 위치를 받아서 맵뷰에 반영 가능한 곳
        if let location = locations.last {
            print(location)
            // 37.46648600,+127.02836200
            setRegionAndAnnotaion(center: location.coordinate)
        }
    }
    
    
    // 위치정보 못가져왔을 때
    func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: any Error
    ) {
        print(error)
    }
    
    // 권한이 바꼈을 때 - iOS 14+
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    // 권한이 바꼈을 때 - iOS 14-
    func locationManager(
        _ manager: CLLocationManager,
        didChangeAuthorization status: CLAuthorizationStatus
    ) {
        checkLocationAuthorization()
    }
}

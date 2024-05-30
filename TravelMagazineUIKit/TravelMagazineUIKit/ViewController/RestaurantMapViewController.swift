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
    var annotations = [MKPointAnnotation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "레스토랑 지도"
        
        let coordinate = CLLocationCoordinate2D(
            latitude: restaurants[0].latitude,
            longitude: restaurants[0].longitude
        )
        
        mapView.region = MKCoordinateRegion(
            center: coordinate,
            latitudinalMeters: 5000,
            longitudinalMeters: 5000
        )
        
        configureMapAnnotaion(stores: restaurants)
    }
    
    
    func configureMapAnnotaion(stores: [Restaurant]) {
        
        // index를 돌면서 핀 만들기 
        for index in stores.indices {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(
                latitude: restaurants[index].latitude,
                longitude: restaurants[index].longitude
            )
            annotation.title = restaurants[index].name
            annotations.append(annotation)
        }
        
        mapView.addAnnotations(annotations)
    }
    
}

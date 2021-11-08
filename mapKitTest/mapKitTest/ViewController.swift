//
//  ViewController.swift
//  mapKitTest
//
//  Created by ✨EUGENE✨ on 2021/11/08.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation! // 내 위치 저장
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapView.mapType = MKMapType.standard
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() // 사용자 승인
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // 정확도
        locationManager.startUpdatingLocation() // 위치 업데이트 시작
        mapView.showsUserLocation = true // 위치 보기 설정
        
        print("\(locationManager.location?.coordinate)")
    }
    
    // move가 맞나
    func move(at coordinate: CLLocationCoordinate2D, delta span: Double) {
        print("move,,,,")
        // span이 뭐지
        let coordinateSpan = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let region = MKCoordinateRegion(center: coordinate, span: coordinateSpan)
        
        // 이걸 왜하지
        mapView.setRegion(region, animated: true)
    }
    
    // 위치 정보
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // 마지막 위치
//        let lastLocation = locations.last
        
        if let lastLocation = locations.last {
            move(at: lastLocation.coordinate, delta: 0.01)
        }
        
        print("여기 로케이션 매니저")
        
//        locationManager = manager
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse,
        let location = locationManager.location{
            move(at: location.coordinate, delta: 0.01)
        }
    }
}


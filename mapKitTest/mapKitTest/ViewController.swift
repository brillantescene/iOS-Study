//
//  ViewController.swift
//  mapKitTest
//
//  Created by ✨EUGENE✨ on 2021/11/08.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation! // 내 위치 저장
    
    // 밤가시
    let centerLocation = CLLocation(latitude: 37.66906773682083, longitude: 126.78460869875774)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setMap()
        self.setInitialLocation()
        self.setCurrentLocation()
        self.setZoom()
        self.setAnnotation()
    }
    // MARK: - 마커 추가
    func setAnnotation() {
        let marker = Store(
            title: "밤가시 버거",
            locationName: "경기도 고양시 일산동구 정발산동 일산로372번길 46",
            discipline: "햄버거",
            coordinate: CLLocationCoordinate2D(latitude: 37.66906773682083, longitude: 126.78460869875774))
        mapView.addAnnotation(marker)
    }
    
    // MARK: - 초기 위치 설정
    func setInitialLocation() {
        // 밤가시
        mapView.centerToLocation(self.centerLocation)
    }
    
    // MARK: - 지도 설정
    func setMap() {
        mapView.delegate = self
        mapView.mapType = MKMapType.standard
        mapView.showsUserLocation = true // 위치 보기 설정
        setCurrentLocation()
    }
    
    func setCurrentLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() //권한요청
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // 위치 정보 정확도
        locationManager.startUpdatingLocation() // 위치 업데이트 시작
    }
    
    // MARK: - 줌 아웃 제한
    // 이정도면 수도권까지 줌아웃 가능
    func setZoom() {
        let region = MKCoordinateRegion(center: self.centerLocation.coordinate,
                                        latitudinalMeters: 50000,
                                        longitudinalMeters: 60000)
        mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region),
                                           animated: true)
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200000)
        mapView.setCameraZoomRange(zoomRange, animated: true)
    }
}


//
//  NaverMapTest.swift
//  AppJamTest
//
//  Created by ✨EUGENE✨ on 2021/01/27.
//

import UIKit
import NMapsMap
import SwiftKeychainWrapper
//import CoreLocation

class NaverMapTest: UIViewController , CLLocationManagerDelegate {

    @IBOutlet var mapView: NMFMapView!
    @IBOutlet var locationBtn: UIButton!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.showLegalNotice()
        SetLocationBtn()
        getCoordinate()
        setMap()
//        mapView.logoMargin = UIEdgeInsets(top: 0, left: 30, bottom: 200, right: 0)
        print("여기하는중임?")
        locationManager.delegate = self
        
        let marker = NMFMarker()
        marker.position = NMGLatLng(lat: 37.5670135, lng: 126.9783740)
        marker.iconImage = NMFOverlayImage(
        marker.mapView = mapView
        
        
    }
}

extension NaverMapTest {
    func SetLocationBtn(){
        locationBtn.setTitle("compass", for: .selected)
        locationBtn.addTarget(self, action: #selector(locationTapped), for: .touchUpInside)
    }
    func getCoordinate(){
        locationManager.requestWhenInUseAuthorization() // 권한요청
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // 정확도
        locationManager.startUpdatingLocation() // 위치 업데이트 시작
        let coor = locationManager.location?.coordinate
        move(at: coor)
    }
    func setMap() {
        mapView.minZoomLevel = 5
        mapView.maxZoomLevel = 18
        
        mapView.logoAlign = .rightTop
        mapView.logoMargin = UIEdgeInsets(top: 62, left: 0, bottom: 0, right: 20)
    }
    
    func move(at coordinate: CLLocationCoordinate2D?) {

        print("여기는 무브무브")
//        let locationOverlay = mapView.locationOverlay

        print("zoom level: \(mapView.zoomLevel)")
        guard let coordinate = coordinate else {return}
        let latitude = coordinate.latitude
        let longitude = coordinate.longitude
        let camera = NMFCameraUpdate(scrollTo: NMGLatLng(lat: latitude, lng: longitude))

        mapView.moveCamera(camera)

        mapView.positionMode = .direction

        print("mapView.positionMode \(mapView.positionMode.rawValue)")
        print("mapView.locationOverlay.heading \(mapView.locationOverlay.heading)")

    }
    @objc func locationTapped(_ sender:UIButton){
        if sender.isSelected == true {
            sender.isSelected = false
            mapView.positionMode = .direction
        } else {
            sender.isSelected = true
            mapView.positionMode = .compass
        }
    }
}

//
//  NaverTestVC.swift
//  AppJamTest
//
//  Created by ✨EUGENE✨ on 2021/01/02.
//

import UIKit
import NMapsMap

class NaverTestVC: UIViewController {//}, CLLocationManagerDelegate {
    
    @IBOutlet var mapView: NMFMapView!
    @IBOutlet var myBtn: UIButton!
    @IBOutlet var locationBtn: UIButton!
    @IBOutlet var cardView: UIView!
    
    // 이미지들 넣기
    let markerImage = NMFOverlayImage(name: "picker") //마커
    let currentLImage = NMFOverlayImage(name: "group511") // 현위치 동그라미 이미지
    let directionImage = NMFOverlayImage(name: "polygon4") //direction group140 polygon4
    let compassImage = NMFOverlayImage(name: "group510") //compass group158 group510
    
    let selectedImage = NMFOverlayImage(name: "pickerSelected")
    let unselectedImage = NMFOverlayImage(name: "picker")
    let uniSelectedImage = NMFOverlayImage(name: "pickerUniSelected")
    
    var locationManager = CLLocationManager()
    var markers = [NMFMarker]()
    var beforeMarker: NMFMarker?
    
    var camera: NMFCameraUpdate!
    var cameraUpdate: NMFCameraUpdate!
    
    var placeMangWon = NMGLatLng(lat: 37.555941, lng: 126.910067)
    
    // 망원 좌표
    var mangWon: [NMGLatLng] = [NMGLatLng(lat: 37.556635, lng: 126.908433),
                                NMGLatLng(lat: 37.556987, lng: 126.907755),
                                NMGLatLng(lat: 37.556748, lng: 126.910195),
                                NMGLatLng(lat: 37.555522, lng: 126.904833),
                                NMGLatLng(lat: 37.557539, lng: 126.904790),
                                NMGLatLng(lat: 37.556534, lng: 126.907744),
                                NMGLatLng(lat: 37.560183, lng: 126.909584),
                                NMGLatLng(lat: 37.560889, lng: 126.906703),
                                NMGLatLng(lat: 37.561905, lng: 126.903533),
                                NMGLatLng(lat: 37.560668, lng: 126.901677),
                                NMGLatLng(lat: 37.559249, lng: 126.902487),
                                NMGLatLng(lat: 37.554322, lng: 126.906648),
                                NMGLatLng(lat: 37.555351, lng: 126.902356),
                                NMGLatLng(lat: 37.558472, lng: 126.907506),
                                NMGLatLng(lat: 37.557741, lng: 126.910403),
                                NMGLatLng(lat: 37.560786, lng: 126.906412),
                                NMGLatLng(lat: 37.558884, lng: 126.905102)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardView.isHidden = true
        
        locationBtn.addTarget(self, action: #selector(locationBtnTapped), for: .touchUpInside)
        
        myBtn.setImage(UIImage(named: "btnCurrentLocation"), for: UIControl.State.normal)
        myBtn.setImage(UIImage(named: "compassIc"), for: UIControl.State.selected)
        myBtn.addTarget(self, action: #selector(myButtonTapped), for: .touchUpInside)
        
        mapView.addCameraDelegate(delegate: self)
        mapView.touchDelegate = self
//        setLocation()
        setMap()
//        setCamera()
        setMarker()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        super.touchesBegan(touches, with: event)
        if let touch = touches.first , touch.view == self.mapView {
            cardView.isHidden = true
        }
    }
    
//    func setLocation(){
//        locationManager = CLLocationManager()
//        locationManager.delegate = self
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.startUpdatingLocation()
//
//        let coor = locationManager.location?.coordinate
//        move(at: coor)
//    }
    
    func setMap() {
        mapView.minZoomLevel = 5
        mapView.maxZoomLevel = 18
    }
    
//    func setCamera() {
//        camera = NMFCameraUpdate(scrollTo: placeMangWon)
//        camera.animation = .linear
//        mapView.moveCamera(camera)
//    }
    
    func setMarker() {
        if markers.isEmpty {
            for index in 0..<mangWon.count {
                
                let marker = NMFMarker(position: mangWon[index], iconImage: unselectedImage)
                marker.isHideCollidedMarkers = true
                marker.touchHandler = { [self] (overlay: NMFOverlay) -> Bool in
                    self.beforeMarker?.iconImage = self.unselectedImage
                    marker.iconImage = self.selectedImage
                    self.beforeMarker = marker
                    markerDidTap()
                    return true
                }
                
                
                marker.mapView = mapView
                markers.append(marker)
            }
        }
//        if markers.isEmpty {
//
//            self.beforeMarker?.iconImage = self.unselectedImage
//
//            for index in 0..<mangWon.count {
//
//                let marker = NMFMarker(position: mangWon[index], iconImage: unselectedImage)
//
////                self.beforeMarker?.iconImage = self.unselectedImage
//
//                marker.isHideCollidedMarkers = true
//                marker.touchHandler = { [self] (overlay: NMFOverlay) -> Bool in
//
//                    if self.beforeMarker?.iconImage == self.unselectedImage {
//                        marker.iconImage = self.selectedImage
//                    } else {
//                        marker.iconImage = self.unselectedImage
//                    }
//                    self.beforeMarker = marker
//                    markerDidTap(status: self.beforeMarker!)
//                    return true
//                }
//
//                marker.mapView = mapView
//                markers.append(marker)
//            }
//        }
    }
    @objc func markerDidTap(){
        if cardView.isHidden == true {
            cardView.isHidden = false
        } else {
            cardView.isHidden = true
        }
    }
    

//    func currentLocation(at coordinate: CLLocationCoordinate2D?) {
//        guard let coordinate = coordinate else {return}
//
//        let latitude = coordinate.latitude
//        let longitude = coordinate.longitude
//        let camera = NMFCameraUpdate(scrollTo: NMGLatLng(lat: latitude, lng: longitude))
//        cameraUpdate.animation = .easeIn
//        cameraUpdate.animationDuration = 0.5
//        mapView.zoomLevel = 14
//        mapView.moveCamera(camera)
//    }
    
//    func move(at coordinate: CLLocationCoordinate2D?) {
//
//        let locationOverlay = mapView.locationOverlay
        
//        guard let coordinate = coordinate else {return}
//
//        let latitude = coordinate.latitude
//        let longitude = coordinate.longitude
//        let camera = NMFCameraUpdate(scrollTo: NMGLatLng(lat: latitude, lng: longitude))
//
//
//        mapView.moveCamera(camera)
//        marker.position = NMGLatLng(lat: latitude, lng: longitude)
        
//        mapView.positionMode = .direction
//        mapView.locationOverlay.icon = currentLImage
//        mapView.locationOverlay.subIcon = directionImage
//        
//        print("zoom level: \(mapView.zoomLevel)")
//        
//        locationOverlay.circleRadius = 0 // 기본 원그림자 없애기
//        locationOverlay.iconWidth = CGFloat(NMF_LOCATION_OVERLAY_SIZE_AUTO)
//        locationOverlay.iconHeight = CGFloat(NMF_LOCATION_OVERLAY_SIZE_AUTO)
        
//        locationOverlay.location = NMGLatLng(lat: latitude, lng: longitude)
//    }
    
    @objc func locationBtnTapped(_ sender:UIButton) {
        cameraUpdate = NMFCameraUpdate(scrollTo: placeMangWon)
        cameraUpdate.animation = .easeIn
        cameraUpdate.animationDuration = 0.5
        mapView.moveCamera(cameraUpdate)
    }
    
    @objc func myButtonTapped(_ sender:UIButton){
//        let coor = locationManager.location?.coordinate
//        currentLocation(at: coor)
        mapView.zoomLevel = 14
        
        if sender.isSelected == true {
            sender.isSelected = false
            print("direction btn | zoom level \(mapView.zoomLevel)")
            
            mapView.positionMode = .direction
            mapView.locationOverlay.icon = currentLImage
            mapView.locationOverlay.subIcon = directionImage
        } else {
            sender.isSelected = true
            print("compass btn | zoom level \(mapView.zoomLevel)")
            
            mapView.positionMode = .compass
            mapView.locationOverlay.icon = currentLImage
            mapView.locationOverlay.subIcon = compassImage
        }
    }
}

extension NaverTestVC: NMFMapViewTouchDelegate {
    func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
        print("\(latlng)")
    }
    
    func mapView(_ mapView: NMFMapView, didTap symbol: NMFSymbol) -> Bool {
        print(symbol)
        return true
    }
}

extension NaverTestVC: NMFMapViewCameraDelegate {
    func mapView(_ mapView: NMFMapView, cameraWillChangeByReason reason: Int, animated: Bool){
        if reason == NMFMapChangedByGesture {
//            print("지도 움직이는 중 zoom level: \(mapView.zoomLevel)")
            mapView.locationOverlay.icon = currentLImage
        }
      
    }
    
    func mapView(_ mapView: NMFMapView, cameraIsChangingByReason reason: Int) {
        
    }
    
    func mapView(_ mapView: NMFMapView, cameraDidChangeByReason reason: Int, animated: Bool) {

    }
    
    func mapViewCameraIdle(_ mapView: NMFMapView){
    }
}


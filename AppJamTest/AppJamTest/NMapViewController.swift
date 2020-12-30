//
//  NMapViewController.swift
//  AppJamTest
//
//  Created by ✨EUGENE✨ on 2020/12/28.
//

import UIKit
import NMapsMap
import CoreLocation

class NMapViewController: UIViewController, CLLocationManagerDelegate {

    
    @IBOutlet var mapView: NMFMapView!
    @IBOutlet var myBtn: UIButton!
    
    let marker = NMFMarker()
    var locationManager = CLLocationManager()
    
//    var mapView: NMFMapView {
//           return naverMapView.mapView
//       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myBtn.setImage(UIImage(systemName: "star"), for: UIControl.State.normal)
        myBtn.setImage(UIImage(systemName: "star.fill"), for: UIControl.State.selected)
        myBtn.addTarget(self, action: #selector(myButtonTapped), for: UIControl.Event.touchUpInside)

        
        
        marker.position = NMGLatLng(lat: 37.5670135, lng: 126.9783740)
        marker.iconImage = NMFOverlayImage(name: "plus.button")
        marker.mapView = mapView
        
        
        
//        mapView.lightness = -0.75
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() //권한 요청
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        let coor = locationManager.location?.coordinate

        move(at: coor)
        
    }
    func move(at coordinate: CLLocationCoordinate2D?) {
//        guard let coordicate = coordinate else { return }
//
//        let latitude = coordinate?.latitude
//        let longitude = coordinate?.longitude
//
//        let camera = NMFCameraUpdate(scrollTo: NMGLatLng(lat: latitude!, lng: longitude!), zoomTo: 14.0)
//        mapView.moveCamera(camera)

//        marker.position = NMGLatLng(lat: latitude!, lng: longitude!)
//        let locationOverlay = mapView.locationOverlay
//        locationOverlay.location = NMGLatLng(lat: latitude!, lng: longitude!)
//        marker.mapView = mapView
        mapView.positionMode = .direction
    }

    @objc func myButtonTapped(){
      if myBtn.isSelected == true {
        myBtn.isSelected = false
        mapView.positionMode = .direction
        
      } else {
        myBtn.isSelected = true
        mapView.positionMode = .compass
      }
    }
    
}
//extension ViewController {
//    func move(at coordinate: CLLocationCoordinate2D?) {
//        guard let coordicate = coordinate else { return }
//
//        let latitude = coordinate?.latitude
//        let longitude = coordinate?.longitude
//
//        let camera = NMFCameraUpdate(scrollTo: NMGLatLng(lat: latitude!, lng: longitude!), zoomTo: 14.0)
//        mapView.moveCamera(camera)
//
//        marker.position = NMGLatLng(lat: latitude!, lng: longitude!)
//        let locationOverlay = mapView.locationOverlay
//        locationOverlay.location = NMGLatLng(lat: latitude!, lng: longitude!)
//        marker.mapView = mapView
//    }
//}
//
//extension ViewController {
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let firstLocation = locations.first else { return }
//        move(at: firstLocation.coordinate)
//    }
//}

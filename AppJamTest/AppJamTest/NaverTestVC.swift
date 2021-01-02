//
//  NaverTestVC.swift
//  AppJamTest
//
//  Created by ✨EUGENE✨ on 2021/01/02.
//

import UIKit
import NMapsMap

class NaverTestVC: UIViewController, CLLocationManagerDelegate {

    let myBtn = UIButton(frame: CGRect(x: 100, y: 100, width: 50, height: 20))
    let mapView = NMFMapView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myBtn.backgroundColor = .blue
        myBtn.addTarget(self, action: #selector(myButtonTapped), for: .touchUpInside)
        setMap()
        view.addSubview(mapView)
        view.addSubview(myBtn)
    }

    func setMap(){
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() //권한 요청
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        let coor = locationManager.location?.coordinate

        move(at: coor)
    }
    func move(at coordinate: CLLocationCoordinate2D?) {
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

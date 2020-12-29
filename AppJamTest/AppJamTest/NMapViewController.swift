//
//  NMapViewController.swift
//  AppJamTest
//
//  Created by ✨EUGENE✨ on 2020/12/28.
//

import UIKit
import NMapsMap

class NMapViewController: UIViewController {

    
    @IBOutlet var mapView: NMFMapView!
    
    
    let marker = NMFMarker()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        marker.position = NMGLatLng(lat: 37.5670135, lng: 126.9783740)
        marker.iconImage = NMFOverlayImage(name: "plus.button")
        marker.mapView = mapView
        
        mapView.positionMode = .compass
        
//        let locationOverlay = mapView.locationOverlay
//        locationOverlay.hidden = true
        
        
        
        
    }
    @IBAction func changeColor(_ sender: Any) {
        
        //mapView.lightness = -0.6
        
        let naverMapView = NMFMapView(frame: view.frame)
        naverMapView.lightness = -0.6
        view.addSubview(naverMapView)
    }

}

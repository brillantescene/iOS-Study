//
//  NaverMapTest.swift
//  AppJamTest
//
//  Created by ✨EUGENE✨ on 2021/01/27.
//

import UIKit
import NMapsMap

class NaverMapTest: UIViewController {

    @IBOutlet var mapView: NMFMapView!
    @IBOutlet var locationBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.showLegalNotice()
        SetLocationBtn()
//        mapView.logoAlign = .leftTop
        mapView.logoMargin = UIEdgeInsets(top: 0, left: 30, bottom: 200, right: 0)
    }
}

extension NaverMapTest {
    func SetLocationBtn(){
        locationBtn.setTitle("compass", for: UIControl.State.selected)
        locationBtn.addTarget(self, action: #selector(locationTapped), for: .touchUpInside)
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

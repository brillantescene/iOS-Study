//
//  ViewController+Extension.swift
//  mapKitTest
//
//  Created by ✨EUGENE✨ on 2021/11/12.
//

import UIKit
import MapKit

extension ViewController: MKMapViewDelegate {
    /**
    // 1. mapView(_:viewFor:) 함수는 map에 annotation이 추가될 때마다 호출됨
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        /** 2.
         앱에서 사용자 위치와 같은 다른 어노테이션을 사용할 수 있음.
         이 어노테이션이 Store 객체인지 확인하는거임.
         그렇지 않으면 nil을 반환해서 기본 어노테이션을 사용하도록 함.
         */
        guard let annotation = annotation as? Store else {
            return nil
        }
        // 3. 뷰를 MKMarkerAnnotationView로 만듦. 이미지로 할 수도 있음 기다려보셈
        let identifier = "store"
        var view: MKMarkerAnnotationView
        // 4. tableView(_:cellForRowAt:)처럼 표시되지 않는 어노테이션을 재사용함
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        
        return view
    }
     */
}

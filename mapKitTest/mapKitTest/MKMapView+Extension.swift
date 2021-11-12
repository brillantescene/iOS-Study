//
//  MKMapView+Extension.swift
//  mapKitTest
//
//  Created by ✨EUGENE✨ on 2021/11/12.
//

import MapKit

extension MKMapView {
    
    // CLLocationDistance 값이 작을수록 줌인
    func centerToLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 200) {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}

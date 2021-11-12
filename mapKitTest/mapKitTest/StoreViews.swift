//
//  StoreViews.swift
//  mapKitTest
//
//  Created by ✨EUGENE✨ on 2021/11/12.
//

import Foundation
import MapKit

class StoreMarkerView: MKMarkerAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            // 1.
            guard let store = newValue as? Store else {
                return
            }
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
//            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
            // 2.
            markerTintColor = store.markerTintColor
            if let letter = store.discipline?.first {
                glyphText = String(letter)
            }
        }
    }
}

class StoreView: MKMarkerAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            // 1.
            guard let store = newValue as? Store else {
                return
            }
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
            // 2.
            image = store.image
            
            if let letter = store.discipline?.first {
                glyphText = String(letter)
            }
        }
    }
}

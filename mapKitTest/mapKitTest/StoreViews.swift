//
//  StoreViews.swift
//  mapKitTest
//
//  Created by ✨EUGENE✨ on 2021/11/12.
//

import Foundation
import MapKit
import SnapKit

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
    
    let imageView = MarkerImageView(frame: CGRect(x: 0, y: 0, width: 56, height: 56))

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        self.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.top.left.right.bottom.equalTo(self)
        }

    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override var annotation: MKAnnotation? {
        willSet {
            // 1.
            guard let store = newValue as? Store else {
                return
            }
//            canShowCallout = true
//            calloutOffset = CGPoint(x: -5, y: 5)
//            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)


            // 2.
//            image = store.image
            markerTintColor = store.markerTintColor

            if let letter = store.discipline?.first {
                imageView.label.text = String(letter)
            }
        }
    }
}

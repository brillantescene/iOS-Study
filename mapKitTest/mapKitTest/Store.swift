//
//  Store.swift
//  mapKitTest
//
//  Created by ✨EUGENE✨ on 2021/11/12.
//

import Foundation
import MapKit

class Store: NSObject, MKAnnotation {
    let title: String? // 장소이름
    let locationName: String? // 주소
    let discipline: String? // 카테고리
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?, locationName: String?, discipline: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? { // 부제목
        return locationName
    }
}

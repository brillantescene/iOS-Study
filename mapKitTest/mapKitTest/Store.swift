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
    let category: String? // 카테고리
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?, locationName: String?, category: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.category = category
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? { // 부제목
        return locationName
    }
    
    init?(feature: MKGeoJSONFeature) {
        //1
        guard let point = feature.geometry.first as? MKPointAnnotation,
              let propertiesData = feature.properties,
              // JSONserialization로 데이터를 Dictionary로 만들기
              let json = try? JSONSerialization.jsonObject(with: propertiesData),
              let properties = json as? [String: Any]
        else {
            return nil
        }
        
        title = properties["title"] as? String
        locationName = properties["location"] as? String
        category = properties["category"] as? String
        coordinate = point.coordinate
        
        super.init()
    }
}

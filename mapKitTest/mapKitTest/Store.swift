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
    
    init?(feature: MKGeoJSONFeature) {
        //1
        guard let point = feature.geometry.first as? MKPointAnnotation,
              let propertiesData = feature.properties,
              // JSONserialization로 데이터를 Dictionary로 만들기
              let json = try? JSONSerialization.jsonObject(with: propertiesData),
              let properties = json as? [String: Any]
        else {
            print("여기서부턴가")
            return nil
        }
        
        title = properties["title"] as? String
        locationName = properties["location"] as? String
        discipline = properties["discipline"] as? String
        coordinate = point.coordinate
        
        super.init()
    }
    
    var markerTintColor: UIColor {
        switch discipline {
        case "food":
            return .systemPink
        case "cafe":
            return .yellow
        default:
            return .white
        }
    }
    var image: UIImage {
        guard let name = discipline else {
            return #imageLiteral(resourceName: "ghost")
        }
        
        switch name {
        case "food":
            return #imageLiteral(resourceName: "ghost")
        default:
            return #imageLiteral(resourceName: "ghost")
        }
    }
}

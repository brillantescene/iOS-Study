//
//  ViewController.swift
//  mapKitTest
//
//  Created by ✨EUGENE✨ on 2021/11/08.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation! // 내 위치 저장
    
    // 밤가시
    let centerLocation = CLLocation(latitude: 37.66906773682083, longitude: 126.78460869875774)
    
    private var stores: [Store] = [Store(title: "밤가시 버거",
                                         locationName: "경기도 고양시 일산동구 정발산동 일산로372번길 46",
                                         discipline: "햄버거",
                                         coordinate: CLLocationCoordinate2D(latitude: 37.66906773682083, longitude: 126.78460869875774)),
                                         Store(title: "2리 식당",
                                               locationName: "경기도 고양시 일산동구 일산동구 정발산동",
                                               discipline: "햄버거",
                                               coordinate: CLLocationCoordinate2D(latitude: 37.66956064613412, longitude: 126.78517534875819)),
                                    Store(title: "재이식당",
                                          locationName: "경기도 고양시 일산동구 정발산동 1286-11",
                                          discipline: "햄버거",
                                          coordinate: CLLocationCoordinate2D(latitude: 37.670800813026574, longitude: 126.78361656501401)),
                                    Store(title: "프리커피",
                                          locationName: "경기도 고양시 일산동구 마두1동 880-11",
                                          discipline: "햄버거",
                                          coordinate: CLLocationCoordinate2D(latitude: 37.66225049053905, longitude: 126.78828553341091))
                                         ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setMap()
        self.setInitialLocation()
        self.setCurrentLocation()
        self.setZoom()
        self.setAnnotation()
//        self.loadInitialData()
//        mapView.addAnnotations(stores)
    }
    // MARK: - 마커 추가
    func setAnnotation() {
//        let marker = Store(
//            title: "밤가시 버거",
//            locationName: "경기도 고양시 일산동구 정발산동 일산로372번길 46",
//            discipline: "햄버거",
//            coordinate: CLLocationCoordinate2D(latitude: 37.66906773682083, longitude: 126.78460869875774))
//        mapView.addAnnotation(marker)
        
        mapView.addAnnotations(stores)
    }
    
    // MARK: - 데이터 초기화
    private func loadInitialData() {
        
        print("왜 안나와")
        // 1. 나중에 서버로 받아오는 부분이 되겠지?
        guard let fileName = Bundle.main.url(forResource: "PublicStore", withExtension: "geojson"),
              let storeData = try? Data(contentsOf: fileName) else {
                  print("혹시 여기ㅑ")
                  return }
        
        do {
            print("아니 여기 안오고 뭐해")
            // 2. MKGeoJSONDecoder를 사용하여 GeoJSON 객체배열을 얻고 CompactMap으로 MKGeoJSONFeature만 남김
            let features = try MKGeoJSONDecoder()
                .decode(storeData)
                .compactMap { $0 as? MKGeoJSONFeature }
            print("features \(features)")
            // 3. 이니셜라이저와 compactMap로 MKGeoJSONFeature 객체를 Store로 변환
            let validStores = features.compactMap(Store.init)
            print("validStores \(validStores)")
            // 4.
            stores.append(contentsOf: validStores)
            print("stores \(stores)")
        } catch {
            print("아 썅 여기냐?")
            print("Unexpected error: \(error).")
        }
        print("염병")
    }
    // MARK: - 초기 위치 설정
    func setInitialLocation() {
        // 밤가시
        mapView.centerToLocation(self.centerLocation)
    }
    
    // MARK: - 지도 설정
    func setMap() {
        mapView.delegate = self
        mapView.mapType = MKMapType.standard
        mapView.showsUserLocation = true // 위치 보기 설정
        setCurrentLocation()
    }
    
    func setCurrentLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() //권한요청
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // 위치 정보 정확도
        locationManager.startUpdatingLocation() // 위치 업데이트 시작
    }
    
    // MARK: - 줌 아웃 제한
    // 이정도면 수도권까지 줌아웃 가능
    func setZoom() {
        let region = MKCoordinateRegion(center: self.centerLocation.coordinate,
                                        latitudinalMeters: 50000,
                                        longitudinalMeters: 60000)
        mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region),
                                           animated: true)
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200000)
        mapView.setCameraZoomRange(zoomRange, animated: true)
    }
}


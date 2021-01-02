//
//  NMapViewController.swift
//  AppJamTest
//
//  Created by ✨EUGENE✨ on 2020/12/28.
//

import UIKit
import NMapsMap
import CoreLocation

class NMapViewController: UIViewController, CLLocationManagerDelegate {

    enum CardState {
        case expanded
        case collapsed
    }
    
    @IBOutlet var mapView: NMFMapView!
    @IBOutlet var myBtn: UIButton!
    @IBOutlet var cardBtn: UIButton!
    @IBOutlet var cardListView: UIView!
    
    
    let marker = NMFMarker()
    var locationManager = CLLocationManager()
    
//    var mapView: NMFMapView {
//           return naverMapView.mapView
//       }
    
    var cardViewController:CardViewController!
    var visualEffectView:UIVisualEffectView!
    
    
    let cardHeight:CGFloat = 600
    let cardHandleAreaHeight:CGFloat = 65
    
    var cardVisible = false
    var nextState:CardState {
        return cardVisible ? .collapsed : .expanded
    }
    var runningAnimations = [UIViewPropertyAnimator]()
    var animationProgressWhenInterrupted:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCard()
        setMap()
        cardListView.layer.cornerRadius = 10
        cardListView.isHidden = true
        cardBtn.addTarget(self, action: #selector(myCardButtonTapped), for: UIControl.Event.touchUpInside)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        super.touchesBegan(touches, with: event)
        if let touch = touches.first , touch.view == self.mapView {
            cardListView.isHidden = true
            cardViewController.view.isHidden = false
        }
    }
    
    @objc func myCardButtonTapped(){
      if cardBtn.isSelected == true {
        cardBtn.isSelected = false
        cardListView.isHidden = true
//        cardViewController.view.isHidden = false

      } else {
        cardBtn.isSelected = true
        cardListView.isHidden = false
        cardViewController.view.isHidden = true
      }
    }
    
    func setMap() {
        myBtn.setImage(UIImage(systemName: "star"), for: UIControl.State.normal)
        myBtn.setImage(UIImage(systemName: "star.fill"), for: UIControl.State.selected)
        myBtn.addTarget(self, action: #selector(myButtonTapped), for: UIControl.Event.touchUpInside)

        
        
//        marker.position = NMGLatLng(lat: 37.5670135, lng: 126.9783740)
//        marker.iconImage = NMFOverlayImage(name: "plus.button")
        marker.mapView = mapView
        
        
        
//        mapView.lightness = -0.75
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() //권한 요청
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        let coor = locationManager.location?.coordinate

        move(at: coor)
    }
    
    func move(at coordinate: CLLocationCoordinate2D?) {
//        guard let coordicate = coordinate else { return }
//
//        let latitude = coordinate?.latitude
//        let longitude = coordinate?.longitude
////
//        let camera = NMFCameraUpdate(scrollTo: NMGLatLng(lat: latitude!, lng: longitude!), zoomTo: 14.0)
//        mapView.moveCamera(camera)

//        marker.position = NMGLatLng(lat: latitude!, lng: longitude!)
//        marker.position = NMGLatLng(lat: latitude! + 0.01, lng: longitude! + 0.01)
//        marker.iconImage = NMFOverlayImage(name: "plus.button")
//        let locationOverlay = mapView.locationOverlay
//        locationOverlay.location = NMGLatLng(lat: latitude!, lng: longitude!)
//        marker.mapView = mapView
        mapView.positionMode = .direction
    }

    @objc func myButtonTapped(){
      if myBtn.isSelected == true {
        myBtn.isSelected = false
        mapView.positionMode = .direction
        
      } else {
        myBtn.isSelected = true
        mapView.positionMode = .compass
      }
    }
    
    func setupCard() {
//        visualEffectView = UIVisualEffectView()
//        visualEffectView.frame = self.view.frame
//        self.view.addSubview(visualEffectView)
        
        cardViewController = CardViewController(nibName:"CardViewController", bundle:nil)
        self.addChild(cardViewController)
        self.view.addSubview(cardViewController.view)
        
        cardViewController.view.frame = CGRect(x: 0, y: self.view.frame.height - cardHandleAreaHeight, width: self.view.bounds.width, height: cardHeight)
        
        cardViewController.view.clipsToBounds = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(NMapViewController.handleCardTap(recognzier:)))
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(NMapViewController.handleCardPan(recognizer:)))
        
        cardViewController.handleArea.addGestureRecognizer(tapGestureRecognizer)
        cardViewController.handleArea.addGestureRecognizer(panGestureRecognizer)
        
        
    }

    @objc
    func handleCardTap(recognzier:UITapGestureRecognizer) {
        switch recognzier.state {
        case .ended:
            animateTransitionIfNeeded(state: nextState, duration: 0.9)
        default:
            break
        }
    }
    
    @objc
    func handleCardPan (recognizer:UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            startInteractiveTransition(state: nextState, duration: 0.9)
        case .changed:
            let translation = recognizer.translation(in: self.cardViewController.handleArea)
            var fractionComplete = translation.y / cardHeight
            fractionComplete = cardVisible ? fractionComplete : -fractionComplete
            updateInteractiveTransition(fractionCompleted: fractionComplete)
        case .ended:
            continueInteractiveTransition()
        default:
            break
        }
        
    }
    
    func animateTransitionIfNeeded (state:CardState, duration:TimeInterval) {
        if runningAnimations.isEmpty {
            let frameAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) {
                switch state {
                case .expanded:
                    self.cardViewController.view.frame.origin.y = self.view.frame.height - self.cardHeight
                case .collapsed:
                    self.cardViewController.view.frame.origin.y = self.view.frame.height - self.cardHandleAreaHeight
                }
            }
            
            frameAnimator.addCompletion { _ in
                self.cardVisible = !self.cardVisible
                self.runningAnimations.removeAll()
            }
            
            frameAnimator.startAnimation()
            runningAnimations.append(frameAnimator)
            
            
            let cornerRadiusAnimator = UIViewPropertyAnimator(duration: duration, curve: .linear) {
                switch state {
                case .expanded:
                    self.cardViewController.view.layer.cornerRadius = 12
                case .collapsed:
                    self.cardViewController.view.layer.cornerRadius = 0
                }
            }
            
            cornerRadiusAnimator.startAnimation()
            runningAnimations.append(cornerRadiusAnimator)
            
//            let blurAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) {
//                switch state {
//                case .expanded:
//                    self.visualEffectView.effect = UIBlurEffect(style: .dark)
//                case .collapsed:
//                    self.visualEffectView.effect = nil
//                }
//            }
            
//            blurAnimator.startAnimation()
//            runningAnimations.append(blurAnimator)
            
        }
    }
    
    func startInteractiveTransition(state:CardState, duration:TimeInterval) {
        if runningAnimations.isEmpty {
            animateTransitionIfNeeded(state: state, duration: duration)
        }
        for animator in runningAnimations {
            animator.pauseAnimation()
            animationProgressWhenInterrupted = animator.fractionComplete
        }
    }
    
    func updateInteractiveTransition(fractionCompleted:CGFloat) {
        for animator in runningAnimations {
            animator.fractionComplete = fractionCompleted + animationProgressWhenInterrupted
        }
    }
    
    func continueInteractiveTransition (){
        for animator in runningAnimations {
            animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
        }
    }

    
}
//extension ViewController {
//    func move(at coordinate: CLLocationCoordinate2D?) {
//        guard let coordicate = coordinate else { return }
//
//        let latitude = coordinate?.latitude
//        let longitude = coordinate?.longitude
//
//        let camera = NMFCameraUpdate(scrollTo: NMGLatLng(lat: latitude!, lng: longitude!), zoomTo: 14.0)
//        mapView.moveCamera(camera)
//
//        marker.position = NMGLatLng(lat: latitude!, lng: longitude!)
//        let locationOverlay = mapView.locationOverlay
//        locationOverlay.location = NMGLatLng(lat: latitude!, lng: longitude!)
//        marker.mapView = mapView
//    }
//}
//
//extension ViewController {
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let firstLocation = locations.first else { return }
//        move(at: firstLocation.coordinate)
//    }
//}

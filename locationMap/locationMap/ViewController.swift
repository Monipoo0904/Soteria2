



//
//  ViewController.swift
//  locationMap
//
//  Created by Scholar on 7/19/22.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, UIGestureRecognizerDelegate{
    //map
        
    // Set initial location to Howard
    let initialLocation = CLLocation(latitude: 38.9227, longitude: -77.0194)
    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        
        //map points
         super.viewDidLoad()
        map.centerToLocation(initialLocation)
        let howard = CLLocation(latitude: 38.9227, longitude: -77.0194)
        let region = MKCoordinateRegion(
          center: howard.coordinate,
          latitudinalMeters: 50000,
          longitudinalMeters: 60000)
        map.setCameraBoundary(
          MKMapView.CameraBoundary(coordinateRegion: region),
          animated: true)
        
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200000)
        map.setCameraZoomRange(zoomRange, animated: true)
        
        //annotation for map
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 38.9227, longitude: -77.0194)
        
        map.addAnnotation(annotation)
        
        //code for map annotation that user can add
        let LongTap = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.handleLongTap(gestureRecognizer:)))
        self.map.addGestureRecognizer(LongTap)
                                            
     }
    
    //objc
    @objc func handleLongTap(gestureRecognizer: UILongPressGestureRecognizer){
        if gestureRecognizer.state != UIGestureRecognizer.State.ended{
            let touchLocation = gestureRecognizer.location(in: map)
            let locationCoordinate = map.convert(touchLocation, toCoordinateFrom: map)
            print("tapped at Latitude: \(locationCoordinate.latitude) and Longitude: \(locationCoordinate.longitude)")
            let annotation = MKPointAnnotation()
            annotation.coordinate = locationCoordinate
            
            map.addAnnotation(annotation)
            
            annotation.title = "tapped at Latitude: \(locationCoordinate.latitude) and Longitude: \(locationCoordinate.longitude)"


        
        }
        //
        if gestureRecognizer.state != UIGestureRecognizer.State.began{
            return
        }
    }
    
 
    }

    


//extension
private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 1000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}
  
    
//    //variable declarations
//    var locationManager: CLLocationManager!
//    var currentLocationStr = "Current Location"
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//           determineCurrentLocation()
//       }
//
//
//
//    func locationManager(_manager: CLLocationManager, didUpdateLocations locations:[CLLocation] ){
//        let mUserLocation:CLLocation = locations[0] as CLLocation
//
//                let center = CLLocationCoordinate2D(latitude: mUserLocation.coordinate.latitude, longitude: mUserLocation.coordinate.longitude)
//                let mRegion = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
//
//                map.setRegion(mRegion, animated: true)
//    }
//
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//            print("Error - locationManager: \(error.localizedDescription)")
//        }
//    //MARK:- Intance Methods
//
//    func determineCurrentLocation() {
//        locationManager = CLLocationManager()
////        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.requestAlwaysAuthorization()
//
//        if CLLocationManager.locationServicesEnabled() {
//            locationManager.startUpdatingLocation()
//        }
//    }
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        let mUserLocation:CLLocation = locations[0] as CLLocation
//        let center = CLLocationCoordinate2D(latitude: mUserLocation.coordinate.latitude, longitude: mUserLocation.coordinate.longitude)
//        let mRegion = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
//        map.setRegion(mRegion, animated: true)
//
//        // Get user's Current Location and Drop a pin
//    let mkAnnotation: MKPointAnnotation = MKPointAnnotation()
//        mkAnnotation.coordinate = CLLocationCoordinate2DMake(mUserLocation.coordinate.latitude, mUserLocation.coordinate.longitude)
//        mkAnnotation.title = self.setUsersClosestLocation(mLattitude: mUserLocation.coordinate.latitude, mLongitude: mUserLocation.coordinate.longitude)
//        map.addAnnotation(mkAnnotation)
//    }
//    //MARK:- Intance Methods
//
//    func setUsersClosestLocation(mLattitude: CLLocationDegrees, mLongitude: CLLocationDegrees) -> String {
//        let geoCoder = CLGeocoder()
//        let location = CLLocation(latitude: mLattitude, longitude: mLongitude)
//
//        geoCoder.reverseGeocodeLocation(location) {
//            (placemarks, error) -> Void in
//
//            if let mPlacemark = placemarks{
//                if let dict = mPlacemark[0].addressDictionary as? [String: Any]{
//                    if let Name = dict["Name"] as? String{
//                        if let City = dict["City"] as? String{
//                            self.currentLocationStr = Name + ", " + City
//                        }
//                    }
//                }
//            }
//        }
//        return currentLocationStr
//
//
//
//}
//        }

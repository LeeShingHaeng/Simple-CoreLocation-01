//
//  ViewController.swift
//  Simple CoreLocation 01
//
//  Created by D7703_13 on 2019. 11. 5..
//  Copyright © 2019년 Personal Team. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let pin01 = MKPointAnnotation()
        pin01.coordinate.latitude = 35.165990
        pin01.coordinate.longitude = 129.072564
        pin01.title = "동의과학대학교"
        pin01.subtitle = "우리들의 꿈이 자라는 곳"
        
        let pin02 = MKPointAnnotation()
        pin02.coordinate.latitude = 35.164350
        pin02.coordinate.longitude = 129.064984
        pin02.title = "송상현광장"
        pin02.subtitle = "푸른 잔디밭이 좋은 곳"
        
        let pin03 = MKPointAnnotation()
        pin03.coordinate.latitude = 35.168360
        pin03.coordinate.longitude = 129.057157
        pin03.title = "부산시민공원"
        pin03.subtitle = "시민들의 휴식처"
        
        mapView.showAnnotations([pin01, pin02, pin03], animated: true)
        
        locationManager.startUpdatingLocation()
    locationManager.requestWhenInUseAuthorization()
    locationManager.requestAlwaysAuthorization()
        mapView.showsUserLocation = true
        
        
    
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations[0]
        print(userLocation)
        
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04)
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
    }

}


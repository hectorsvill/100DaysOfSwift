//
//  ViewController.swift
//  MapIt
//
//  Created by s on 3/31/20.
//  Copyright © 2020 s. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    private let dataFetcher = DataFetcher()
    private let locationManager = CLLocationManager()
    @IBOutlet weak var mapView: MKMapView!
    private var userTrackingButton: MKUserTrackingButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        mapView.delegate = self
        locationManager.requestWhenInUseAuthorization()

        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: "")

        userTrackingButton = MKUserTrackingButton(mapView: mapView)
        userTrackingButton.translatesAutoresizingMaskIntoConstraints = false
        mapView.addSubview(userTrackingButton)

        userTrackingButton.leftAnchor.constraint(equalTo: mapView.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        userTrackingButton.bottomAnchor.constraint(equalTo: mapView.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true

    }
}

// MARK: - MKMapViewDelegate
extension ViewController: MKMapViewDelegate {

//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        MKAnnotationView()
//    }

    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        print("mapViewDidChangeVisibleRegion")
    }
}

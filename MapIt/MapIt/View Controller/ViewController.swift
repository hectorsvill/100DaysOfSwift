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
    fileprivate let reuseIdentifier = "AnnotationReuseIdentifier"
    private var items: [Resource_uztv_ve9b] = [] { didSet { setMapData() } }
    private let dataFetcher = DataFetcher()
    private let locationManager = CLLocationManager()
    @IBOutlet weak var mapView: MKMapView!
    private var userTrackingButton: MKUserTrackingButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        fetchData()
    }

    private func setupViews() {
        mapView.delegate = self
        locationManager.requestWhenInUseAuthorization()


        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: reuseIdentifier)

        userTrackingButton = MKUserTrackingButton(mapView: mapView)
        userTrackingButton.translatesAutoresizingMaskIntoConstraints = false
        mapView.addSubview(userTrackingButton)

        userTrackingButton.leftAnchor.constraint(equalTo: mapView.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        userTrackingButton.bottomAnchor.constraint(equalTo: mapView.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        title = "COVID-19 resources located in City of Los Angeles"
    }

    private func fetchData() {
        dataFetcher.fetchAvailableCOVID19resourceslocatedwithintheCityofLosAngeles { resource, error in
            if let error = error {
                NSLog("Error: \(error)")
            }

            guard let resource = resource else { return }
            self.items = resource
        }
    }

    private func setMapData() {
        DispatchQueue.main.async {
            self.mapView.addAnnotations(self.items)
        }
    }
}

// MARK: - MKMapViewDelegate
extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier, for: annotation) as! MKMarkerAnnotationView
        guard let resource = annotation as? Resource_uztv_ve9b else { return nil }

        annotationView.tintColor = .green
        annotationView.glyphImage = UIImage(systemName: "bandage")!
        annotationView.canShowCallout = true

        let mapDetailView = MapDetailView(frame: .zero)
        mapDetailView.resource = resource
        annotationView.detailCalloutAccessoryView = mapDetailView
        return annotationView
    }

    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        print("mapViewDidChangeVisibleRegion")
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {

        print("didselect")
    }
}

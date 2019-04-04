//
//  ViewController.swift
//  Project16
//
//  Created by Hector Steven on 4/3/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import MapKit
import UIKit

class ViewController: UIViewController, MKMapViewDelegate {

	@IBOutlet var mapView: MKMapView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupCapitals()
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(changeMapType))
		
	}
	
	@objc func changeMapType() {
		let ac = UIAlertController(title: "Map Type", message: nil, preferredStyle: .actionSheet)
		
		
		ac.addAction(UIAlertAction(title: "mutedStandard", style: .default, handler: {
			action in self.mapView.mapType = .mutedStandard
		}))
		
		ac.addAction(UIAlertAction(title: "hybrid", style: .default, handler: {
			action in self.mapView.mapType = .hybrid
		}))
		
		ac.addAction(UIAlertAction(title: "hybridFlyover", style: .default, handler: {
			action in self.mapView.mapType = .hybridFlyover
		}))
		
		
		ac.addAction(UIAlertAction(title: "mutedStandard", style: .default, handler: {
			action in self.mapView.mapType = .mutedStandard
		}))
		
		ac.addAction(UIAlertAction(title: "satellite", style: .default, handler: {
			action in self.mapView.mapType = .satellite
		}))
		
		ac.addAction(UIAlertAction(title: "satelliteFlyover", style: .default, handler: {
			action in self.mapView.mapType = .satelliteFlyover
		}))
		
		ac.addAction(UIAlertAction(title: "standard", style: .default, handler: {
			action in self.mapView.mapType = .standard
		}))
		
		ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))

		present(ac, animated: true)
	}
	
	
	func setupCapitals() {
		let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 Summer Olympics.")
		let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago.")
		let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the City of Light.")
		let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it.")
		let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself.")
		mapView.addAnnotations([london, oslo, paris, rome, washington])
		
		//mapView.mapType = .mutedStandard
	}
	
	func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
		guard annotation is Capital else { return nil }
		let identifier = "capital"
	
		var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView

		if annotationView == nil {
			annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
			annotationView?.canShowCallout = true
			annotationView?.pinTintColor = .green
			
			let btn = UIButton(type: .detailDisclosure)
			annotationView?.rightCalloutAccessoryView = btn
			
		} else {
			annotationView?.annotation = annotation
		}
		return annotationView
	}
	
	
	func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
		guard let capital = view.annotation as? Capital else { return }
		let placeName = capital.title
		//let placeIndo = capital.info
		
		
		let cvc = CountryViewController()
		cvc.name = placeName
		navigationController?.pushViewController(cvc, animated: true)
		
		
//		let ac = UIAlertController(title: placeName, message: placeIndo, preferredStyle: .alert)
//		ac.addAction((UIAlertAction(title: "Ok", style: .default)))
//		present(ac, animated: true)
//
	}

}


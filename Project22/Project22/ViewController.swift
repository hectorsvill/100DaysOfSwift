//
//  ViewController.swift
//  Project22
//
//  Created by Hector Steven on 4/21/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//
import CoreLocation
import UIKit

class ViewController: UIViewController, CLLocationManagerDelegate {
	@IBOutlet var distanceReading: UILabel!
	var locationManager:  CLLocationManager?
	
	var locationchanged = false
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .lightGray
		
		locationManager = CLLocationManager()
		locationManager?.delegate = self
		locationManager?.requestAlwaysAuthorization()
		
		
	}
	
	func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
		if status == .authorizedAlways {
			if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
				if CLLocationManager.isRangingAvailable() {
					startscanning()
				}
			}
		}
	}
	
	func startscanning() {
		let uuid = UUID(uuidString: "5A4BCFCE-174E-4BAC-A814-092E77F6B7E5")!
		let becconRegion = CLBeaconRegion(proximityUUID: uuid, major: 123, minor: 456, identifier: "MyBeacon")
		
		locationManager?.startMonitoring(for: becconRegion)
		locationManager?.startRangingBeacons(in: becconRegion)
	}
	
	func update(distance: CLProximity) {
		let ac = UIAlertController(title: "Location changed", message: nil, preferredStyle: .alert)
		ac.addAction(UIAlertAction(title: "Ok", style: .cancel))
		present(ac, animated: true)
		
		
		UIView.animate(withDuration: 1) {
			switch distance {
			case .unknown:
				self.view.backgroundColor = .lightGray
				self.distanceReading.text = "UNKOWN1"
			case .far:
				self.view.backgroundColor = .red
				self.distanceReading.text = "far"
			case .near:
				self.view.backgroundColor = .green
				self.distanceReading.text = "near"
			case .immediate:
				self.view.backgroundColor = .brown
				self.distanceReading.text = "immediate"
			default:
				self.view.backgroundColor = .gray
				self.distanceReading.text = "UNKOWN2"
			}
		}
	}
	
	func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
		if let beacon = beacons.first {
			update(distance: beacon.proximity)
		} else {
			update(distance: .unknown)
		}
	}
}


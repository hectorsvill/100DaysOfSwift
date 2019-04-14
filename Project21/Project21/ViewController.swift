//
//  ViewController.swift
//  Project21
//
//  Created by Hector Steven on 4/14/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//
import UserNotifications
import UIKit

class ViewController: UIViewController, UNUserNotificationCenterDelegate {

	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Register", style: .plain, target: self, action: #selector(registerLocal))
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Schedual", style: .plain, target: self, action: #selector(schedualLocal))
	}

	@objc func registerLocal() {
		let center = UNUserNotificationCenter.current()
		center.requestAuthorization(options: [.alert, .badge, .sound]) {
			granted, error in
			if granted {
				print("Granted!")
			} else {
				print("Not Granted")
			}
		}
	}

	@objc func schedualLocal() {
		registerCategories()
		let center = UNUserNotificationCenter.current()
		center.removeAllPendingNotificationRequests()
		let contet = UNMutableNotificationContent()
		contet.title = "@hectorsvill"
		contet.body = "I AM HECTORSVILL!!!"
		contet.categoryIdentifier = "alarm"
		contet.userInfo = ["customData": "fizzbuzz"]
		contet.sound = .default
		
		var dateComponents = DateComponents()
		dateComponents.hour = 10
		dateComponents.minute = 30
		
		//let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
	
		let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
		
		
		let request = UNNotificationRequest(identifier: UUID().uuidString, content: contet, trigger: trigger)
		center.add(request)
	}
	
	func registerCategories() {
		let center = UNUserNotificationCenter.current()
		let show = UNNotificationAction(identifier: "show", title: "Tell me more", options: .foreground)
		let category = UNNotificationCategory(identifier: "alarm", actions: [show], intentIdentifiers: [], options: [])
	
		center.setNotificationCategories([category])
	}
	
	func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
		// pull out the buried userInfo dictionary
		let userInfo = response.notification.request.content.userInfo
		
		if let customData = userInfo["customData"] as? String {
			print("Custom data received: \(customData)")
			
			switch response.actionIdentifier {
			case UNNotificationDefaultActionIdentifier:
				// the user swiped to unlock
				print("Default identifier")
				
			case "show":
				// the user tapped our "show more info…" button
				print("Show more information…")
				
			default:
				break
			}
		}
		
		// you must call the completion handler when you're done
		completionHandler()
	}
}


//
//  ViewController.swift
//  myCalendar
//
//  Created by Hector on 10/13/19.
//  Copyright © 2019 Hector. All rights reserved.
//

import UIKit
import EventKit


class ViewController: UIViewController {
    let eventStore = EKEventStore()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "auth", style: .plain, target: self, action: #selector(getauthorizationForEventStore))
    }

    @IBAction func makeEventButton(_ sender: Any) {
        self.insertEvent()
    }
    
    @objc func getauthorizationForEventStore() {
        switch EKEventStore.authorizationStatus(for: .event) {
        case .authorized:
            print("Auth")
        case .denied:
            print("access denied")
        case .notDetermined:
            eventStore.requestAccess(to: .event) { granted, error in
                if let error = error {
                    NSLog("error with request: \(error)")
                }
                
                if granted {
                    print("granted")
                    
                    //insert event
                    
                    
                }else {
                    print("acces denied")
                }
            }
            
        default:
            print("Access denied")
        }
    }
    
    func insertEvent() {
     
        let calendars = eventStore.calendars(for: .event)
        
        for calendar in calendars {
            print(calendar.title)
            
            if calendar.title == "Home" {
                let startDate = Date()
                let endDate = startDate.addingTimeInterval(2 * 60 * 60)
                
                let event = EKEvent(eventStore: eventStore)
                event.calendar = calendar
                event.title = "Hectors test324"
                event.startDate = startDate
                event.endDate = endDate
                
                do {
                    try eventStore.save(event, span: .thisEvent)
                } catch {
                    NSLog("Error with event: \(error)")
                }
            }
        }
    }
    
    

}


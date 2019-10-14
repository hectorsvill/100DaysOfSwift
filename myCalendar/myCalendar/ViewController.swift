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
                    
                    
                }else {
                    print("acces denied")
                }
            }
            
        default:
            print("Access denied")
        }
    }
    
    
    
    @objc func getauthorizationForReminders() {
        switch EKEventStore.authorizationStatus(for: .reminder) {
        case .authorized:
            print("Auth")
        case .denied:
            print("access denied")
        case .notDetermined:
            eventStore.requestAccess(to: .reminder) { granted, error in
                if let error = error {
                    NSLog("error with request: \(error)")
                }
                
                if granted {
                    print("granted")
                    
                    
                }else {
                    print("acces denied")
                }
            }
            
        default:
            print("Access denied")
        }
    }
    
    
    @IBAction func scheduleEventButtonPressed(_ sender: Any) {
        
        insertEvent()
    
    }
    
    
    @IBAction func schedulereminderButtonPressed(_ sender: Any) {
        
        getauthorizationForReminders()
        
//        let calendars  = eventStore.calendars(for: .reminder)
        let reminderCalnedar = EKCalendar(for: .reminder, eventStore: eventStore)
        reminderCalnedar.title = "Ios Reminder Calendar"
        
        
        let reminder = EKReminder(eventStore: eventStore)
        reminder.title = "test this reminder"
        
        let date = Date(timeIntervalSinceNow: 60)
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.calendar,.year, .month, .day, .hour, .minute, .second, .nanosecond], from: date)
        reminder.startDateComponents = dateComponents
        reminder.dueDateComponents = dateComponents
        
        
        print(reminder)
        
        do {
            try eventStore.saveCalendar(reminderCalnedar, commit: true)
            try eventStore.save(reminder, commit: true)
                
        } catch {
            print("error \(error)")
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


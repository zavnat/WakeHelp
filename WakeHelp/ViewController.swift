//
//  ViewController.swift
//  WakeHelp
//
//  Created by admin on 19.05.2020.
//  Copyright © 2020 Natali. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController,UIPickerViewDelegate {
  
  

 
  
  @IBOutlet weak var prefferedWakePicker: UIDatePicker!
  @IBOutlet weak var wakePicker: UIDatePicker!
  
  var appDelegate = UIApplication.shared.delegate as? AppDelegate
  
  override func viewDidLoad() {
    super.viewDidLoad()

  }
  
  
  
  func fetchNotification () {
    
//    let content = UNMutableNotificationContent()
//    content.title = "Hey I am a notification"
//    content.body = "Look at me"
//
//    let date = Date().addingTimeInterval(10)
//    let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: date)
//    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
//
//    let request = UNNotificationRequest(identifier: "Local Notification", content: content, trigger: trigger)
//
//    center.add(request) { (error) in
//      if let error = error {
//        print("Error \(error.localizedDescription)")
//      }
//    }
  }
  
  
  
//  func getMinutesFromPicker(){
//
//    let date = prefferedWakePicker.date
//    let date2 = wakePicker.date
//
//    let sec = Int64(date.timeIntervalSince1970)
//    let sec2 = Int64(date.timeIntervalSince1970)
//
//    let secDifferent = (sec2 - sec) / 21
//    let result = sec2 - secDifferent
//
//
//
//
//
//    let newDate = Date(timeIntervalSince1970: TimeInterval(result))
//
//
//
//  }
  
  @IBAction func startButtonPressed(_ sender: UIButton) {
    print("button pressed")
    appDelegate?.scheduleNotification(notificationType: "A")
    

  }
  
}


  



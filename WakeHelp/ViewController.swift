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
  
//  var prefferedWakeTime = 0.0
//  var wakeTime = 0.0
//  var alarmTime = 0.0
  let notificationCenter = UNUserNotificationCenter.current()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    
    let options: UNAuthorizationOptions = [.alert, .sound, .badge]
    
    notificationCenter.requestAuthorization(options: options) {
      (didAllow, error) in
      if !didAllow {
        print("User has declined notifications")
      }
    }
    
    let localeID = Locale.preferredLanguages.first
    prefferedWakePicker.locale = Locale(identifier: localeID!)
    
    
  }
  
  func getMinutesFromPicker(){
    
    let date = prefferedWakePicker.date
    let date2 = wakePicker.date
    
    let sec = Int64(date.timeIntervalSince1970)
    let sec2 = Int64(date.timeIntervalSince1970)
    
    let secDifferent = (sec2 - sec) / 21
    let result = sec2 - secDifferent
    
    
    
  
    
    let newDate = Date(timeIntervalSince1970: TimeInterval(result))
    
    scheduleNotification(notificationType: "", date: newDate)

//
//    let hour = calendar.component(.hour, from: prefferedWakePicker.date)
//    print(hour)
//    let minute = calendar.component(.minute, from: prefferedWakePicker.date)
//    print(minute)
//
//    let hourTwo = calendar.component(.hour, from: wakePicker.date)
//    print(hourTwo)
//    let minuteTwo = calendar.component(.minute, from: wakePicker.date)
//    print(minuteTwo)
    
//    prefferedWakeTime = Double(hour * 60) + Double(minute)
//    wakeTime = Double(hourTwo * 60) + Double(minuteTwo)
//    print(prefferedWakeTime)
//    print(wakeTime)
    
  }
  
  @IBAction func startButtonPressed(_ sender: UIButton) {
    
    
    
//    getMinutesFromPicker()
//    countTime()
  }
  
//  func countTime (){
//    let minutePerDay = (wakeTime - prefferedWakeTime) / 21
//    print(minutePerDay)
//    alarmTime = wakeTime + minutePerDay
//    print(alarmTime)
//
//    let alarm = Double(alarmTime / 60)
//    print(String(format: "%.3f", alarm))
//  }
  
  func scheduleNotification(notificationType: String, date: Date) {
    
    let triggerTime = Calendar.current.dateComponents([.hour, .minute], from: date)
    print("\(triggerTime.hour) \(triggerTime.minute)")
    
    
    let content = UNMutableNotificationContent() // Содержимое уведомления
    
    content.title = notificationType
    content.body = "This is example how to create " + "\(notificationType) Notifications"
    content.sound = UNNotificationSound.default
    content.badge = 1
  
    let trigger = UNCalendarNotificationTrigger(dateMatching: triggerTime, repeats: true)
    
    
    let identifier = "Local Notification"
    let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)

    notificationCenter.add(request) { (error) in
      if let error = error {
        print("Error \(error.localizedDescription)")
      }
    }
  }
}


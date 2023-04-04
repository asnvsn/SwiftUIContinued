//
//  LocalNotificationsBootcamp.swift
//  SwiftUIContinued
//
//  Created by Санжар Асанов on 14/4/23.
//

import SwiftUI
import UserNotifications
import CoreLocation

class NotificationManager {
    
    static let instance = NotificationManager() // Singleton
    
    func requestAutarization() {
        
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("Error: \(error)")
            } else {
                print("Success")
            }
        }
    }
    func scheduleNotification() {
        
        let content = UNMutableNotificationContent()
        content.title = "This is my first notifications!"
        content.subtitle = "This is soooooo easy!"
        content.sound = .default
        content.badge = 1
        
       // time
       // let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
         
        // calendar
//        var dateComponents = DateComponents()
//        dateComponents.hour = 10
//        dateComponents.minute = 48
//        dateComponents.weekday = 2
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // location
        let coordinates = CLLocationCoordinate2D(latitude: 40.00, longitude: 50.00)
        let region = CLCircularRegion(center: coordinates, radius: 100, identifier: UUID().uuidString)
        region.notifyOnEntry = true
        region.notifyOnExit = true
        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
        let request =  UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    func cancelNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}

struct LocalNotificationsBootcamp: View {
    var body: some View {
        VStack(spacing: 40) {
            Button("Request permisson") {
                NotificationManager.instance.requestAutarization()
            }
            Button("Schedule notifications") {
                NotificationManager.instance.scheduleNotification()
            }
            Button("Cancel Notifications", action: {
                NotificationManager.instance.cancelNotifications()
            })
            .onAppear {
                UIApplication.shared.applicationIconBadgeNumber = 0
            }
            
        }
    }
}
struct LocalNotificationsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        LocalNotificationsBootcamp()
    }
}

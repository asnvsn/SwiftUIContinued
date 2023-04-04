//
//  TimerBootcamp.swift
//  SwiftUIContinued
//
//  Created by Санжар Асанов on 27/4/23.
//

import SwiftUI

struct TimerBootcamp: View {
    
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    
    // Current time
    /*
    @State var currentDate: Date = Date()
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
    //    formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    } */
    
    // Countdown
    /*
    @State var count: Int = 5
    @State var finishedText: String? = nil
    */
    
    // Countdown to date
    /*
    @State var timeRemaining: String = ""
    let futureDate: Date = Calendar.current.date(byAdding: .init(hour: 1), to: Date()) ?? Date()
    
    func updateTimeRemaining() {
        let remaining = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: futureDate)
        let hour = remaining.hour ?? 0
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        timeRemaining = "\(minute) minutes, \(second) seconds"
    } */
    
    // Animation counter
    @State var count: Int = 1
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.red, Color.blue]), center: .center, startRadius: 5, endRadius: 500).ignoresSafeArea()
            
            TabView(selection: $count, content: {
                Rectangle()
                    .foregroundColor(.red)
                    .tag(1)
                Rectangle()
                    .foregroundColor(.yellow)
                    .tag(2)
                Rectangle()
                    .foregroundColor(.pink)
                    .tag(3)
                Rectangle()
                    .foregroundColor(.purple)
                    .tag(4)
                Rectangle()
                    .foregroundColor(.blue)
                    .tag(5)
            })
            .frame(height: 200)
            .tabViewStyle(PageTabViewStyle())
        
        }
        .onReceive(timer) { _ in
            withAnimation(.default) {
                count = count == 5 ? 0 : count + 1
            }
        }
    }
}

struct TimerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TimerBootcamp()
    }
}

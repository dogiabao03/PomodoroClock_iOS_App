//
//  ContentView.swift
//  Pomodoro Clock
//
//  Created by baodo on 26/12/2023.
//

import SwiftUI

struct PomodoroClockView1: View {
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    @State private var timeRemaining = 25 * 60
    @State private var is25MinutesCompleted = false
    @State private var is50MinutesCompleted = false
    @State private var isTimerRunning = true
    @State private var roundFinished = 0
    @State private var mode = 25
    
    var body: some View {
        ZStack{
            BackgroundColor()
            VStack {
                Text("POMODORO TIMER").font(.largeTitle).foregroundColor(Color("pink2")).bold().padding(.top, 50)
                
                HStack {
                    Text("TIMER: ").foregroundColor(Color("pink2")).bold().font(.title2)
                    ButtonView(buttonText: "⏰ 25/5"){
                        mode = 25
                        timeRemaining = 25 * 60
                        isTimerRunning = true
                        roundFinished = 0
                        is25MinutesCompleted = false
                    }
                    ButtonView(buttonText: "⏰ 50/10"){
                        mode = 50
                        timeRemaining = 50 * 60
                        isTimerRunning = true
                        roundFinished = 0
                        is50MinutesCompleted = false
                    }
                }.padding(.top, 5)
                
                HStack {
                    Text("ROUND FINISHED:").foregroundColor(.white).bold().font(.title2)
                    Text("\(roundFinished)").foregroundColor(.white).bold().font(.title2)
                }.padding(.top, 65)
                
                // Mode 25/5
                if mode == 25{
                    Text("\(timeRemaining / 60):\(timeRemaining % 60, specifier: "%02d")").font(.system(size: 100)).foregroundColor(Color.white).frame(width: 350, height: 200).background(Color("pink2")).cornerRadius(30).onReceive(timer) { _ in
                        if isTimerRunning {
                            if timeRemaining > 0 {
                                timeRemaining -= 1
                            }
                            else {
                                if !is25MinutesCompleted { // == false
                                    // 25 minutes completed, reset timer for 5 minutes
                                    timeRemaining = 5 * 60
                                    is25MinutesCompleted = true
                                } else {
                                    // 5 minutes completed, reset timer for 25 minutes
                                    roundFinished += 1
                                    timeRemaining = 25 * 60
                                    is25MinutesCompleted = false
                                }
                            }
                        }
                    }
                    
                    HStack (spacing: 10) {
                        ButtonView(buttonText: isTimerRunning ? "Pause" : "Resume"){
                            isTimerRunning.toggle()
                        }
                        ButtonView(buttonText: "Restart"){
                            timeRemaining = 25 * 60
                            is25MinutesCompleted = false
                            isTimerRunning = true
                            roundFinished = 0
                        }
                    }.padding(.top, 50)
                }
                
                // 50/10 Mode
                if mode == 50 {
                    Text("\(timeRemaining / 60):\(timeRemaining % 60, specifier: "%02d")").font(.system(size: 100)).foregroundColor(Color.white).frame(width: 350, height: 200).background(Color("pink2")).cornerRadius(30).onReceive(timer) { _ in
                        if isTimerRunning {
                            if timeRemaining > 0 {
                                timeRemaining -= 1
                            }
                            else {
                                if !is50MinutesCompleted { // == false
                                    // 50 minutes completed, reset timer for 10 minutes
                                    timeRemaining = 10 * 60
                                    is50MinutesCompleted = true
                                } else {
                                    // 10 minutes completed, reset timer for 50 minutes
                                    roundFinished += 1
                                    timeRemaining = 50 * 60
                                    is50MinutesCompleted = false
                                }
                            }
                        }
                    }
                    
                    HStack (spacing: 10) {
                        ButtonView(buttonText: isTimerRunning ? "Pause" : "Resume"){
                            isTimerRunning.toggle()
                        }
                        ButtonView(buttonText: "Restart"){
                            timeRemaining = 50 * 60
                            is50MinutesCompleted = false
                            isTimerRunning = true
                            roundFinished = 0
                        }
                    }.padding(.top, 50)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PomodoroClockView1()
    }
}

struct BackgroundColor : View {
    var body: some View {
        LinearGradient(colors: [Color("myPink")], startPoint: .topLeading, endPoint: .bottomLeading).edgesIgnoringSafeArea(.all)
    }
}



//
//  ContentView.swift
//  Binary Clock
//
//  Created by Kai Azim on 2021-10-08.
//
// Main view with the circles

import SwiftUI

struct ContentView: View {
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timeStr = "00:00:00"
    
    @State var offColor = Color(.systemGray5)
    @State var onColor = Color(.systemRed)
    
    var body: some View {
        ZStack {
            Rectangle() // Background
                .ignoresSafeArea()
                .foregroundColor(Color(.systemGray6))
            VStack {
                Spacer()
                HStack(alignment: .bottom) {    // CLOCK
                    Group {     // HOURS
                        VStack {            // HOURS 2
                            Circle()
                                .circleMod(state: Row2(timeVal: timeStr[0]), on: onColor, off: offColor)
                            Circle()
                                .circleMod(state: Row1(timeVal: timeStr[0]), on: onColor, off: offColor)
                        }
                        VStack {            // HOURS 1
                            Circle()
                                .circleMod(state: Row8(timeVal: timeStr[1]), on: onColor, off: offColor)
                            Circle()
                                .circleMod(state: Row4(timeVal: timeStr[1]), on: onColor, off: offColor)
                            Circle()
                                .circleMod(state: Row2(timeVal: timeStr[1]), on: onColor, off: offColor)
                            Circle()
                                .circleMod(state: Row1(timeVal: timeStr[1]), on: onColor, off: offColor)
                        }
                    }
                    Group {     // MINUTES
                        VStack {            // MINUTES 2
                            Circle()
                                .circleMod(state: Row4(timeVal: timeStr[3]), on: onColor, off: offColor)
                            Circle()
                                .circleMod(state: Row2(timeVal: timeStr[3]), on: onColor, off: offColor)
                            Circle()
                                .circleMod(state: Row1(timeVal: timeStr[3]), on: onColor, off: offColor)
                        }
                        VStack {            // MINUTES 1
                            Circle()
                                .circleMod(state: Row8(timeVal: timeStr[4]), on: onColor, off: offColor)
                            Circle()
                                .circleMod(state: Row4(timeVal: timeStr[4]), on: onColor, off: offColor)
                            Circle()
                                .circleMod(state: Row2(timeVal: timeStr[4]), on: onColor, off: offColor)
                            Circle()
                                .circleMod(state: Row1(timeVal: timeStr[4]), on: onColor, off: offColor)
                        }
                    }
                    Group {     // SECONDS
                        VStack {            // SECONDS 2
                            Circle()
                                .circleMod(state: Row4(timeVal: timeStr[6]), on: onColor, off: offColor)
                            Circle()
                                .circleMod(state: Row2(timeVal: timeStr[6]), on: onColor, off: offColor)
                            Circle()
                                .circleMod(state: Row1(timeVal: timeStr[6]), on: onColor, off: offColor)
                        }
                        VStack {            // SECONDS 1
                            Circle()
                                .circleMod(state: Row8(timeVal: timeStr[7]), on: onColor, off: offColor)
                            Circle()
                                .circleMod(state: Row4(timeVal: timeStr[7]), on: onColor, off: offColor)
                            Circle()
                                .circleMod(state: Row2(timeVal: timeStr[7]), on: onColor, off: offColor)
                            Circle()
                                .circleMod(state: Row1(timeVal: timeStr[7]), on: onColor, off: offColor)
                        }
                    }
                }
                Spacer()
            }
        }
        .onReceive(timer) { time in
            let time = Date()
            let timeFormatter = DateFormatter()
            timeFormatter.dateFormat = "hh:mm:ss"
            let stringDate = timeFormatter.string(from: time)
            timeStr = stringDate
            print(timeStr)
        }
    }
}

// Custom-made modifier so that if there needs to be a change with
// how the circles change color (or something else), it only needs
// to be changed once
extension View {
    func circleMod(state isOn:Bool, on:Color, off:Color) -> some View {
        self
            .foregroundColor(isOn ? on : off)
            .shadow(radius: isOn ? 25 : 0)
            .animation(.easeOut)
            .frame(width: 30, height: 30)
            .padding()
    }
}

//
//  ContentView.swift
//  Binary Clock
//
//  Created by Kai Azim on 2021-10-08.
//
// Main view with the circles

import SwiftUI

struct ContentView: View {
    
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    @State var timeStr = "00:00:00"
    var body: some View {
        ZStack {
            Rectangle() // Background
                .ignoresSafeArea()
                .foregroundColor(Color("BGColor"))
            
            VStack {
                Spacer()
                HStack(alignment: .bottom) {    // CLOCK
                    Group {     // HOURS
                        VStack {            // HOURS 2
                            Circle()
                                .circleMod(state: Row2(timeVal: timeStr[0]))
                            Circle()
                                .circleMod(state: Row1(timeVal: timeStr[0]))
                        }
                        VStack {            // HOURS 1
                            Circle()
                                .circleMod(state: Row8(timeVal: timeStr[1]))
                            Circle()
                                .circleMod(state: Row4(timeVal: timeStr[1]))
                            Circle()
                                .circleMod(state: Row2(timeVal: timeStr[1]))
                            Circle()
                                .circleMod(state: Row1(timeVal: timeStr[1]))
                        }
                    }
                    Group {     // MINUTES
                        VStack {            // MINUTES 2
                            Circle()
                                .circleMod(state: Row4(timeVal: timeStr[3]))
                            Circle()
                                .circleMod(state: Row2(timeVal: timeStr[3]))
                            Circle()
                                .circleMod(state: Row1(timeVal: timeStr[3]))
                        }
                        VStack {            // MINUTES 1
                            Circle()
                                .circleMod(state: Row8(timeVal: timeStr[4]))
                            Circle()
                                .circleMod(state: Row4(timeVal: timeStr[4]))
                            Circle()
                                .circleMod(state: Row2(timeVal: timeStr[4]))
                            Circle()
                                .circleMod(state: Row1(timeVal: timeStr[4]))
                        }
                    }
                    Group {     // SECONDS
                        VStack {            // SECONDS 2
                            Circle()
                                .circleMod(state: Row4(timeVal: timeStr[6]))
                            Circle()
                                .circleMod(state: Row2(timeVal: timeStr[6]))
                            Circle()
                                .circleMod(state: Row1(timeVal: timeStr[6]))
                        }
                        VStack {            // SECONDS 1
                            Circle()
                                .circleMod(state: Row8(timeVal: timeStr[7]))
                            Circle()
                                .circleMod(state: Row4(timeVal: timeStr[7]))
                            Circle()
                                .circleMod(state: Row2(timeVal: timeStr[7]))
                            Circle()
                                .circleMod(state: Row1(timeVal: timeStr[7]))
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

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
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(Color("BGColor"))
            HStack {    // CLOCK
                Group {     // HOURS
                    VStack {            // HOURS 2
                        Spacer()
                        Circle()
                            .circleMod(state: Row2(timeVal: timeStr[0]))
                        Circle()
                            .circleMod(state: Row1(timeVal: timeStr[0]))
                        Spacer()
                            .frame(height: 30)
                    }
                    VStack {            // HOURS 1
                        Spacer()
                        Circle()
                            .circleMod(state: Row8(timeVal: timeStr[1]))
                        Circle()
                            .circleMod(state: Row4(timeVal: timeStr[1]))
                        Circle()
                            .circleMod(state: Row2(timeVal: timeStr[1]))
                        Circle()
                            .circleMod(state: Row1(timeVal: timeStr[1]))
                        Spacer()
                            .frame(height: 30)
                    }
                }
                Group {     // MINUTES
                    VStack {            // MINUTES 2
                        Spacer()
                        Circle()
                            .circleMod(state: Row4(timeVal: timeStr[3]))
                        Circle()
                            .circleMod(state: Row2(timeVal: timeStr[3]))
                        Circle()
                            .circleMod(state: Row1(timeVal: timeStr[3]))
                        Spacer()
                            .frame(height: 30)
                    }
                    VStack {            // MINUTES 1
                        Spacer()
                        Circle()
                            .circleMod(state: Row8(timeVal: timeStr[4]))
                        Circle()
                            .circleMod(state: Row4(timeVal: timeStr[4]))
                        Circle()
                            .circleMod(state: Row2(timeVal: timeStr[4]))
                        Circle()
                            .circleMod(state: Row1(timeVal: timeStr[4]))
                        Spacer()
                            .frame(height: 30)
                    }
                }
                Group {     // SECONDS
                    VStack {            // SECONDS 2
                        Spacer()
                        Circle()
                            .circleMod(state: Row4(timeVal: timeStr[6]))
                        Circle()
                            .circleMod(state: Row2(timeVal: timeStr[6]))
                        Circle()
                            .circleMod(state: Row1(timeVal: timeStr[6]))
                        Spacer()
                            .frame(height: 30)
                    }
                    VStack {            // SECONDS 1
                        Spacer()
                        Circle()
                            .circleMod(state: Row8(timeVal: timeStr[7]))
                        Circle()
                            .circleMod(state: Row4(timeVal: timeStr[7]))
                        Circle()
                            .circleMod(state: Row2(timeVal: timeStr[7]))
                        Circle()
                            .circleMod(state: Row1(timeVal: timeStr[7]))
                        Spacer()
                            .frame(height: 30)
                    }
                }
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

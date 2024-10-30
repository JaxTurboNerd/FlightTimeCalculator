//
//  ContentView.swift
//  FlightTimeCalculator
//
//  Created by Gregory Boyd on 10/20/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var timeInput = ""
    @FocusState var isFocused: Bool
    //This passes the state of the observed object:
    @StateObject var flightTime = FlightTimesViewModel()
    
    var body: some View {
        //Z stack with background styling:
        ZStack {
            BackgroundView()
            VStack(spacing: 40){
                TimeInputView(timeInput: $timeInput, isFocused: $isFocused)
                FlightTimeView(flightTimes: flightTime)
                ButtonView(timeInput: $timeInput, isFocused: $isFocused, flightTimes: flightTime)
            }.padding()
        }
    }
}

struct BackgroundView: View {
//    var topColor: Color
//    var bottomColor: Color
    
    var body: some View {
        Color("lightGrey")
            .ignoresSafeArea(.all)
            .opacity(0.9)
//        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .ignoresSafeArea(.all)
//        .opacity(0.9)
    }
}

#Preview {
    ContentView(timeInput: "5.5")
}

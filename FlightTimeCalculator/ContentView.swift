//
//  ContentView.swift
//  FlightTimeCalculator
//
//  Created by Gregory Boyd on 10/20/24.
//

import SwiftUI

struct ContentView: View {
    //@Environment(\.colorScheme) var colorScheme
    //@State var timeInput = ""
    
    @FocusState var isFocused: Bool
    //This passes the state of the observed object:
    @StateObject var flightTime = FlightTimesViewModel()
    @StateObject var timeInput = NumbersOnly()
    
    var body: some View {
        //Z stack with background styling:
        ZStack {
            BackgroundView()
            VStack(spacing: 40){
                //TimeInputView(timeInput: $timeInput, isFocused: $isFocused)
                //TimeInputView(timeInput: $timeInput)
                TimeInputView(inputTime: timeInput)
                FlightTimeView(flightTimes: flightTime)
                ButtonView(inputTime: timeInput, isFocused: $isFocused, flightTimes: flightTime)
            }.padding()
        }
        .onTapGesture {
            self.dismissKeyboard()
        }
    }
}

struct BackgroundView: View {
    
    var body: some View {
        Color("lightGrey")
            .ignoresSafeArea(.all)
            .opacity(0.9)
    }
}

#Preview {
    ContentView()
}

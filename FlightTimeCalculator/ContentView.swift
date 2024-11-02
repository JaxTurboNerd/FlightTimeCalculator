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
    @StateObject var timeInput = ValidTime()
    @FocusState var isFocused: Bool
    //This passes the state of the observed object:
    @StateObject var flightTime = FlightTimesViewModel()
    
    var body: some View {
        //Z stack with background styling:
        ZStack {
            BackgroundView()//applies background styling
            VStack(spacing: 40){
                TimeInputView(timeInput: timeInput)
//                FlightTimeView(flightTimes: flightTime)
//                ButtonView(timeInput: $timeInput, isFocused: $isFocused, flightTimes: flightTime)
            }.padding()
        }
        .onTapGesture {
            self.dismissKeyboard()
        }
    }
}

struct BackgroundView: View {
    
    var body: some View {
        Color("lightGrey")//custom color with dark mode support
            .ignoresSafeArea(.all)
    }
}

#Preview {
    ContentView()
}

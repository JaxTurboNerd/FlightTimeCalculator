//
//  ContentView.swift
//  FlightTimeCalculator
//
//  Created by Gregory Boyd on 10/20/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var timeInput = "0.0"
    @State var isPressed = false
    @FocusState var isFocused: Bool
    
    var body: some View {
        //Z stack with background styling:
        ZStack {
            BackgroundView(topColor: colorScheme == .dark ? Color("darkTop") : Color("lightBlue"), bottomColor: colorScheme == .dark ? .black: .blue )
            VStack{
                TimeInputView(timeInput: $timeInput, isFocused: $isFocused)
                //DisplayTimesView()
                FlightTimeView()
                ButtonView(isPressed: $isPressed, isFocused: $isFocused)
            }.padding()
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)
    }
}


#Preview {
    ContentView(timeInput: "5.5", isPressed: false)
}

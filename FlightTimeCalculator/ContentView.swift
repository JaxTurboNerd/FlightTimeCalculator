//
//  ContentView.swift
//  FlightTimeCalculator
//
//  Created by Gregory Boyd on 10/20/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var flightInput = ""
    @FocusState private var focus: Bool
    
    var body: some View {
        VStack{
            TimeInputView(isFocused:$focus)
            DisplayTimesView()
            .padding()
            ButtonView(isFocused: $focus)
        }.padding()
    }
}

#Preview {
    ContentView()
}

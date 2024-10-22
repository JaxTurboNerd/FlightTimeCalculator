//
//  TimeInputView.swift
//  FlightTimeCalculator
//
//  Created by Gregory Boyd on 10/21/24.
//

import SwiftUI

struct TimeInputView: View {
    @State private var flightInput = ""
    @FocusState.Binding var isFocused: Bool
    
    var body: some View {
            HStack{
                Text("Flight Time: ")
                    .font(.title) //may need to adjust to slightly smaller font
                TextField("0.0", value: $flightInput, formatter: NumberFormatter())
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 60, height: 25)
                    .focused($isFocused)
                    .keyboardType(.decimalPad)
            }
        }
}

//#Preview {
//    var isFocused = false
//    TimeInputView(isFocused: isFocused)
//}

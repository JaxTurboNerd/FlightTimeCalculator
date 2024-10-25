//
//  TimeInputView.swift
//  FlightTimeCalculator
//
//  Created by Gregory Boyd on 10/24/24.
//

import SwiftUI

struct TimeInputView: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var timeInput: String
    @FocusState.Binding var isFocused: Bool
    
    var body: some View {
        HStack{
            Text("Flight Time: ")
                .font(.title) //may need to adjust to slightly smaller font
            TextField("  0.0", value: $timeInput, formatter: NumberFormatter())
                .textFieldStyle(.roundedBorder)
                .frame(width: 60, height: 25)
//              .background(colorScheme == .dark ? Color(.green) : Color.white)
                .focused($isFocused)
                .keyboardType(.decimalPad)
        }
    }}

#Preview {
    TimeInputView(timeInput: .constant("0.0"), isFocused: FocusState<Bool>().projectedValue)
}

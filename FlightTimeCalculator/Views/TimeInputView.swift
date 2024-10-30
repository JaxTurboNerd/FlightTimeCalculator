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
    private let characterLimit = 4
    
    var body: some View {
        HStack{
            Text("Flight Time: ")
                .foregroundStyle(Color("textColor"))
                .font(.title) //may need to adjust to slightly smaller font
            //            TextField("  0.0", value: $timeInput, formatter: NumberFormatter())
            //                .textFieldStyle(.roundedBorder)
            //                .frame(width: 60, height: 25)
            //                .focused($isFocused)
            //                .keyboardType(.decimalPad)
            //                .onChange(of: timeInput){newValue in  //not working on the sim
            //                    print("onChange modifier in action")
            //                   if newValue.count > characterLimit {
            //                        timeInput = String(newValue.prefix(characterLimit))
            //                    }
            //                }
            TextField(" 0.0", text: $timeInput)
                .textFieldStyle(.roundedBorder)
                .frame(width: 60, height: 25)
                .focused($isFocused)
                .foregroundStyle(Color("textColor"))
                .keyboardType(.decimalPad)
                .onChange(of: timeInput){newValue in
                    if newValue.count > characterLimit {
                        timeInput = String(newValue.prefix(characterLimit))
                    }
                }
        }
    }
}

#Preview {
    TimeInputView(timeInput: .constant("0.0"), isFocused: FocusState<Bool>().projectedValue)
}

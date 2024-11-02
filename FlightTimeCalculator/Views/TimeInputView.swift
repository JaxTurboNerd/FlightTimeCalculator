//
//  TimeInputView.swift
//  FlightTimeCalculator
//
//  Created by Gregory Boyd on 10/24/24.
//

import SwiftUI

struct TimeInputView: View {
    @Binding var timeInput: String
    private let characterLimit = 4
    
    var body: some View {
        HStack{
            Text("Flight Time: ")
                .foregroundStyle(Color("textColor"))
                .font(.title) //may need to adjust to slightly smaller font
            TextField(" 0.0", text: $timeInput)
                .textFieldStyle(.roundedBorder)
                .frame(width: 60, height: 25)
                .foregroundStyle(Color("textColor"))
                .keyboardType(.decimalPad)
                .onChange(of: timeInput){newValue in
                    let filtered = timeInput.filter {".0123456789".contains($0)}
                    if newValue != filtered {
                        timeInput = filtered
                    }
                    if newValue.count > characterLimit {
                        timeInput = String(newValue.prefix(characterLimit))
                    }
//                    if Double(newValue) ?? 0.0 > 20.0{
//                        timeInput = "20.0"
//                    }
                }
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard, content: {
                        Button(action: {timeInput = ""}, label: {Text("Clear")}
                        )
                        Spacer()
                        Button(action: {self.dismissKeyboard()},
                               label: {Text("Done")}
                        )
                    })
                }
            Image(systemName: "airplane").font(.title2)
        }
    }
    
}

#Preview {
    TimeInputView(timeInput: .constant("0.0"))
//    TimeInputView(timeInput: .constant("0.0"), isFocused: FocusState<Bool>().projectedValue)
}

//
//  TimeInputView.swift
//  FlightTimeCalculator
//
//  Created by Gregory Boyd on 10/24/24.
//

import SwiftUI

struct TimeInputView: View {
    //@Binding var timeInput: String
    @ObservedObject var inputTime: NumbersOnly
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
            TextField(" 0.0", text: $inputTime.inputValue)
                .textFieldStyle(.roundedBorder)
                .frame(width: 60, height: 25)
                .foregroundStyle(Color("textColor"))
                .keyboardType(.decimalPad)
                .onChange(of: inputTime.inputValue){newValue in
                    let filtered = inputTime.inputValue.filter {".0123456789".contains($0)}
                    if newValue.count > characterLimit {
                        inputTime.inputValue = String(newValue.prefix(characterLimit))
                    }
                    
                    if newValue != filtered {
                        inputTime.inputValue = filtered
                    }
//                    if Double(newValue) ?? 0.0 > 20.0{
//                        inputTime = "20.0"
//                    }
                }
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard, content: {
                        Button(action: {inputTime.inputValue = ""}, label: {Text("Clear")}
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
    TimeInputView(inputTime: NumbersOnly())
//    TimeInputView(timeInput: .constant("0.0"), isFocused: FocusState<Bool>().projectedValue)
}

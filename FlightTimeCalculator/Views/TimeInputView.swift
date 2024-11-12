//
//  TimeInputView.swift
//  FlightTimeCalculator
//
//  Created by Gregory Boyd on 10/24/24.
//

import SwiftUI

struct TimeInputView: View {
    @Binding var timeInput: String
    @State private var showAlert = false
    @State private var alertText = ""
    @FocusState.Binding var isFocused: Bool
    
    var body: some View {
        HStack{
            Text("Flight Time: ")
                .foregroundStyle(Color("textColor"))
                .font(.title) //may need to adjust to slightly smaller font
            TextField(" 0.0", text: $timeInput)
                .textFieldStyle(.roundedBorder)
                .frame(width: 70, height: 25)
                .foregroundStyle(Color("textColor"))
                .keyboardType(.decimalPad)
                .focused($isFocused)
                .onChange(of: timeInput){newValue in
                    //Pretty sure the regex in the function does not work
                    //as intended.  Most of the validation is from the if
                    //statements below
                    if !isValidNumber(newValue) {
                        // Prefix sets the total allowed characters
                        timeInput = String(newValue.prefix(4).filter { $0.isNumber || $0 == "." })
                    }
                    //Allow only one decimal character:
                    if newValue.components(separatedBy: ".").count > 2 {
                        timeInput = String(newValue.dropLast())
                    }
                    //Allow only 1 digit after the decimal:
                    if newValue.components(separatedBy: ".").count >= 2 {
                        //use the second index of the components array  to check the decimals:
                        let decimals = newValue.components(separatedBy: ".")[1]
                        if decimals.count >= 2 {
                            timeInput = String(newValue.dropLast())
                        }
                    }
                    
//                    if !timeIsValid {
//                        timeInput = "0.0"
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
                .alert(alertText, isPresented: $showAlert){Button("OK", role: .cancel){}
                }
            Image(systemName: "airplane").font(.title2)
        }
    }
    func isValidNumber(_ input: String) -> Bool {
            let regex = #"^\d{0,2}(\.[0-9]{0,1})?$"#
            return input.range(of: regex, options: .regularExpression) != nil
        }
    
}

#Preview {
    TimeInputView(timeInput: .constant("0.0"), isFocused: FocusState<Bool>().projectedValue)
}

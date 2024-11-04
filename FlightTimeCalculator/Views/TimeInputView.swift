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
    private let characterLimit = 4
    @State private var alertText = ""
    
    private var timeIsValid: Bool {
        //checks for valid double:
        let time = Double(timeInput) ?? 0.0
        guard time < 99.9 else {
            alertText = "A flight time greater than 99.9 hours was entered! Please check your entry!"
            showAlert = true
            return false
        }
        guard time >= 0.0 else {
            alertText = "Please enter a value greater than 0.0"
            showAlert = true
            return false
        }
        return true
    }
    
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
                    //Allow only numbers and a decimal character
                    let filtered = timeInput.filter {".0123456789".contains($0)}
                    if newValue != filtered {
                        timeInput = filtered
                    }
                    //Allow only one decimal character:
                    if newValue.components(separatedBy: ".").count-1 > 1 {
                        timeInput = String(newValue.dropLast())
                    }
                    //Allow a maximum of 4 characters:
                    if newValue.count > characterLimit {
                        timeInput = String(newValue.prefix(characterLimit))
                    }
                    if !timeIsValid {
                        timeInput = "0.0"
                    }
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
    
}

#Preview {
    TimeInputView(timeInput: .constant("0.0"))
}

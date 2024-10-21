//
//  TimeInputView.swift
//  FlightTimeCalculator
//
//  Created by Gregory Boyd on 10/21/24.
//

import SwiftUI

struct TimeInputView: View {
    @State private var flightInput = ""
    @FocusState private var focus: Bool
    
    var body: some View {
            HStack{
                Text("Flight Time: ")
                    .font(.title) //may need to adjust to slightly smaller font
                TextField("0.0", value: $flightInput, formatter: NumberFormatter())
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 60, height: 25)
                    .focused($focus)
                    .onAppear{focus = true}
                    .keyboardType(.decimalPad)
                    .onSubmit {
                    print($flightInput)
                }

            }
        }
}

#Preview {
    TimeInputView()
}

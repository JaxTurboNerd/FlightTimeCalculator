//
//  ButtonView.swift
//  FlightTimeCalculator
//
//  Created by Gregory Boyd on 10/24/24.
//

import SwiftUI

struct ButtonView: View {
    @Binding var timeInput: String
    @FocusState.Binding var isFocused: Bool
    @ObservedObject var flightTimes: FlightTimesViewModel
    @Environment(\.colorScheme) var colorScheme
    @State private var showAlert = false
    
    var body: some View {
        HStack(spacing: 50){
            Button("Clear") {
                //Code to clear the text and result input:
                timeInput = ""
                flightTimes.calculateTimes(flightTime: "0.0")
            }
            .frame(width: 140, height: 45)
            .font(.title3)
            .background(Color("clearButtonColor"))
            .foregroundStyle(Color("buttonFont"))
            .cornerRadius(10)
            .shadow(color: colorScheme == .light ? .gray : .clear, radius: 2, x: 2, y: 2)
            Button("Calculate") {
                if timeInput == "" {
                    showAlert = true
                    return
                }
                //Function to calculate the times:
                flightTimes.calculateTimes(flightTime: timeInput)
                isFocused.toggle() //dismisses the keyboard
            }
            .frame(width: 140, height: 45) //button size
            .font(.title3)
            .background(Color("calcButtonColor"))
            .foregroundStyle(Color("buttonFont"))
            .cornerRadius(10)
            .shadow(color: colorScheme == .light ? .gray : .clear, radius: 2, x: 2, y: 2)
        }
        .alert("Please enter a flight time", isPresented: $showAlert){Button("OK", role: .cancel){}
        }
    }
}

#Preview {
    ButtonView(timeInput: .constant("5.5"), isFocused: FocusState<Bool>().projectedValue, flightTimes: FlightTimesViewModel())
}

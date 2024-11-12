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
    @State private var alertText = ""
    
    private var validTime: Bool{
        let time = Double(timeInput) ?? 0
        if timeInput == "" {
            alertText = "Please enter your flight time."
            showAlert = true
            isFocused = true
            return false
        }
        guard time < 100.0 else {
            alertText = "Please enter a time less than 99.9"
            showAlert = true
            timeInput = ""
            isFocused = true
            return false
        }
        return true
    }
    
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
                if !validTime {return}
                //Function to calculate the times:
                flightTimes.calculateTimes(flightTime: timeInput)
                //isFocused.toggle() //dismisses the keyboard
            }
            .frame(width: 140, height: 45) //button size
            .font(.title3)
            .background(Color("calcButtonColor"))
            .foregroundStyle(Color("buttonFont"))
            .cornerRadius(10)
            .shadow(color: colorScheme == .light ? .gray : .clear, radius: 2, x: 2, y: 2)
        }
        .alert(alertText, isPresented: $showAlert){Button("OK", role: .cancel){}
        }
    }
}

#Preview {
    ButtonView(timeInput: .constant("5.5"), isFocused: FocusState<Bool>().projectedValue, flightTimes: FlightTimesViewModel())
}

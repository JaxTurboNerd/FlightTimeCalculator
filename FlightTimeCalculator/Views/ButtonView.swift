//
//  ButtonView.swift
//  FlightTimeCalculator
//
//  Created by Gregory Boyd on 10/24/24.
//

import SwiftUI

struct ButtonView: View {
    //@Binding var timeInput: String
    @ObservedObject var inputTime: NumbersOnly
    @FocusState.Binding var isFocused: Bool
    @ObservedObject var flightTimes: FlightTimesViewModel
    @Environment(\.colorScheme) var colorScheme //used to remove shadows with dark mode

    
    var body: some View {
        HStack(spacing: 50){
            Button("Clear") {
                //Code to clear the text and result input:
                inputTime.inputValue = ""
                flightTimes.calculateTimes(flightTime: "0.0")
            }
            .frame(width: 140, height: 45)
            .font(.title3)
            .background(Color("clearButtonColor"))
            .foregroundStyle(Color("buttonFont"))
            .cornerRadius(10)
            .shadow(color: colorScheme == .light ? .gray : .clear, radius: 2, x: 2, y: 2)
//            .opacity(shouldClear ? 0.8: 1.0)
//            .animation(.easeInOut(duration: 1.0), value: shouldClear)
            
            Button("Calculate") {
                //Function to calculate the times:
                flightTimes.calculateTimes(flightTime: inputTime.inputValue)
                isFocused.toggle() //dismisses the keyboard
            }
            .frame(width: 140, height: 45) //button size
            .font(.title3)
            .background(Color("calcButtonColor"))
            .foregroundStyle(Color("buttonFont"))
            .cornerRadius(10)
            .shadow(color: colorScheme == .light ? .gray : .clear, radius: 2, x: 2, y: 2)
//            .opacity(isPressed ? 0.8: 1.0)
//            .animation(.easeInOut, value: isPressed)
        }
    }
}



#Preview {
    ButtonView(inputTime: NumbersOnly(), isFocused: FocusState<Bool>().projectedValue, flightTimes: FlightTimesViewModel())
}

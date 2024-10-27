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
    @StateObject var viewModel = FlightTimesViewModel()
    
    var body: some View {
        HStack(spacing: 50){
            Button("Clear") {
                //Code to clear the text input:
                timeInput = ""
            }
            .frame(width: 140, height: 45)
            .font(.title3)
            .background(.blue)
            .foregroundStyle(.white)
            .cornerRadius(10)
            .shadow(color: .gray, radius: 2, x: 2, y: 2)
//            .opacity(shouldClear ? 0.8: 1.0)
//            .animation(.easeInOut(duration: 1.0), value: shouldClear)
            
            Button("Calculate") {
                //self.isPressed.toggle()
                //Function to calculate the times:
                viewModel.calculateTimes(flightTime: timeInput)
                isFocused.toggle() //dismisses the keyboard
            }
            .frame(width: 140, height: 45) //button size
            .font(.title3)
            .background(.green)
            .foregroundStyle(.white)
            .cornerRadius(10)
            .shadow(color: .gray, radius: 2, x: 2, y: 2)
//            .opacity(isPressed ? 0.8: 1.0)
//            .animation(.easeInOut, value: isPressed)
        }
    }
}

#Preview {
    ButtonView(timeInput: .constant("5.5"), isFocused: FocusState<Bool>().projectedValue)
}

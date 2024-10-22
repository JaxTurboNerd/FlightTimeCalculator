//
//  ButtonView.swift
//  FlightTimeCalculator
//
//  Created by Gregory Boyd on 10/21/24.
//

import SwiftUI

struct ButtonView: View {
    @State private var isPressed = false
    @FocusState.Binding var isFocused:Bool
    
    var body: some View {
        HStack(spacing: 50){
            Button("Clear") {
                //Code to clear the text input:
            }
            .frame(width: 100, height: 40)
            .font(.title3)
            .background(.blue)
            .foregroundStyle(.white)
            .cornerRadius(10)
            .shadow(color: .gray, radius: 2, x: 2, y: 2)
            .opacity(isPressed ? 0.8: 1.0)
            .animation(.easeInOut, value: isPressed)
            
            Button("Calculate") {
                //Code to calculate the times:
                self.isPressed.toggle()
                isFocused.toggle() //dismissed the keyboard
            }
            .frame(width: 100, height: 40) //button size
            .font(.title3)
            .background(.green)
            .foregroundStyle(.white)
            .cornerRadius(10)
            .shadow(color: .gray, radius: 2, x: 2, y: 2)
            .opacity(isPressed ? 0.8: 1.0)
            .animation(.easeInOut, value: isPressed)
        }
    }
}

//#Preview {
//    ButtonView(isFocused: )
//}

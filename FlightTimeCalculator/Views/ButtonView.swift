//
//  ButtonView.swift
//  FlightTimeCalculator
//
//  Created by Gregory Boyd on 10/21/24.
//

import SwiftUI

struct ButtonView: View {
    @State private var isPressed = false
    
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
            
            Button("Calculate") {
                //Code to calculate the times:
                self.isPressed.toggle()
            }
            .frame(width: 100, height: 40) //button size
            .font(.title3)
            .background(.green)
            .foregroundStyle(.white)
            .cornerRadius(10)
            //.scaleEffect(isPressed ? 0.9 : 1.0)
            .opacity(isPressed ? 0.8: 1.0)
            .animation(.easeInOut, value: isPressed)
        }
    }
}

#Preview {
    ButtonView()
}

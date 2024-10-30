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
    
//    func calculateTimes(flightTime: String){
//        
//        //Need to cast flightTime: String to Double:
//        let doubleTime = Double(flightTime) ?? 0.0
//        
//        //convert flightTime to type Int
//        let intFlightTime = Int(doubleTime * 10)
//        
//        var intTime1 = intFlightTime/3
//        var intTime2 = intFlightTime/3
//        let intTime3 = intFlightTime/3
//        
//        var sumTime = intTime1 + intTime2 + intTime3
//        
//        //adjust each time by 1 if necessary
//        if sumTime < intFlightTime {
//            intTime1 += 1
//            sumTime = intTime1 + intTime2 + intTime3
//            
//            if sumTime < intFlightTime {
//                intTime2 += 1
//                sumTime = intTime1 + intTime2 + intTime3
//            }
//        }
//        
//        //Convert to String to drop trailing zeros
//        let time1 = String(Double(intTime1)/10)
//        let time2 = String(Double(intTime2)/10)
//        let time3 = String(Double(intTime3)/10)
//        
//        let pilotOne = Pilot(pic: time1, sic: time2, crew: time3)
//        let pilotTwo = Pilot(pic: time2, sic: time3, crew: time1)
//        let pilotThree = Pilot(pic: time3, sic: time1, crew: time2)
//        
//        viewModel.pilotTimes = [pilotOne, pilotTwo, pilotThree]
//    }

    
    var body: some View {
        HStack(spacing: 50){
            Button("Clear") {
                //Code to clear the text input:
                timeInput = ""
            }
            .frame(width: 140, height: 45)
            .font(.title3)
            //.background(.blue)
            .background(Color("clearButtonColor"))
            .foregroundStyle(Color("buttonFont"))
            .cornerRadius(10)
            .shadow(color: colorScheme == .light ? .gray : .clear, radius: 2, x: 2, y: 2)
//            .opacity(shouldClear ? 0.8: 1.0)
//            .animation(.easeInOut(duration: 1.0), value: shouldClear)
            
            Button("Calculate") {
                //self.isPressed.toggle()
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
//            .opacity(isPressed ? 0.8: 1.0)
//            .animation(.easeInOut, value: isPressed)
        }
    }
}


#Preview {
    ButtonView(timeInput: .constant("5.5"), isFocused: FocusState<Bool>().projectedValue, flightTimes: FlightTimesViewModel())
}

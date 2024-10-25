//
//  ContentView.swift
//  FlightTimeCalculator
//
//  Created by Gregory Boyd on 10/20/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var timeInput = "0.0"
    @State var isPressed = false
    @FocusState var isFocused: Bool
    
    var body: some View {
        //Z stack with background styling:
        ZStack {
            BackgroundView(topColor: colorScheme == .dark ? Color("darkTop") : Color("lightBlue"), bottomColor: colorScheme == .dark ? .black: .blue )
            VStack{
                TimeInputView(timeInput: $timeInput, isFocused: $isFocused)
                //DisplayTimesView()
                FlightTimeView()
                ButtonView(isPressed: $isPressed, isFocused: $isFocused)
            }.padding()
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)
    }
}

//struct TimeInputView: View {
//    @Environment(\.colorScheme) var colorScheme
//    @Binding var timeInput: String
//    @FocusState.Binding var isFocused: Bool
//    
//    var body: some View {
//        HStack{
//            Text("Flight Time: ")
//                .font(.title) //may need to adjust to slightly smaller font
//            TextField("  0.0", value: $timeInput, formatter: NumberFormatter())
//                .textFieldStyle(.roundedBorder)
//                .frame(width: 60, height: 25)
////              .background(colorScheme == .dark ? Color(.green) : Color.white)
//                .focused($isFocused)
//                .keyboardType(.decimalPad)
//        }
//    }
//}

//struct DisplayTimesView: View {
//    
//    let pilot1Times: [Double] = [1.1, 1.2, 1.3]
//    let pilot2Times: [Double] = [1.3, 1.2, 1.2]
//    let pilot3Times: [Double] = [1.2, 1.2, 1.1]
//    
//    var body: some View {
//        Grid{
//            GridRow{
//                Text("")
//                Text("PIC").font(.title2)
//                Text("SIC").font(.title2)
//                Text("Crew").font(.title2)
//            }
//            Divider()
//            GridRow{
//                Text("Pilot 1:").font(.title2)
//                ForEach(pilot1Times, id: \.self){time in Text("\(time, specifier: "%.1f")").font(.title3)
//                }
//            }
//            .padding(10)
//            GridRow{
//                Text("Pilot 2:").font(.title2)
//                ForEach(pilot2Times, id: \.self){time in Text("\(time, specifier: "%.1f")").font(.title3)
//                }            }
//            .padding(10)
//            GridRow{
//                Text("Pilot 3:").font(.title2)
//                ForEach(pilot3Times, id: \.self){time in Text("\(time, specifier: "%.1f")").font(.title3)
//                }
//            }
//            .padding(10)
//            Divider()
//        }
//        .padding()
//    }
//}

//struct ButtonView: View {
//    @Binding var isPressed: Bool
//    @FocusState.Binding var isFocused: Bool
//    
//    var body: some View {
//        HStack(spacing: 50){
//            Button("Clear") {
//                //Code to clear the text input:
//            }
//            .frame(width: 140, height: 45)
//            .font(.title3)
//            .background(.blue)
//            .foregroundStyle(.white)
//            .cornerRadius(10)
//            .shadow(color: .gray, radius: 2, x: 2, y: 2)
//            .opacity(isPressed ? 0.8: 1.0)
//            .animation(.easeInOut, value: isPressed)
//            
//            Button("Calculate") {
//                //Code to calculate the times:
//                self.isPressed.toggle()
//                isFocused.toggle() //dismissed the keyboard
//            }
//            .frame(width: 140, height: 45) //button size
//            .font(.title3)
//            .background(.green)
//            .foregroundStyle(.white)
//            .cornerRadius(10)
//            .shadow(color: .gray, radius: 2, x: 2, y: 2)
//            .opacity(isPressed ? 0.8: 1.0)
//            .animation(.easeInOut, value: isPressed)
//        }
//    }
//}

#Preview {
    ContentView(timeInput: "5.5", isPressed: false)
}

//
//  DisplayTimesView.swift
//  FlightTimeCalculator
//
//  Created by Gregory Boyd on 10/21/24.
//

import SwiftUI

struct DisplayTimesView: View {
    var body: some View {
        Grid{
            GridRow{
                Text("")
                Text("PIC")
                Text("SIC")
                Text("Crew")
            }
            Divider()
            GridRow{
                Text("Pilot 1:")
                ForEach(0..<3) { _ in Text("0.0") }
            }
            .padding(10)
            GridRow{
                Text("Pilot 2:")
                ForEach(0..<3) { _ in Text("0.0") }
            }
            .padding(10)
            GridRow{
                Text("Pilot 3:")
                ForEach(0..<3) { _ in Text("0.0") }
            }
            .padding(10)
        }
        .padding()
    }
}

#Preview {
    DisplayTimesView()
}

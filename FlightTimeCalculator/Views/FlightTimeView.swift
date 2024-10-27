//
//  FlightTimeView.swift
//  FlightTimeCalculator
//
//  Created by Gregory Boyd on 10/24/24.
//

import SwiftUI

struct FlightTimeView: View {
    //connects to the published viewModel variable:
    @StateObject var viewModel = FlightTimesViewModel()
    
    var body: some View {
        Grid{
            GridRow{
                Text("")
                Text("PIC").font(.title2)
                Text("SIC").font(.title2)
                Text("Crew").font(.title2)
            }
            Divider()
            GridRow{
                Text("Pilot 1:").font(.title2)
//                ForEach(pilot1Times, id: \.self){time in Text("\(time, specifier: "%.1f")").font(.title3)
//                }
                Text(MockData.samplePilot.pic).font(.title3)
                Text(MockData.samplePilot.sic).font(.title3)
                Text(MockData.samplePilot.crew).font(.title3)
            }
            .padding(10)
            GridRow{
                Text("Pilot 2:").font(.title2)
//                ForEach(pilot2Times, id: \.self){time in Text("\(time, specifier: "%.1f")").font(.title3)
//                }
                Text(MockData.samplePilot.sic).font(.title3)
                Text(MockData.samplePilot.crew).font(.title3)
                Text(MockData.samplePilot.pic).font(.title3)
            }
            .padding(10)
            GridRow{
                Text("Pilot 3:").font(.title2)
//                ForEach(pilot3Times, id: \.self){time in Text("\(time, specifier: "%.1f")").font(.title3)
//                }
                Text(MockData.samplePilot.crew).font(.title3)
                Text(MockData.samplePilot.pic).font(.title3)
                Text(MockData.samplePilot.sic).font(.title3)
            }
            .padding(10)
            Divider()
        }
        .padding()
    }
}

#Preview {
    FlightTimeView()
}

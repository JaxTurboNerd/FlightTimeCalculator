//
//  FlightTimeView.swift
//  FlightTimeCalculator
//
//  Created by Gregory Boyd on 10/24/24.
//

import SwiftUI

struct FlightTimeView: View {
    //connects to the published viewModel variable:
    @ObservedObject var flightTimes: FlightTimesViewModel
    
    var body: some View {
        Grid{
            GridRow{
                Text("")
                Text("PIC").font(.title2).foregroundStyle(Color("textColor"))
                Text("SIC").font(.title2).foregroundStyle(Color("textColor"))
                Text("Crew").font(.title2).foregroundStyle(Color("textColor"))
            }
            Divider()
            GridRow{
                Text("Pilot 1:")
                    .font(.title2)
                    .lineLimit(1)
                    .minimumScaleFactor(0.70)
                Text(flightTimes.pilotTimes[0].pic).font(.title3).foregroundStyle(Color("textColor"))               .lineLimit(1)
                   .minimumScaleFactor(0.70)
                Text(flightTimes.pilotTimes[0].sic).font(.title3).foregroundStyle(Color("textColor"))                 .lineLimit(1)
                    .minimumScaleFactor(0.70)
                Text(flightTimes.pilotTimes[0].crew).font(.title3).foregroundStyle(Color("textColor"))                .lineLimit(1)
                    .minimumScaleFactor(0.70)
            }
            .padding(10)
            GridRow{
                Text("Pilot 2:")
                    .font(.title2)
                    .lineLimit(1)
                    .minimumScaleFactor(0.70)
                Text(flightTimes.pilotTimes[1].pic).font(.title3)
                    .foregroundStyle(Color("textColor"))
                    .lineLimit(1)
                    .minimumScaleFactor(0.70)
                Text(flightTimes.pilotTimes[1].sic).font(.title3)
                    .foregroundStyle(Color("textColor"))
                    .lineLimit(1)
                    .minimumScaleFactor(0.70)
                Text(flightTimes.pilotTimes[1].crew).font(.title3)
                    .foregroundStyle(Color("textColor"))
                    .lineLimit(1)
                    .minimumScaleFactor(0.70)
            }
            .padding(10)
            GridRow{
                Text("Pilot 3:")
                    .font(.title2)
                    .lineLimit(1)
                    .minimumScaleFactor(0.70)
                Text(flightTimes.pilotTimes[2].pic).font(.title3)
                    .foregroundStyle(Color("textColor"))
                    .lineLimit(1)
                    .minimumScaleFactor(0.70)
                Text(flightTimes.pilotTimes[2].sic).font(.title3)
                    .foregroundStyle(Color("textColor"))
                    .lineLimit(1)
                    .minimumScaleFactor(0.70)
                Text(flightTimes.pilotTimes[2].crew).font(.title3)
                    .foregroundStyle(Color("textColor"))
                    .lineLimit(1)
                    .minimumScaleFactor(0.70)
            }
            .padding(10)
            Divider()
        }
        .padding()
    }
}

#Preview {
    FlightTimeView(flightTimes: FlightTimesViewModel())
}

//
//  FlightTimesViewModel.swift
//  FlightTimeCalculator
//
//  Created by Gregory Boyd on 10/24/24.
//
import Foundation
import SwiftUI

final class FlightTimesViewModel: ObservableObject {
    @Published var pilotTimes: Pilot?
    
    func calculateTimes(flightTime: Double) -> (time1: String, time2: String, time3: String) {
        
        //convert flightTime to type Int
        let intFlightTime = Int(flightTime * 10)
        
        var intTime1 = intFlightTime/3
        var intTime2 = intFlightTime/3
        let intTime3 = intFlightTime/3
        
        var sumTime = intTime1 + intTime2 + intTime3
        
        //adjust each time by 1 if necessary
        if sumTime < intFlightTime {
            intTime1 += 1
            sumTime = intTime1 + intTime2 + intTime3
            
            if sumTime < intFlightTime {
                intTime2 += 1
                sumTime = intTime1 + intTime2 + intTime3
            }
        }
        
        //Convert to String to drop trailing zeros
        let time1 = String(Double(intTime1)/10)
        let time2 = String(Double(intTime2)/10)
        let time3 = String(Double(intTime3)/10)
        
        return(time1, time2, time3)
    }

}

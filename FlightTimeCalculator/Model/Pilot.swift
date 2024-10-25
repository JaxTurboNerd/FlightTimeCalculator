//
//  Pilot.swift
//  FlightTimeCalculator
//
//  Created by Gregory Boyd on 10/24/24.
//

import Foundation

//Flight Time Model:
struct Pilot: Hashable, Identifiable {
    var id = UUID()//need for the forEach loop
    let pic: String
    let sic: String
    let crew: String
}

struct MockData {
    static let samplePilot = Pilot(pic: "1.1", sic: "1.2", crew: "1.3")
    static let pilots = [Pilot(pic: "1.1", sic: "1.2", crew: "1.3"), Pilot(pic: "1.2", sic: "1.3", crew: "1.1"), Pilot(pic: "1.3", sic: "1.1", crew: "1.2")]
}

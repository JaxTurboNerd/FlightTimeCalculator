//
//  ContentView.swift
//  FlightTimeCalculator
//
//  Created by Gregory Boyd on 10/20/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("3 Pilots")
                .tabItem {
                    Label("3 Pilots", image: ._3Person)
                }
            Text("4 Pilot")
                .tabItem {
                    //Image(._4Person)
                    Label("4 Pilots", image: ._4Person)
                }
        }
    }
}

#Preview {
    ContentView()
}

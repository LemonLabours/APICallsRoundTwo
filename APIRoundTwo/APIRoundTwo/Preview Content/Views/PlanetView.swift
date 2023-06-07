//
//  PlanetView.swift
//  APIRoundTwo
//
//  Created by Lama AL Yousef on 01/06/2023.
//
import SwiftUI
struct PlanetView: View {
    @StateObject private var viewModel = PlanetViewModel()
    
    var body: some View {
        VStack {
            if let planet = viewModel.planet {
                Text("Name: \(planet.name)")
                Text("Mass: \(planet.mass)")
                Text("Radius: \(planet.radius)")
                Text("Period: \(planet.period)")
                Text("Temperature: \(planet.temperature)")

            }
        }
        .padding()
    }
}

struct PlanetView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetView()
    }
}

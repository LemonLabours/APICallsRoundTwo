//
//  WorldTimeView.swift
//  APIRoundTwo
//
//  Created by Lama AL Yousef on 01/06/2023.
//

import SwiftUI


struct WorldTimeView: View {
    @StateObject private var viewModel = WorldTimeViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            if let worldTime = viewModel.worldTime {
                Text("Timezone: \(worldTime.timezone)")
                Text("Datetime: \(worldTime.datetime)")
                Text("Date: \(worldTime.date)")
                Text("Year: \(worldTime.year)")
                Text("Month: \(worldTime.month)")
                Text("Day: \(worldTime.day)")
                Text("Hour: \(worldTime.hour)")
                Text("Minute: \(worldTime.minute)")
                Text("Second: \(worldTime.second)")
                           } else {
                Text("Fetching world time...")
            }
        }
        .padding()
    }
}
struct WorldTimeView_Previews: PreviewProvider {
    static var previews: some View {
        WorldTimeView()
    }
}

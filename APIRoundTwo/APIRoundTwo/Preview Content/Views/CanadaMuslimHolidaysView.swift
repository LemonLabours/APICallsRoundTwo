//
//  CanadaMuslimHolidaysView.swift
//  APIRoundTwo
//
//  Created by Lama AL Yousef on 31/05/2023.
//
import SwiftUI
struct CanadaMuslimHolidaysView: View {
    @ObservedObject var holidaysViewModel = CanadaMuslimHolidaysViewModel()

    var body: some View {
        VStack {
            if holidaysViewModel.holidays.isEmpty {
                Text("Loading...")
            } else {
                List(holidaysViewModel.holidays, id: \.date) { holiday in
                    VStack(alignment: .leading) {
                        Text("Date: \(holiday.date)")
                            .font(.headline)
                        Text("Name: \(holiday.name)")
                            .font(.subheadline)
                        Text("Type: \(holiday.type)")
                            .font(.subheadline)
                    }
                }
            }
        }
        .onAppear {
            holidaysViewModel.fetchHolidays()
        }
    }
}

struct CanadaMuslimHolidaysView_Previews: PreviewProvider {
    static var previews: some View {
        CanadaMuslimHolidaysView()
    }
}

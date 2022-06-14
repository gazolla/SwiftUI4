//
//  ChartsView.swift
//  SwiftUI4
//
//  Created by sebastiao Gazolla Costa Junior on 13/06/22.
//

import SwiftUI
import Charts


struct ChartsView: View {
    
    var body: some View {
        let barColors: [Color] = [.red, .black, .blue, .green, .yellow, .purple, .teal]
        Chart(sampleDownloads) { item in
            BarMark(x: .value("Day", item.day), y: .value("Downloads", item.downloads)
            )
            .foregroundStyle(by:.value("Day", item.day))
        }
        .chartForegroundStyleScale(
            domain: sampleDownloads.compactMap({ download -> String? in
                download.day
            }),
            range: barColors
        )
        .frame(height:300)
    }
}

struct ChartsView_Previews: PreviewProvider {
    static var previews: some View {
        ChartsView()
    }
}

struct Download: Identifiable{
    var id = UUID().uuidString
    var day: String
    var downloads: Double
}

var sampleDownloads: [Download] = [
    Download(day:"Mon",downloads: 100),
    Download(day:"Tue",downloads: 2087),
    Download(day:"Wed",downloads: 350),
    Download(day:"Thus",downloads: 420),
    Download(day:"Fri",downloads: 580),
    Download(day:"Sat",downloads: 90),
    Download(day:"Sun",downloads: 900),
]


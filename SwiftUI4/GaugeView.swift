//
//  GaugeView.swift
//  SwiftUI4
//
//  Created by sebastiao Gazolla Costa Junior on 19/06/22.
//

import SwiftUI

struct GaugeView: View {
    var body: some View {
        Gauge(value: 0.4, label:{}, currentValueLabel:{
            Text("40")
                .bold()
        })
        .frame(width:100,height:100)
        .gaugeStyle(.accessoryCircular)
        .tint(.blue)
        .padding()
    }
}

struct GaugeView_Previews: PreviewProvider {
    static var previews: some View {
        GaugeView()
    }
}

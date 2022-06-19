//
//  MultiDatePickerView.swift
//  SwiftUI4
//
//  Created by sebastiao Gazolla Costa Junior on 18/06/22.
//

import SwiftUI

struct MultiDatePickerView: View {
    @State var dates = Set<DateComponents>()
    @Environment(\.calendar) var calendar
    
    var body: some View {
        VStack{
            Text("MultiDatePicker")
                .font(.title)
                .padding()
            MultiDatePicker("Select your dates:", selection: $dates, in: Date.now...)
                .frame(width:300, height:350)
                .padding()
                .background{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white.shadow(.drop(radius: 4)))
                }
            Text(summary)
        }
    }
    
    var summary:String {
        dates.compactMap { components in
            calendar.date(from: components)?.formatted(date:.long, time:.omitted)
        }.formatted()
    }
}

struct MultiDatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        MultiDatePickerView()
    }
}

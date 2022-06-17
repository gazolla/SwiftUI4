//
//  TapLocationView.swift
//  SwiftUI4
//
//  Created by sebastiao Gazolla Costa Junior on 17/06/22.
//

import SwiftUI

struct TapLocationView: View {
    @State var locationStr:String = ""
    var body: some View {
        VStack{
            Text("Tap on the rectangle")
                .font(.title)
            Rectangle()
                .fill(.blue)
                .frame(width: 280, height:280)
                .onTapGesture { location in
                    locationStr = "\(location)"
                }
            Text(locationStr)
        }
    }
}

struct TapLocationView_Previews: PreviewProvider {
    static var previews: some View {
        TapLocationView()
    }
}

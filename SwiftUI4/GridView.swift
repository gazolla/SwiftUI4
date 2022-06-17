//
//  GridView.swift
//  SwiftUI4
//
//  Created by sebastiao Gazolla Costa Junior on 17/06/22.
//

import SwiftUI

struct GridView: View {
    var body: some View {
        Grid{
            GridRow {
                Image(systemName: "circle")
                Image(systemName: "xmark")
                Image(systemName: "xmark")
            }
            GridRow {
                Image(systemName: "xmark")
                Image(systemName: "circle")
                Image(systemName: "xmark")
            }
            GridRow {
                Image(systemName: "xmark")
                Image(systemName: "xmark")
                Image(systemName: "circle")
            }
        }
        .font(.title)
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}

//
//  ContentView.swift
//  SwiftUI4
//
//  Created by sebastiao Gazolla Costa Junior on 10/06/22.
//

import SwiftUI

enum ItemType:String {
    case chart, sheet, shareLink, ImgRender, grid, tapLocation, gauge, multiDatePicker, text
}

struct Content: Identifiable, Hashable{
    let id = UUID()
    let name: ItemType
    let img:String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    static let loadedItems:[Content] = [
        .init(name: .chart, img: "chart.bar.xaxis"),
        .init(name: .sheet, img: "doc.plaintext"),
        .init(name: .shareLink, img: "link"),
        .init(name: .ImgRender, img: "photo"),
        .init(name: .grid, img: "rectangle.grid.2x2"),
        .init(name: .tapLocation, img: "hand.point.up.left"),
        .init(name: .gauge, img: "gauge"),
        .init(name: .multiDatePicker, img:  "calendar"),
        .init(name: .text, img: "text.alignleft")
    ]
}

struct MainView: View {
    @State private var newFunctionalities : [Content] = Content.loadedItems
    var body: some View {
        NavigationStack {
            List(newFunctionalities) { functionality in
                NavigationLink(value: functionality) {
                    HStack{
                        Image(systemName: functionality.img)
                            .renderingMode(.original)
                        Text("\(functionality.name.rawValue)")
                    }
                }
            }
            .navigationDestination(for: Content.self) { functionality in
                selectFunctionality(name:functionality.name)
            }
            .navigationTitle("New in SwiftyUI 4")
        }
    }
    
    func selectFunctionality(name:ItemType) -> some View {
        switch name {
        case .chart:
            return AnyView(ChartsView())
        case .sheet:
            return AnyView(SheetView())
        case .shareLink:
            return AnyView(ShareLinkView())
        case .ImgRender:
            return AnyView(ImageRendererView())
        case .grid:
            return AnyView(GridView())
        case .tapLocation:
            return AnyView(TapLocationView())
        case .gauge:
            return AnyView(GaugeView())
        case .multiDatePicker:
            return AnyView(MultiDatePickerView())
        case .text:
            return AnyView(TextView())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

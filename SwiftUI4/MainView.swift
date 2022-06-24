//
//  ContentView.swift
//  SwiftUI4
//
//  Created by sebastiao Gazolla Costa Junior on 10/06/22.
//

import SwiftUI


struct Content: Identifiable, Hashable{
    let id = UUID()
    let name: String
    let img:String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    static let loadedItems:[Content] = [
        .init(name: "Chart", img: "chart.bar.xaxis"),
        .init(name: "Sheet", img: "doc.plaintext"),
        .init(name: "Share Link", img: "link"),
        .init(name: "Image Renderer", img: "photo"),
        .init(name: "Grid", img: "rectangle.grid.2x2"),
        .init(name: "Tap location view", img: "hand.point.up.left"),
        .init(name: "Gauge", img: "gauge"),
        .init(name: "MultiDatePicker", img:  "calendar"),
        .init(name: "Text", img: "text.alignleft")
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
                        Text(functionality.name)
                    }
                }
            }
            .navigationDestination(for: Content.self) { functionality in
                selectFunctionality(name:functionality.name)
            }
            .navigationTitle("New in SwiftyUI 4")
        }
    }
    
    func selectFunctionality(name:String) -> some View {
        switch name {
        case "Chart":
            return AnyView(ChartsView())
        case "Sheet":
            return AnyView(SheetView())
        case "Share Link":
            return AnyView(ShareLinkView())
        case "Image Renderer":
            return AnyView(ImageRendererView())
        case "Grid":
            return AnyView(GridView())
        case "Tap location view":
            return AnyView(TapLocationView())
        case "Gauge":
            return AnyView(GaugeView())
        case "MultiDatePicker":
            return AnyView(MultiDatePickerView())
        case "Text":
            return AnyView(TextView())
        default:
            return AnyView(UnderConstruction())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

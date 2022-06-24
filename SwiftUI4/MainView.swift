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
    
    static let loadedItems:[Content] = [
        .init(name: "Chart"),
        .init(name: "Sheet"),
        .init(name: "Share Link"),
        .init(name: "Image Renderer"),
        .init(name: "Grid"),
        .init(name: "Tap location view"),
        .init(name: "Gauge"),
        .init(name: "MultiDatePicker"),
        .init(name: "Text")
    ]
}

struct MainView: View {
    @State private var newFunctionalities : [Content] = Content.loadedItems
    var body: some View {
        NavigationStack {
            List(newFunctionalities) { functionality in
                NavigationLink(functionality.name, value: functionality)
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

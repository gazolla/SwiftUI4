//
//  SheetView.swift
//  SwiftUI4
//
//  Created by sebastiao Gazolla Costa Junior on 14/06/22.
//

import SwiftUI

struct SheetView: View {
    
    @State var showView: Bool = false
    
    var body: some View {
        Button("Show sheet"){
            showView.toggle()
        }
        .sheet(isPresented: $showView) {
            MySheetView()
        }
    }
}

struct MySheetView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            Text("Hello from sheet!")
                .presentationDetents([.small, .medium, .large])
            //.presentationDragIndicator(.hidden)
            
            Button("Press to dismiss") {
                        dismiss()
            }
        }
    }
}

// MARK: Small Custom Detent
extension PresentationDetent{
    static let small = Self.height(100)
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}

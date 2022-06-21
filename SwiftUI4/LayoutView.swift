//
//  LayoutView.swift
//  SwiftUI4
//
//  Created by sebastiao Gazolla Costa Junior on 20/06/22.
//

import SwiftUI

struct LayoutView: View {
    @State private var myText = ""
    @State private var isBlack = false
    var body: some View {
        VStack{
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                .lineLimit(3...6)
                .padding()
            
            Text("Changing Fonts!")
                .font(.largeTitle)
                .fontWeight(isBlack ? .black : .ultraLight)
            
            Button("Tap here to change font") {
                withAnimation {
                    isBlack.toggle()
                }
            }
           
            
            TextField("Enter your text here", text: $myText, axis:.vertical)
                .textFieldStyle(.roundedBorder)
                .lineLimit(...5)
            
            
        }
        
    }
}

struct LayoutView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutView()
    }
}

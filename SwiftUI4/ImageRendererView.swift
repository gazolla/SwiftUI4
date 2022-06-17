//
//  ImageRendererView.swift
//  SwiftUI4
//
//  Created by sebastiao Gazolla Costa Junior on 17/06/22.
//

import SwiftUI

struct ImageRendererView: View {
    var body: some View {
        VStack{
            myView
                .padding()
            
            Button("Click to save image"){
                guard let image = ImageRenderer(content: myView).uiImage else {
                    return
                }
                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            }
        }
    }
    
    var myView:some View{
        VStack{
            Image(systemName: "battery.100.bolt")
                .resizable()
                .symbolRenderingMode(.palette)
                .foregroundStyle(.brown, .gray, .green)
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            Text("Battery")
        }
        
    }
}

struct ImageRendererView_Previews: PreviewProvider {
    static var previews: some View {
        ImageRendererView()
    }
}

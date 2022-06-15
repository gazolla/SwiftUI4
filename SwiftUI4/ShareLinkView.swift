//
//  ShareLinkView.swift
//  SwiftUI4
//
//  Created by sebastiao Gazolla Costa Junior on 14/06/22.
//

import SwiftUI

struct ShareLinkView: View {
    var wwdcImage = ImageFile(image: Image("wwdc"))
    var body: some View {
        ShareLink(item: wwdcImage, preview: SharePreview("wwdc22", image:wwdcImage.image)) {
            Text("Share Image")
        }
    }
}

struct ShareLinkView_Previews: PreviewProvider {
    static var previews: some View {
        ShareLinkView()
    }
}

struct ImageFile: Transferable {
    var image: Image
    
    static var transferRepresentation: some TransferRepresentation{
        ProxyRepresentation(exporting: \.image)
    }
    
}

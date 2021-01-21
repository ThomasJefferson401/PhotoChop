//
//  PreviewView.swift
//  PhotoChop
//
//  Created by Thomas J on 1/5/21.
//

import SwiftUI

struct PreviewView: View {
    var image : UIImage
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Image(uiImage : image)
            .resizable()
            .aspectRatio(contentMode: .fit)
        
        
        
        Button(action: {
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            SimpleButton(buttonText: "Download Image", color1: Color.red, color2: Color.blue, wid: 130)
        })
        
        
    }
}

struct PreviewView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            PreviewView(image: UIImage(imageLiteralResourceName: "Example"))
 
        }
        
        
    }
}

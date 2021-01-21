//
//  SimpleButton.swift
//  PhotoChop
//
//  Created by Thomas J on 1/3/21.
//

import SwiftUI

struct SimpleButton: View {
    var buttonText = ""
    var color1 = Color.green
    var color2 = Color.blue
    var wid : CGFloat = 100.0
    var hei  : CGFloat = 50.0
    var body: some View {
        ZStack{
    
             RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .top, endPoint: .bottom))
                .frame(width: wid, height: hei)
            Text(buttonText)
                .foregroundColor(.white)
            
        }
        
    }
}

struct SimpleButton_Previews: PreviewProvider {
    static var previews: some View {
        SimpleButton()
    }
}

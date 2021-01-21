//
//  HeaderView.swift
//  PhotoChop
//
//  Created by Thomas J on 1/7/21.
//

import SwiftUI

struct HeaderView: View {
    var text : String = ""
    var body: some View {
       ZStack
       {
        RoundedRectangle(cornerRadius: 20)
            .fill(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .frame(width: 100, height: 100)
        
        Text(text)
            .foregroundColor(.white)
        
       }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}

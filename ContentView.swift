//
//  ContentView.swift
//  PhotoChop
//
//  Created by Thomas J on 1/3/21.
//

import SwiftUI

struct ContentView: View {
   
    @State var pres : Array<UIImage> = images().getPres()
    @State var bill : Array<UIImage> = images().getBill()
    @State var sport : Array<UIImage> = images().getSport()
    @State var image : UIImage = UIImage(imageLiteralResourceName: "Example")
       
   
    var body: some View {
        
  
        NavigationView {
            
            ScrollView(.vertical)
            {
                Spacer(minLength: -80)
                ZStack(alignment: .top)
                   {
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))

                  
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                   }
               
                        ScrollView(.horizontal) {
                            ZStack
                            {
                                RoundedRectangle(cornerRadius: 25.0)
                                    .fill(LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .frame(height : 120)
                            HStack{
                                HeaderView(text : "Presidents")
                
                                ForEach(0..<pres.count)
                                {
                                    let img = pres[$0]
                                    Image(uiImage: pres[$0])
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                                        .aspectRatio(contentMode: .fit)
                                        .onTapGesture {
                                            image = img
                                        }
                                        
                                }
                            }
                            }
                            
                            
                        }
                        ScrollView(.horizontal) {
                            
                            ZStack
                            {
                                RoundedRectangle(cornerRadius: 25.0)
                                    .fill(LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .frame(height : 120)
                                    
                                HStack{
                                    HeaderView(text : "Billboards")
                                    
                                    ForEach(0..<bill.count)
                                    {
                                        let img = bill[$0]
                                        Image(uiImage: bill[$0])
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                            .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                                            .aspectRatio(contentMode: .fit)
                                            .onTapGesture {
                                                image = img
                                            }
                                    }
                                }
                            }
                            
                            

                    }
                    ScrollView(.horizontal) {
                            
                        ZStack
                        {
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                .frame(height : 120)
                            HStack{
                                HeaderView(text : "Sports")
                                
                                
                                ForEach(0..<sport.count)
                                {
                                    let img = sport[$0]
                                    Image(uiImage: sport[$0])
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                                        .aspectRatio(contentMode: .fit)
                                        .onTapGesture {
                                            image = img
                                        }
                                }
                            }
                        }
                          
                        }
                    
                
                NavigationLink(
                    destination: ImagePickerView(toBeEdited: image),
                    label: {
                        SimpleButton(buttonText: "GO!", color1: Color.pink, color2: Color.blue, wid: 80, hei: 50)
                    })
            }

//            VStack {
//
//            }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

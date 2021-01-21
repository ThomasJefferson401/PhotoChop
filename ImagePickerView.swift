//
//  ImagePickerView.swift
//  PhotoChop
//
//  Created by Thomas J on 1/3/21.
//

import SwiftUI


extension UIView {
    func asImage(rect: CGRect) -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: rect)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
    
    


struct ImagePickerView: View {

    var toBeEdited : UIImage
    @State var showActionSheet : Bool = false
    @State var showImagePicker : Bool = false
    @State var sourceType:UIImagePickerController.SourceType = .photoLibrary
    @State private var isEditing = false
    @State private var opa : Double = 1.0
    @State var image:UIImage?
    
    @State var x: CGFloat = 0.0
    @State var y: CGFloat = 0.0
    @State var width: CGFloat = 0.0
    @State var height: CGFloat = 0.0
    @State var rect : CGRect = .zero
    @State var showPreview : Bool = false
    
    @State var degX : Double = 0
    @State var degY : Double = 0
    @State var isDragging : Bool = false
    @State private var dragWidth : CGSize = CGSize.zero
    @State private var prevDrag : CGSize = CGSize.zero
    @State private var locationTapped : CGPoint = CGPoint.zero

    var body: some View {
     
            
            VStack {
               
                //images
                ZStack {
                    
                    if image != nil {
                        DynamicImage(image: image!, degX : degX, degY : degY)
                    }
                    
              
                    Image(uiImage: toBeEdited)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .opacity(opa)
                        .allowsHitTesting(false)
                        .background(RectGetter(rect: self.$rect))
                        
                    
                    
                   
                }
                
                //slider
                HStack{
                    Spacer(minLength: 20)
                    ZStack
                    {
                        
                        RoundedRectangle(cornerRadius: 25.0)
                            .foregroundColor(.blue)
                            .frame(width: 102, height: 20, alignment: .leading)
                            .allowsHitTesting(false)
                            
                        Slider(
                            value: $opa,
                            in: 0...1,
                            step: 0.1,
                            onEditingChanged: { editing in
                                isEditing = editing
                            }
                        )
                        .frame(width: 100.0, height: 30, alignment: .trailing)
                        .foregroundColor(.white)
                        
                        Text("Opacity")
                            .foregroundColor(.white)
                            .allowsHitTesting(false)
                    }
                    
                    Spacer(minLength: 20)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 50, height: 50)
                        .rotation3DEffect(
                            .degrees(degY),
                            axis: (x: 0.0, y: 0.1, z : 0.0)
                        )
                        .rotation3DEffect(
                            .degrees(degX),
                            axis: (x: 0.1, y: 0.0, z : 0.0)
                        )
                        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onChanged({(value) in
                            self.locationTapped = value.startLocation
                            self.dragWidth = CGSize(width: value.translation.width + self.prevDrag.width , height: value.translation.height + self.prevDrag.height)
                           
                            degY = Double(dragWidth.width)
                            degX = Double(dragWidth.height)
                            
                        }))
                    Spacer(minLength: 10)
                }
                    

                //buttons
                
                Button(action: {
                    self.showActionSheet = true
                }) {
                    SimpleButton(buttonText: "Choose Photo", color1: Color.blue, color2: Color.green, wid: 160, hei: 50)
                }.actionSheet(isPresented: $showActionSheet){
                    ActionSheet(title: Text("Add a picture to your post"), message: nil, buttons: [
                        .default(Text("Photo Library"), action: {
                            self.showImagePicker = true
                            self.sourceType = .photoLibrary
                        }),
                        
                        //Button3
                        .cancel()
                        
                    ])
                }.sheet(isPresented: $showImagePicker){
                    imagePicker(image: self.$image, showImagePicker: self.$showImagePicker, sourceType: self.sourceType)
                }


                Button(action: {
                          self.showPreview.toggle()
                      }) {
                    SimpleButton(buttonText: "Preview", color1: Color.green, color2: Color.blue)
                      }.sheet(isPresented: $showPreview) {
                        if rect != .zero
                        {
                            PreviewView(image: UIApplication.shared.windows[0].rootViewController?.view.asImage(rect: self.rect) ?? UIImage(imageLiteralResourceName: "Example"))
                        }
                        else
                        {
                            PreviewView(image : toBeEdited)
                        }
                        
                        
                      }
                
            }

    
    }
    
    
}




struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView(toBeEdited: UIImage(imageLiteralResourceName: "Example"))
            
    }
}


struct RectGetter: View {
    @Binding var rect: CGRect

    var body: some View {
        GeometryReader { proxy in
            self.createView(proxy: proxy)
        }
    }

    func createView(proxy: GeometryProxy) -> some View {
        DispatchQueue.main.async {
            self.rect = proxy.frame(in: .global) // crash here
        }

        return Rectangle().fill(Color.clear)
    }
}


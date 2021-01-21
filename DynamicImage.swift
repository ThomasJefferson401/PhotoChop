//
//  DynamicImage.swift
//  PhotoChop
//
//  Created by Thomas J on 1/3/21.
//

import SwiftUI

struct DynamicImage: View {
    var image : UIImage
    var degX : Double
    var degY : Double
    @State private var scale : CGFloat = 1.0
    @State private var tapped : Bool = false
    @State private var locationTapped : CGPoint = CGPoint.zero
    @State private var dragWidth : CGSize = CGSize.zero
    @State private var prevDrag : CGSize = CGSize.zero
    @State private var currentRotation = Angle.zero
    @GestureState private var twistAngle = Angle.zero
    
    
    var body: some View {
        GeometryReader{ reader in
          Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .animation(.default)
                .offset(x: self.dragWidth.width, y: dragWidth.height)
                .scaleEffect(self.scale)
                .rotationEffect(currentRotation + twistAngle)
                .gesture(TapGesture (count: 2).onEnded({
                    self.tapped = !self.tapped
                })
                        .simultaneously(with: DragGesture(minimumDistance: 0, coordinateSpace: .global).onChanged({(value) in
                            self.locationTapped = value.startLocation
                            self.dragWidth = CGSize(width: value.translation.width + self.prevDrag.width , height: value.translation.height + self.prevDrag.height)
                            print(value.location)
                })
                .onEnded({(value) in
                    print(value.location)
                    self.dragWidth = CGSize(width: value.translation.width + self.prevDrag.width , height: value.translation.height + self.prevDrag.height)
                })))
                .gesture(RotationGesture()
                    .updating($twistAngle, body: { (value, state, _) in
                        state = value
                    })
                    .onEnded({ (value) in
                        self.currentRotation += value
                    })
                            .simultaneously(with: MagnificationGesture()
                                .onChanged({ (scale) in
                                    self.scale = scale
                                }).onEnded({ (scaleFinal) in
                                    self.scale = scaleFinal.magnitude
                    })))
                .rotation3DEffect(
                    .degrees(degX),
                    axis: (x: 0.1, y: 0.0, z: 0.0)
                    )
                .rotation3DEffect(
                    .degrees(degY),
                    axis: (x: 0.0, y: 0.1, z: 0.0)
                    )

        }
     
     
    }
    
}

struct DynamicImage_Previews: PreviewProvider {
    static var previews: some View {
        DynamicImage(image: UIImage(imageLiteralResourceName: "Example"), degX: 0, degY: 0.0)
    }
}

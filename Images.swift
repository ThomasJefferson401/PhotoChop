//
//  Images.swift
//  PhotoChop
//
//  Created by Thomas J on 1/7/21.
//

import Foundation
import SwiftUI


class images {
    var president: Array<UIImage> = []
    var billboard: Array<UIImage> = []
    var sport: Array<UIImage> = []
    
    
    func setAll()
    {
        president.append(UIImage(imageLiteralResourceName: "President1"))
        president.append(UIImage(imageLiteralResourceName: "President2"))
        president.append(UIImage(imageLiteralResourceName: "President3"))
        president.append(UIImage(imageLiteralResourceName: "President4"))
        president.append(UIImage(imageLiteralResourceName: "President5"))
        billboard.append(UIImage(imageLiteralResourceName: "Billboard1"))
        billboard.append(UIImage(imageLiteralResourceName: "Billboard2"))
        sport.append(UIImage(imageLiteralResourceName: "Sports1"))
        sport.append(UIImage(imageLiteralResourceName: "Sports2"))
        sport.append(UIImage(imageLiteralResourceName: "Sports3"))
    }
    
    func getPres() ->Array<UIImage>
    {
        president.append(UIImage(imageLiteralResourceName: "President1"))
        president.append(UIImage(imageLiteralResourceName: "President2"))
        president.append(UIImage(imageLiteralResourceName: "President3"))
        president.append(UIImage(imageLiteralResourceName: "President4"))
        return president
    }
    func getBill() ->Array<UIImage>
    {
        billboard.append(UIImage(imageLiteralResourceName: "Billboard1"))
        billboard.append(UIImage(imageLiteralResourceName: "Billboard2"))
        billboard.append(UIImage(imageLiteralResourceName: "Billboard3"))
        return billboard
    }
    func getSport() ->Array<UIImage>
    {
        sport.append(UIImage(imageLiteralResourceName: "Sports1"))
        sport.append(UIImage(imageLiteralResourceName: "Sports2"))
        sport.append(UIImage(imageLiteralResourceName: "Sports3"))
        return sport
    }
}

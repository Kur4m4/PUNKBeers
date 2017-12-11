//
//  Beer.swift
//  31924
//
//  Created by user132969 on 12/1/17.
//  Copyright © 2017 user132969. All rights reserved.
//

import Foundation

class Beer {
    var image: String
    var name: String
    var tagline: String
    var alcoholVolume: Double
    var bitternessScale: Double
    var description: String
    
    init(image: String, name: String, tagline: String, alcoholVolume: Double, bitternessScale: Double, description: String) {
        self.image = image
        self.name = name
        self.tagline = tagline
        self.alcoholVolume = alcoholVolume
        self.bitternessScale = bitternessScale
        self.description = description
    }
}

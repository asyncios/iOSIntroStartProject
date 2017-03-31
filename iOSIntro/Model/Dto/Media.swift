//
//  Media.swift
//  FandangoLatam
//
//  Created by Cinepapaya on 1/31/17.
//  Copyright © 2017 FandangoLatam. All rights reserved.
//

import UIKit
import ObjectMapper

class Media: Mappable
{
    var url: String?
    var image: String?
    var provider: String?
    var extensionString: String?
    var width: Float?
    var height: Float?
    var size: String?
    var isTrailer: Bool?
    
    required init(){
        
    }
    
    required init?(map: Map)
    {
        
    }
    
    // Mappable
    
    func mapping(map: Map)
    {
        url             <- map["url"]
        image           <- map["image"]
        provider        <- map["provider"]
        extensionString <- map["extension"]
        width           <- map["width"]
        height          <- map["height"]
        size            <- map["size"]
        isTrailer       <- map["isTrailer"]
    }

    func clone()->Media{
        let media = Media()
        media.url = url
        media.image = image
        media.provider = provider
        media.extensionString = extensionString
        media.width = width
        media.height = height
        media.size = size
        media.isTrailer = isTrailer
        return media
    }
    
}

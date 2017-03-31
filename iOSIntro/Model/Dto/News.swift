//
//  News.swift
//  FandangoLatam
//
//  Created by josue cadillo on 3/14/17.
//  Copyright © 2017 FandangoLatam. All rights reserved.
//

import UIKit
import ObjectMapper

class News: Mappable {

    var newsId: Int?
    var title: String?
    var titleSlug: String?
    var shortDescription: String?
    var mainImage: Media?
    var editorName: String?
    var editorUrl: String?
    var isMainArticle: Bool?
    var publishDate: String?

    required init?(map: Map)
    {
        
    }
    
    // Mappable
    
    func mapping(map: Map)
    {
        newsId                  <- map["id"]
        title                   <- map["title"]
        titleSlug               <- map["titleSlug"]
        shortDescription        <- map["shortDescription"]
        mainImage               <- map["mainImage"]
        editorName              <- map["editorName"]
        editorUrl               <- map["editorUrl"]
        isMainArticle           <- map["isMainArticle"]
        publishDate             <- map["publishDate"]
    }
}

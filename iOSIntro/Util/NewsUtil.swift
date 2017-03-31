//
//  NewsUtil.swift
//  NewApp
//
//  Created by josue cadillo on 3/30/17.
//  Copyright © 2017 FandangoLatam. All rights reserved.
//

import UIKit

class NewsUtil: NSObject {
    
    static func getNews(newsString: String) -> Array<News>
    {
        if let json = newsString.parseJSONString
        {
            let newsObject = json["news"] as? Dictionary<String, Any>
            if newsObject != nil
            {
                var newsArray = Array<News>()
                let newsOrder = json["order"] as? Array<Int>
                if newsOrder != nil
                {
                    for newsId in newsOrder!
                    {
                        if let newsIdString = Util.numberToString(pObject: newsId)
                        {
                            let newsDictionary =  newsObject![newsIdString] as! Dictionary<String, Any>?
                            if let news = News(JSON: newsDictionary!)
                            {
                                newsArray.append(news)
                            }
                        }
                    }
                }
                else
                {
                    for (newsId,_) in newsObject!
                    {
                        if let newsIdString = Util.numberToString(pObject: newsId)
                        {
                            let newsDictionary =  newsObject![newsIdString] as! Dictionary<String, Any>?
                            if let news = News(JSON: newsDictionary!)
                            {
                                newsArray.append(news)
                            }
                        }
                    }
                }
                return newsArray
            }
        }
        return []
    }
    
    static func getNewsUrl(newsId: String, titleSlug: String) -> String {
        var baseUrl = "https://www.fandango.lat/pe/noticias/{titleSlug}-{id}"
            .replacingOccurrences(of: "{titleSlug}", with: titleSlug)
            .replacingOccurrences(of: "{id}", with: newsId)
        
        
        baseUrl = "\(baseUrl)?d=m"
        
        return baseUrl
    }
}

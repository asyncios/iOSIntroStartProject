//
//  Util.swift
//  NewApp
//
//  Created by josue cadillo on 3/31/17.
//  Copyright © 2017 FandangoLatam. All rights reserved.
//

import UIKit

class Util: NSObject {
    
    static func setImageUrl(string: String, height: Double) -> URL
    {
        var stringValue = "?"
        if (string.contains(stringValue))
        {
            stringValue = "&"
        }
        var stringURL: String
        if height > 0
        {
            stringURL = String.init(format: "%@%@h=%ld&q=75",string,stringValue,Int64(height))
        }
        else
        {
            stringURL = String.init(format: "%@%@h=%ld&q=75",string,stringValue)
        }
        if !(string.contains("http"))
        {
            stringURL = String.init(format: "%@%@","https:",stringURL);
        }
        
        return URL(string: stringURL)!
    }
    
    
    static func stringToNumber(pObject: Any?)->Double?
    {
        if pObject == nil
        {
            return nil
        }
        
        if pObject is Double
        {
            return pObject as? Double
        }
        
        if pObject is Float
        {
            return Double.init((pObject as? Float)!)
        }
        
        if pObject is Int
        {
            return Double.init((pObject as? Int)!)
        }
        
        if pObject is String
        {
            return Double((pObject as? String)!)
        }
        
        return nil
    }
    
    static func numberToString(pObject: Any?)->String?
    {
        if pObject == nil
        {
            return nil
        }
        
        if pObject is String
        {
            return pObject as? String
        }
        
        if pObject is Int
        {
            return String((pObject as? Int)!)
        }
        
        if pObject is Float
        {
            return String((pObject as? Float)!)
        }
        
        if pObject is Double
        {
            return String((pObject as? Double)!)
        }
        
        return nil
    }
}

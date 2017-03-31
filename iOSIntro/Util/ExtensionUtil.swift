//
//  ExtensionUtil.swift
//  NewApp
//
//  Created by josue cadillo on 3/30/17.
//  Copyright © 2017 FandangoLatam. All rights reserved.
//

import UIKit
import SDWebImage

extension String {
    
    var parseJSONString: [String:Any]? {
        
        let data = self.data(using: String.Encoding.utf8, allowLossyConversion: false)
        
        if let jsonData = data
        {
            // Will return an object or nil if JSON decoding fails
            return try? JSONSerialization.jsonObject(with: jsonData, options: []) as! [String:Any]
        } else {
            // Lossless conversion of the string was not possible
            return nil
        }
    }
    
    var parseJSONStringArray: [Dictionary<String,Any>]? {
        
        let data = self.data(using: String.Encoding.utf8, allowLossyConversion: false)
        
        if let jsonData = data
        {
            // Will return an object or nil if JSON decoding fails
            return try? JSONSerialization.jsonObject(with: jsonData, options: []) as! [Dictionary<String,Any>]
        } else {
            // Lossless conversion of the string was not possible
            return nil
        }
    }
    
    
}

extension UIImageView
{
    func customSetImage(url: URL)
    {
        self.sd_setImage(with: url, placeholderImage: UIImage(named: ""))
    }
}

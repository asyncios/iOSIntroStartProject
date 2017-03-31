//
//  AlamoServiceApi.swift
//  NewApp
//
//  Created by josue cadillo on 3/30/17.
//  Copyright © 2017 FandangoLatam. All rights reserved.
//

import UIKit
import Alamofire

class AlamoServiceApi: NSObject {
    
    private static let DEFAULT_ERROR = "Ocurrio un Error"
    
    var sessionManager: SessionManager?
    var url: String?
    var parameters: Parameters?
    var method = HTTPMethod.get
    
    func setUrl(url: String) {
        self.url = url
    }
    
    func setup() {
        sessionManager = Alamofire.SessionManager.default
        method = HTTPMethod.get
        if parameters != nil {
            method = HTTPMethod.post
        }
    }
    
    func execute(start: @escaping ()->Void,
                 completed: @escaping (String)->Void,
                 error: @escaping (String)->Void) {
        setup()
        start()
        
        sessionManager?.request(self.url!, method: method, parameters: self.parameters, headers:nil).responseJSON { response in
            switch response.result
            {
            case .success:
                if response.response?.statusCode == 200 { // is valid response
                    if let string = String(data: response.data!, encoding: String.Encoding.utf8){
                        completed(string)
                        return
                    }
                }
                
                error(AlamoServiceApi.DEFAULT_ERROR)
                
                break
            case .failure:
                
                error(AlamoServiceApi.DEFAULT_ERROR)
                break
            }
        }
    }

}

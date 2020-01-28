//
//  DataGetter.swift
//  JSON Test
//
//  Created by Miranda Ramirez Cospin on 1/28/20.
//  Copyright © 2020 Miranda Ramirez Cospin. All rights reserved.
//

import UIKit

class DataGetter: NSObject {
    
    let MYJSONURL = "https://api.myjson.com/bins/1fuqny"
    
        var dataArray = ["No data! Sorry :("]
    
    func getData(completition: @escaping (_ success: Bool) -> ()) {
        var success = true
        
        let actualUrl = URL(string: MYJSONURL)
        
        let task = URLSession.shared.dataTask(with: actualUrl!) { (data, response, error) in
            
            guard let _ = data, error == nil else {
                
                success = false
                return
            }
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                
                
                print(jsonObj.value(forKey: "coffee")!)
                
                
                if let veggieArray = jsonObj.value(forKey: "coffee") as? Array<String> {
                    self.dataArray = veggieArray
                }
            }
            
            
            completition(success)
        }
        task.resume()
    }
    
}

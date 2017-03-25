//
//  ApiParse.swift
//  ITrip
//
//  Created by Özgün on 25.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//

import UIKit
import SwiftyJSON





class ApiParse {
    
    
    
    //:MARK - Place servisi için
    class func parsePlace(target:UIViewController,json:JSON,complate:(place:Place)->(),error:(message:String)->(),end:()->()){
        
        for index in 0..<json.count{
        
            let place = Place()
            place.id = json[index]["_id"].string!
            place.name = json[index]["isim"].string!
            place.city.code = String(json[index]["sehir"]["il"].int!)
            place.city.id = json[index]["sehir"]["_id"].string!
            place.city.name = json[index]["sehir"]["isim"].string!
            place.category = json[index]["kategori"].string!
            place.geo.latitude = String(json[index]["geo"][0].double!)
            place.geo.longitude = String(json[index]["geo"][1].double!)
            
            for indFoto in 0..<json[index]["foto"].count{
                let name = json[index]["foto"][indFoto].string!
                place.images.append(name)
            }
            
            
            complate(place:place)
        }
        end()
        
    }
    
    
}

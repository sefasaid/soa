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
            place.name = json[index]["name"].string!
            place.city.code = String(json[index]["city"]["city_id"].int!)
            place.city.id = json[index]["city"]["_id"].string!
            place.city.name = json[index]["city"]["name"].string!
            place.category = json[index]["category"].string!
            place.geo.latitude = String(json[index]["geo"][0].double!)
            place.geo.longitude = String(json[index]["geo"][1].double!)
            
            for indPhoto in 0..<json[index]["pictures"].count{
                let name = json[index]["pictures"][indPhoto].string!
                place.images.append(name)
            }
            
            
            complate(place:place)
        }
        end()
        
    }
    
    class func parseComment(target:UIViewController,json:JSON,complate:(comment:Comment)->(),error:(message:String)->(),end:()->()){
        // print(json)
        for index in 0..<json["comments"].count{
            let comment = Comment()
             comment.id = json["comments"][index]["_id"].string!
            comment.user.id = json["comments"][index]["user"]["_id"].string!
            comment.user.name = json["comments"][index]["user"]["name"]["first"].string! + json["comments"][index]["user"]["name"]["last"].string!
            comment.user.picture = json["comments"][index]["user"]["picture"]["medium"].string!
            comment.user.register = json["comments"][index]["user"]["registered"].string!
            if(json["comments"][index]["comment"].string != nil){
                comment.message = json["comments"][index]["comment"].string!
            }
            
            complate(comment: comment)
        }
        end()
    
    
    }
    
    
}

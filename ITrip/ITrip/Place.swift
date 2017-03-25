//
//  Place.swift
//  ITrip
//
//  Created by Özgün on 25.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//

import UIKit


class Place {
    
    var id          = String()
    var name        = String()
    var city        = City()
    var geo         = GeoPoint()
    var category    = String()
    var images      = [String]()
    var comments    = [Comment]()
}
class GeoPoint {
    
    var latitude    = String()
    var longitude   = String()
}

class City {
    
    var id      = String()
    var code    = String()
    var name    = String()
}
class Comment{
    var id          = String()
    var user        = User()
    var message     = String()
}
class User{

    var id          = String()
    var register    = String()
    var name        = String()
    var picture     = String()
}

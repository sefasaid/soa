//
//  MaterialColor.swift
//
//
//
//  Copyright © 2016 Özgün Ergen. All rights reserved.
//

import UIKit

public extension UIColor{
    //Flat Material Color
    class func flatTurquoiseColor()->UIColor{
        return hexColor(0x1abc9c)
    }
    class func flatGreenseaColor()->UIColor{
        return hexColor(0x16a085)
    }
    class func flatSunflowerColor()->UIColor{
        return hexColor(0xf1c40f)
    }
    class func flatOranceColor()->UIColor{
        return hexColor(0xf39c12)
    }
    class func flatEmerlandColor()->UIColor{
        return hexColor(0x2ecc71)
    }
    class func flatNephritisColor()->UIColor{
        return hexColor(0x27ae60)
    }
    class func flatCarrotColor()->UIColor{
        return hexColor(0xe67e22)
    }
    class func flatPumpkinColor()->UIColor{
        return hexColor(0xd35400)
    }
    class func flatPeterriverColor()->UIColor{
        return hexColor(0x3498db)
    }
    class func flatBelizeholeColor()->UIColor{
        return hexColor(0x2980b9)
    }
    class func flatAlizarinColor()->UIColor{
        return hexColor(0xe74c3c)
    }
    class func flatPomegranateColor()->UIColor{
        return hexColor(0xc0392b)
    }
    class func flatAmethystColor()->UIColor{
        return hexColor(0x9b59b6)
    }
    class func flatWisteriaColor()->UIColor{
        return hexColor(0x8e44ad)
    }
    class func flatCloudColor()->UIColor{
        return hexColor(0xecf0f1)
    }
    class func flatSilverColor()->UIColor{
        return hexColor(0xbdc3c7)
    }
    class func flatAsbestosColor()->UIColor{
        return hexColor(0x7f8c8d)
    }
    class func flatWetasphaltColor()->UIColor{
        return hexColor(0x34495e)
    }
    class func flatMidnighBlueColor()->UIColor{
        return hexColor(0x2c3e50)
    }
    class func flatConcrateColor()->UIColor{
        return hexColor(0x95a5a6)
    }

    //:MARK:- Hex Color
   class func hexColor(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: 1.0
        )
    }
   class func hexColor(rgbValue: UInt,alpha:CGFloat) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
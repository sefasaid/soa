//
//  Font.swift
//  ITrip
//
//  Created by Özgün on 25.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//

import UIKit




extension UIFont{
    
    class func appFont()->UIFont{
        
        return UIFont.systemFontOfSize(12)
    }
    class func appFont(n:CGFloat)->UIFont{
        
        return UIFont.systemFontOfSize(n)
    }
    
    class func appBoldFont()->UIFont{
        
        
        return UIFont.boldSystemFontOfSize(12)
    }
    class func appBoldFont(n:CGFloat)->UIFont{
        
        return UIFont.boldSystemFontOfSize(n)
    }
    
}

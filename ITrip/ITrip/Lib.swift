//
//  Lib.swift
//  ITrip
//
//  Created by Özgün on 25.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//

import UIKit



func heightToText(text:String, font:UIFont, width:CGFloat) -> CGFloat{
    
    let label:UILabel = UILabel(frame: CGRectMake(0, 0, width, CGFloat.max))
    label.numberOfLines = 0
    label.lineBreakMode = NSLineBreakMode.ByWordWrapping
    label.font = font
    label.text = text
    
    label.sizeToFit()
    return label.frame.height
}




extension UIViewController{

    func navigationBackGroundColor(backGColor:UIColor,tintC:UIColor){
        
        self.navigationController!.navigationBar.tintColor = tintC
        self.navigationController!.navigationBar.barTintColor = backGColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        
    }
    
}


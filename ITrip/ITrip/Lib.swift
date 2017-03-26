//
//  Lib.swift
//  ITrip
//
//  Created by Özgün on 25.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//

import UIKit
import CWStatusBarNotification


func heightToText(text:String, font:UIFont, width:CGFloat) -> CGFloat{
    
    let label:UILabel = UILabel(frame: CGRectMake(0, 0, width, CGFloat.max))
    label.numberOfLines = 0
    label.lineBreakMode = NSLineBreakMode.ByWordWrapping
    label.font = font
    label.text = text
    
    label.sizeToFit()
    return label.frame.height
}
func widthForView(text:String, font:UIFont) -> CGFloat{
    
    let label:UILabel = UILabel(frame: CGRectMake(0, 0, CGFloat.max, CGFloat.max))
    label.numberOfLines = 0
    label.lineBreakMode = NSLineBreakMode.ByWordWrapping
    label.font = font
    label.text = text
    
    label.sizeToFit()
    return label.frame.width
}
func localized(string:String) -> String {
    return NSLocalizedString(string,comment:"a")
}




extension UIViewController{

    func navigationBackGroundColor(backGColor:UIColor,tintC:UIColor){
        
        self.navigationController!.navigationBar.tintColor = tintC
        self.navigationController!.navigationBar.barTintColor = backGColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        
    }
    
    func notificationNavigationBar(txt:String,backColor:UIColor){
        
        let notif = CWStatusBarNotification()
        notif.notificationStyle = CWNotificationStyle.NavigationBarNotification
        notif.notificationLabelBackgroundColor = backColor
        notif.notificationLabelTextColor = UIColor.whiteColor()
        notif.notificationAnimationOutStyle = CWNotificationAnimationStyle.Top
        notif.displayNotificationWithMessage(txt, forDuration: 2.5)
        notif.notificationTappedBlock = {
            notif.dismissNotification()
        }
    }
    
    
    
}

extension UIImageView{
    

    func setRadius(cornerRadius:CGFloat,clipsToBounds:Bool,borderWidth:CGFloat,borderColor:UIColor) -> UIImageView{
        
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = clipsToBounds
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.CGColor
        
        return self
        
    }
    
}



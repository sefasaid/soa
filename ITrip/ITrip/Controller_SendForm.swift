//
//  Controller_SendForm.swift
//  ITrip
//
//  Created by Özgün on 25.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//

import UIKit


class Controller_SendForm: UIViewController,TagDelegate {
    
    
    var c_View : View_SendForm?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBackGroundColor(UIColor.flatSkyBlueColor(), tintC: UIColor.whiteColor())
        self.c_View = View_SendForm(frame: self.view.frame, target: self)
        self.view.addSubview(self.c_View!)
        
        
    }
    
    func returnSelectedTag(tag: [String]) {
        
        print(tag)
    }
}
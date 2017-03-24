//
//  View_PlaceDetail.swift
//  ITrip
//
//  Created by Özgün on 24.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//

import UIKit

class View_PlaceDetail: UIView {
    
    var target : UIViewController?
    
     init(frame: CGRect,target:UIViewController) {
        super.init(frame: frame)
        
        self.target = target
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //:MARK - ekrana cizilecek objectlerim
    func setCreateUI(){
        
        
        self.backgroundColor = UIColor.whiteColor()
        
    
    }
    
    
}

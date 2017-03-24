//
//  Cell_PD_CV_Images.swift
//  ITrip
//
//  Created by Özgün on 25.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//

import UIKit



class Cell_PD_CV_Images: UICollectionViewCell {
 
    
    var img_BackGround = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCreateUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setCreateUI(){
    
        
        
        self.addSubview(img_BackGround)
        img_BackGround.snp_makeConstraints { (make) in
            make.top.equalTo(self)
            make.bottom.equalTo(self)
            make.left.equalTo(self)
            make.right.equalTo(self)
        }
        img_BackGround.backgroundColor = UIColor.grayColor()
        
        
    }
    
}

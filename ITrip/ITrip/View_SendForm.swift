//
//  View_SendForm.swift
//  ITrip
//
//  Created by Özgün on 25.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//

import UIKit


class View_SendForm : UIView{

    var target:Controller_SendForm?
    
    var tags : OOETag?
    var txt_View_Desc = UITextView()
    var img_TVD = UIImageView()
    var img_TVT = UIImageView()
    
     init(frame: CGRect,target:Controller_SendForm) {
        super.init(frame: frame)
        
        
        self.target = target
        self.setCreateUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCreateUI(){
    
        
        self.backgroundColor = UIColor.whiteColor()
        
        //----------
        self.addSubview(img_TVD)
        img_TVD.snp_makeConstraints { (make) in
            make.width.equalTo(32)
            make.height.equalTo(128)
            make.top.equalTo(self)
            make.left.equalTo(self).offset(16)
        }
        img_TVD.image = UIImage(named: "About")
        img_TVD.contentMode = UIViewContentMode.ScaleAspectFit
        //----------
        self.addSubview(txt_View_Desc)
        txt_View_Desc.snp_makeConstraints { (make) in
            make.left.equalTo(self).offset(64)
            make.right.equalTo(self)
            make.top.equalTo(self)
            make.height.equalTo(128)
        }
        txt_View_Desc.backgroundColor = UIColor.flatSandColor()
        //----------
        
        self.addSubview(img_TVT)
        img_TVT.snp_makeConstraints { (make) in
            make.width.equalTo(32)
            make.height.equalTo(48)
            make.top.equalTo(self).offset(128)
            make.left.equalTo(self).offset(16)
        }
        img_TVT.image = UIImage(named: "tag")
        img_TVT.contentMode = UIViewContentMode.ScaleAspectFit
        self.tags = OOETag(frame: CGRectMake(64, 128, self.frame.width-64, 48), collectionViewLayout: UICollectionViewLayout())
        self.tags!.backgroundColor = UIColor.clearColor()
        self.tags!.clipsToBounds = false
        self.tags!.cellBackGroundColor = 0x3599DB
        self.tags?.tagTitleColor = 0x3599DB
        self.tags?.OOEdelegate = target
        self.addSubview(self.tags!)
        self.backgroundColor = UIColor.hexColor(0xFAFAFA)
        
    }

}


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
    var btn_data = UIButton()
    var img_data = UIImageView()
    var btn_complete = UIButton()
    
    init(frame: CGRect,target:Controller_SendForm) {
        super.init(frame: frame)
        
        
        self.target = target
        self.setCreateUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCreateUI(){
    
        
        self.backgroundColor = UIColor.hexColor(0xBDBDBD)
        
        //----------
        self.addSubview(img_TVD)
        img_TVD.snp_makeConstraints { (make) in
            make.width.equalTo(32)
            make.height.equalTo(128)
            make.top.equalTo(self).offset(64)
            make.left.equalTo(self).offset(16)
        }
        img_TVD.image = UIImage(named: "About")
        img_TVD.contentMode = UIViewContentMode.ScaleAspectFit
        //----------
        self.addSubview(txt_View_Desc)
        txt_View_Desc.snp_makeConstraints { (make) in
            make.left.equalTo(self).offset(64)
            make.right.equalTo(self)
            make.top.equalTo(self).offset(65)
            make.height.equalTo(128)
        }
        txt_View_Desc.backgroundColor = UIColor.hexColor(0xbdc3c7)
        //----------
        
        self.addSubview(img_TVT)
        img_TVT.snp_makeConstraints { (make) in
            make.width.equalTo(32)
            make.height.equalTo(48)
            make.top.equalTo(self).offset(192)
            make.left.equalTo(self).offset(16)
        }
        img_TVT.image = UIImage(named: "tag")
        img_TVT.contentMode = UIViewContentMode.ScaleAspectFit
        self.tags = OOETag(frame: CGRectMake(64, 192, self.frame.width-64, 48), collectionViewLayout: UICollectionViewLayout())
        self.tags!.backgroundColor = UIColor.clearColor()
        self.tags!.clipsToBounds = false
        self.tags!.cellBackGroundColor = 0x3599DB 
        self.tags?.tagTitleColor = 0x3599DB
        self.tags?.OOEdelegate = target
        self.addSubview(self.tags!)
        self.backgroundColor = UIColor.hexColor(0xFAFAFA)
        
        //-----
        self.addSubview(img_data)
        img_data.snp_makeConstraints{ (make) in
            make.width.equalTo(32)
            make.height.equalTo(48)
            make.top.equalTo(self).offset(240)
            make.left.equalTo(self).offset(16)
        }
        img_data.image = UIImage(named: "date")
        img_data.contentMode = UIViewContentMode.ScaleAspectFit
        
        //-----
        
        self.addSubview(btn_data)
        btn_data.snp_makeConstraints{ (make) in
            make.width.equalTo(self).offset(-64)
            make.height.equalTo(48)
            make.top.equalTo(tags!.snp_bottom)
            make.left.equalTo(self).offset(64)
        }
        btn_data.setTitle("Tarih Belirle", forState: .Normal)
        btn_data.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btn_data.backgroundColor = UIColor.flatSkyBlueColor()
        btn_data.addTarget(self.target, action: "actionForDate:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        //-----
        self.addSubview(btn_complete)
        btn_complete.snp_makeConstraints{ (make) in
            make.width.equalTo(128)
            make.height.equalTo(48)
            make.top.equalTo(self).offset(420)
            make.centerX.equalTo(self)
        }
        btn_complete.setTitle("Tamamla", forState: .Normal)
        btn_complete.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btn_complete.backgroundColor = UIColor.flatSkyBlueColor()
        btn_complete.layer.cornerRadius = self.frame.width/16
        
    }

}
















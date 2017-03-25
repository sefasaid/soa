//
//  Cell_PD_TV_Inf_2.swift
//  ITrip
//
//  Created by Özgün on 25.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//

import UIKit


class Cell_PD_TV_Inf_2 :UITableViewCell{

    
    var btn_Call = UIButton()
    var btn_Web = UIButton()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setCreateUI()
        self.selectionStyle = UITableViewCellSelectionStyle.None
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setCreateUI(){
    
        
        let v_Border = UIView()
        self.addSubview(v_Border)
        v_Border.snp_makeConstraints { (make) in
            make.width.equalTo(self)
            make.top.equalTo(self)
            make.height.equalTo(1)
        }
        v_Border.backgroundColor = UIColor.blackColor()
        self.addSubview(v_Border)
        
        
        self.addSubview(btn_Call)
        btn_Call.snp_makeConstraints { (make) in
            make.width.equalTo(self).multipliedBy(0.5)
            make.height.equalTo(self)
            make.left.equalTo(self.snp_left)
        }
        btn_Call.setTitle("ARA", forState: UIControlState.Normal)
        btn_Call.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btn_Call.setImage(UIImage(named: "Phone"), forState: UIControlState.Normal)
        // btn_Call.titleLabel?.textAlignment = NSTextAlignment.Center
        btn_Call.imageEdgeInsets = UIEdgeInsets(top: 20, left: 80, bottom: 30, right: 75)
        btn_Call.titleEdgeInsets = UIEdgeInsets(top: 25, left: -30, bottom: 0, right: 60)
        btn_Call.titleLabel?.font = UIFont.appBoldFont(14)
        
        
        
        
        self.addSubview(btn_Web)
        btn_Web.snp_makeConstraints { (make) in
            make.width.equalTo(self).multipliedBy(0.5)
            make.height.equalTo(self)
            make.right.equalTo(self.snp_right)
        }
        btn_Web.setTitle("WEB", forState: UIControlState.Normal)
        btn_Web.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btn_Web.setImage(UIImage(named: "World"), forState: UIControlState.Normal)
        btn_Web.titleLabel?.textAlignment = NSTextAlignment.Center
        btn_Web.imageEdgeInsets = UIEdgeInsets(top: 20, left: 80, bottom: 30, right: 75)
        btn_Web.titleEdgeInsets = UIEdgeInsets(top: 25, left: -30, bottom: 0, right: 60)
        btn_Web.titleLabel?.font = UIFont.appBoldFont(14)
        
        
        self.contentView.setNeedsLayout()
        self.contentView.layoutIfNeeded()
    }

}

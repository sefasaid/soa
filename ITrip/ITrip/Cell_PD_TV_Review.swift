//
//  Cell_PD_TV_Review.swift
//  ITrip
//
//  Created by Özgün on 25.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//

import UIKit



class Cell_PD_TV_Review: UITableViewCell {
  
    
    var lbl_Name = UILabel()
    var lbl_Date = UILabel()
    var img_User = UIImageView()
    var lbl_Review = UILabel()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
     
        self.selectionStyle = UITableViewCellSelectionStyle.None
        self.setCreateUI()
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setCreateUI(){
    
        
        self.backgroundColor = UIColor.hexColor(0xF5F5F5, alpha: 1.0)
        self.addSubview(img_User)
        img_User.snp_makeConstraints { (make) in
            make.size.equalTo(50)
            make.top.equalTo(self).offset(15)
            make.left.equalTo(self).offset(15)
        }
        img_User.backgroundColor = UIColor.grayColor()
        img_User.layer.cornerRadius = 25
        img_User.layer.masksToBounds = true
        
        
        self.addSubview(lbl_Name)
        lbl_Name.snp_makeConstraints { (make) in
            make.left.equalTo(img_User.snp_right).offset(5)
            make.right.equalTo(self.snp_right)
            make.top.equalTo(self).offset(15)
            make.height.equalTo(25)
        }
        lbl_Name.text = "Orhan Özgün Ergen"
        lbl_Name.font = UIFont.appBoldFont(15)
        lbl_Name.textColor = UIColor.blackColor()
        
        
        self.addSubview(lbl_Date)
        lbl_Date.snp_makeConstraints { (make) in
            make.left.equalTo(img_User.snp_right).offset(5)
            make.right.equalTo(self.snp_right)
            make.top.equalTo(lbl_Name.snp_bottom).offset(3)
            make.height.equalTo(25)
        }
        lbl_Date.text = "22 Nisan 2017 15:15"
        lbl_Date.font = UIFont.appFont(12)
        lbl_Date.textColor = UIColor.flatGrayColor()
        
        
        self.addSubview(lbl_Review)
        lbl_Review.snp_makeConstraints { (make) in
            make.left.equalTo(img_User.snp_right).offset(5)
            make.right.equalTo(self.snp_right).offset(-5)
            make.top.equalTo(lbl_Date.snp_bottom).offset(10)
        }
        lbl_Review.numberOfLines = 0
        lbl_Review.font = UIFont.appFont(12)
        
        
        
        self.contentView.setNeedsLayout()
        self.contentView.layoutIfNeeded()
        
    
    }
    
    
}

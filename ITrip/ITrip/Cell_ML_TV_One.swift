//
//  Cell_MainList.swift
//  ITrip
//
//  Created by osx on 25.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//

import UIKit
import SnapKit


class Cell_ML_TV_One: UITableViewCell {
    
    var img_Place = UIImageView()
    var lbl_Name = UILabel()
    var view_Bottom = UIView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = UITableViewCellSelectionStyle.None
        setCreateUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCreateUI(){
        
        self.addSubview(img_Place)
        img_Place.snp_makeConstraints{(make) in
            make.width.equalTo(self)
            make.height.equalTo(self)
            make.center.equalTo(self)
        }
        img_Place.backgroundColor = UIColor.hexColor(0xFFFFFF)
        
        
        
        
        self.addSubview(view_Bottom)
        view_Bottom.snp_makeConstraints { (make) in
            make.width.equalTo(self)
            make.height.equalTo(self)
            make.bottom.equalTo(self)
        }
        view_Bottom.backgroundColor = UIColor.hexColor(0x000000, alpha: 0.4)
        
        
        self.addSubview(lbl_Name)
        lbl_Name.snp_makeConstraints { (make) in
            make.top.equalTo(self)
            make.bottom.equalTo(self)
            make.right.equalTo(self)
            make.left.equalTo(self)
        }
        lbl_Name.textColor = UIColor.flatWhiteColor()
        lbl_Name.font = UIFont.appBoldFont(22)
        lbl_Name.textAlignment = NSTextAlignment.Center
        
        
        
        
        self.backgroundColor = UIColor.whiteColor()
        
        self.contentView.setNeedsLayout()
        self.contentView.setNeedsDisplay()
        self.contentView.layoutIfNeeded()
        
        
    }

}

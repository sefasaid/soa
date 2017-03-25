//
//  Cell_MainList.swift
//  ITrip
//
//  Created by osx on 25.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//

import UIKit
import SnapKit


class Cell_MainList: UITableViewCell {
    
    var img_Place = UIImageView()
    var PlaceName = UILabel()
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
        
        
        self.addSubview(PlaceName)
        PlaceName.snp_makeConstraints { (make) in
            make.top.equalTo(self)
            make.bottom.equalTo(self)
            make.right.equalTo(self)
            make.left.equalTo(self)
        }
        PlaceName.textColor = UIColor.flatWhiteColor()
        PlaceName.font = UIFont.appBoldFont(22)
        PlaceName.textAlignment = NSTextAlignment.Center
        
        
        
        
        self.backgroundColor = UIColor.whiteColor()
        
        self.contentView.setNeedsLayout()
        self.contentView.setNeedsDisplay()
        self.contentView.layoutIfNeeded()
        
        
    }

}

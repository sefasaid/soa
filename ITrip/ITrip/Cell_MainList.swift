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
    

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
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
        img_Place.backgroundColor = UIColor.grayColor()
        
        self.addSubview(PlaceName)
        PlaceName.snp_makeConstraints { (make) in
            make.width.equalTo(self)
            make.height.equalTo(self).multipliedBy(0.3)
            make.center.equalTo(self)
        }
        PlaceName.text = "Film Adı"
        PlaceName.textColor = UIColor.blackColor()
        PlaceName.textAlignment = NSTextAlignment.Center
        
        
        self.contentView.setNeedsLayout()
        self.contentView.setNeedsDisplay()
        self.contentView.layoutIfNeeded()
        
        
    }

}

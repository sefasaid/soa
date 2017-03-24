//
//  Cell_PlaceDetail_Information.swift
//  ITrip
//
//  Created by Özgün on 25.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//

import UIKit
import FlatColor
import ChameleonFramework




class Cell_PD_TV_Inf: UITableViewCell {
    
    var lbl_Title = UILabel()
    var lbl_Trips = UILabel()
    var lbl_Trips_Count = UILabel()
    var img_Stars = UIImageView()
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        self.selectionStyle = UITableViewCellSelectionStyle.None
        
        self.setCreateUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCreateUI(){
    
        
        self.addSubview(lbl_Title)
        lbl_Title.snp_makeConstraints { (make) in
            make.width.equalTo(self).offset(-15)
            make.left.equalTo(self).offset(15)
            make.top.equalTo(self).offset(10)
            make.height.equalTo(30)
        }
        lbl_Title.text = "AyaSofya Camisi"
        lbl_Title.font = UIFont.appBoldFont(16)
        
        
        //-----
        self.addSubview(lbl_Trips_Count)
        lbl_Trips_Count.snp_makeConstraints { (make) in
            make.top.equalTo(lbl_Title.snp_bottom)
            make.left.equalTo(self).offset(15)
            make.width.equalTo(22)
            make.height.equalTo(20)
        }
        lbl_Trips_Count.text = "4.7"
        lbl_Trips_Count.font = UIFont.appBoldFont(13)
        lbl_Trips_Count.textColor = UIColor.flatYellowColor()
        lbl_Trips_Count.textAlignment = NSTextAlignment.Left
        
        //-----
        self.addSubview(img_Stars)
        img_Stars.snp_makeConstraints { (make) in
            make.width.equalTo(75)
            make.height.equalTo(25)
            make.centerY.equalTo(lbl_Trips_Count)
            make.left.equalTo(lbl_Trips_Count.snp_right).offset(3)
        }
        img_Stars.image = UIImage(named: "stars")
        img_Stars.contentMode = UIViewContentMode.ScaleAspectFit
        //-----
        self.addSubview(lbl_Trips)
        lbl_Trips.snp_makeConstraints { (make) in
            make.width.equalTo(45)
            make.height.equalTo(25)
            make.centerY.equalTo(lbl_Trips_Count)
            make.left.equalTo(img_Stars.snp_right).offset(7)
        }
        lbl_Trips.text = "21 Trips"
        lbl_Trips.textColor = UIColor.flatGrayColor()
        lbl_Trips.font = UIFont.appFont(12)
        
    
    }
    
}

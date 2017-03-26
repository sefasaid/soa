//
//  Cell_FindParticipants.swift
//  ITrip
//
//  Created by Özgün on 26.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//

import UIKit
import SnapKit


class Cell_FindParticipant: UITableViewCell,TagDelegate {
    
    var img_UserProfile     = UIImageView()
    var lbl_UserName        = UILabel()
    var lbl_Message         = UILabel()
    var lbl_UserTags        = UILabel()
    var tags : OOETag!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = UITableViewCellSelectionStyle.None
        
        self.setCreateUI()
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setCreateUI(){
    
        self.addSubview(self.img_UserProfile)
        self.img_UserProfile.frame = CGRect(x: 15, y: 30, width: 60, height: 60)
        self.img_UserProfile.backgroundColor = UIColor.grayColor()
        self.img_UserProfile.layer.masksToBounds = true
        self.img_UserProfile.layer.cornerRadius = 30
        
        
        self.addSubview(lbl_UserName)
        lbl_UserName.snp_makeConstraints { (make) in
            make.left.equalTo(img_UserProfile.snp_right).offset(15)
            make.top.equalTo(self).offset(10)
            make.right.equalTo(self).offset(-10)
            make.height.equalTo(25)
        }
        lbl_UserName.text = "O.Özgün Ergen"
        lbl_UserName.font = UIFont.appBoldFont(14)
        lbl_UserName.textColor = UIColor.flatBlackColor()
        
        
        self.addSubview(lbl_Message)
        lbl_Message.snp_makeConstraints { (make) in
            make.left.equalTo(img_UserProfile.snp_right).offset(15)
            make.top.equalTo(lbl_UserName.snp_bottom).offset(5)
            make.right.equalTo(self).offset(-10)
            make.bottom.equalTo(self).offset(-25)
        }
        lbl_Message.text = "lorem ipsum dolar sit amet lorem ipsum dolar sit amet lorem ipsum dolar sit amet lorem ipsum dolar sit amet lorem ipsum dolar sit amet lorem ipsum dolar sit amet lorem ipsum dolar sit amet lorem ipsum dolar sit amet lorem ipsum dolar sit amet"
        lbl_Message.font = UIFont.appFont(11)
        lbl_Message.textColor = UIColor.flatGrayColor()
        lbl_Message.numberOfLines = 5
        layoutIfNeeded()
        layoutSubviews()
        
        self.tags = OOETag(frame: CGRect(x: 90, y: 95, width: self.frame.width, height: 25), collectionViewLayout: UICollectionViewLayout())
        self.tags.clipsToBounds = false
        self.tags.cellBackGroundColor = 0x3599DB
        self.tags.tagTitleColor = 0x3599DB
        self.tags.OOEdelegate = self
        self.tags.tagStatus = false
        self.tags.setAddTagArray(["merhaba","arkadaş","gezmek","yemek"])
        self.addSubview(self.tags)
        
    }
    
    func returnSelectedTag(tag: [String]) {
        
    }
        
}

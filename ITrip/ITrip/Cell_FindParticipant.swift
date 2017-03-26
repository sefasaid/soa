//
//  Cell_FindParticipants.swift
//  ITrip
//
//  Created by Özgün on 26.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//

import UIKit


class Cell_FindParticipant: UITableViewCell {
    
    var img_UserProfile     = UIImageView()
    var lbl_UserName        = UILabel()
    var lbl_Message         = UILabel()
    var lbl_UserTags        = UILabel()
    
    
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
        
        
    }
        
}

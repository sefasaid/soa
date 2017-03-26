//
//  View_FindParticipant.swift
//  ITrip
//
//  Created by Özgün on 26.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//

import UIKit


class View_FindParticipant:UIView{

    var target : Controller_FindParticipant?
    var tableView = UITableView()
    
    
    init(frame: CGRect,target:Controller_FindParticipant) {
        super.init(frame: frame)
        
        self.target = target
        self.setCreateUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setCreateUI(){
    
    
        self.backgroundColor = UIColor.whiteColor()
        
        self.addSubview(self.tableView)
        self.tableView.snp_makeConstraints { (make) in
            make.width.equalTo(self)
            make.height.equalTo(self)
            make.center.equalTo(self)
        }
        self.tableView.delegate = target
        self.tableView.dataSource = target
        self.tableView.rowHeight = 120
        self.tableView.registerClass(Cell_FindParticipant.self, forCellReuseIdentifier: CELL_FP_TV_ONE)
        self.tableView.backgroundColor = UIColor.whiteColor()
        
        
    }
    

}

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
    
    
        
        
        self.addSubview(self.tableView)
        self.tableView.delegate = target
        self.tableView.dataSource = target
        self.tableView.rowHeight = 120
        self.tableView.registerClass(Cell_FindParticipant.self, forCellReuseIdentifier: CELL_FP_ONE)
        
        
        
    }
    

}

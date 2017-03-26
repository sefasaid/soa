//
//  View_Main.swift
//  ITrip
//
//  Created by osx on 24.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//

import UIKit

class View_MainList: UIView {
    
    var tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(target:Controller_Main){
        self.backgroundColor = UIColor.whiteColor()
        tableView.frame = self.frame
        tableView.registerClass(Cell_ML_TV_One.self, forCellReuseIdentifier: CELL_MV_TB_ONE)
        tableView.rowHeight = self.frame.height/2.3
        tableView.delegate = target
        tableView.dataSource = target
        tableView.backgroundColor = UIColor.whiteColor()
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.addSubview(tableView)
    }
}

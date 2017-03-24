//
//  View_Main.swift
//  ITrip
//
//  Created by osx on 24.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//

import UIKit

class View_Main: UIView {
    
    var table = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(target:Controller_Main){
        self.backgroundColor = UIColor.whiteColor()
        table.frame = self.frame
        table.registerClass(Cell_MainList.self, forCellReuseIdentifier: "Cell_Main_One")
        table.rowHeight = self.frame.height/5
        table.delegate = target
        table.dataSource = target
        
        
        
        self.addSubview(table)
    }
}

//
//  View_PlaceDetail.swift
//  ITrip
//
//  Created by Özgün on 24.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//

import UIKit
import SnapKit


class View_PlaceDetail: UIView {
    
    var target : Controller_PlaceDetail?
    var tableView = UITableView()
    
    
     init(frame: CGRect,target:Controller_PlaceDetail) {
        super.init(frame: frame)
        
        self.target = target
        self.setCreateUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //:MARK - ekrana cizilecek objectlerim
    func setCreateUI(){
        
        
        self.backgroundColor = UIColor.whiteColor()
        
        
        
        self.addSubview(tableView)
        tableView.snp_makeConstraints { (make) in
            make.top.equalTo(self)
            make.bottom.equalTo(self)
            make.left.equalTo(self)
            make.right.equalTo(self)
        }
        tableView.delegate = self.target
        tableView.dataSource = self.target
        tableView.rowHeight = 120
        tableView.registerClass(Cell_PlaceDetail_Inf.self, forCellReuseIdentifier: CELL_PD_INF)
        
        
        
        
    
    }
    
    
}

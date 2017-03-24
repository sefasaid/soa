//
//  Controller_PlaceDetail.swift
//  ITrip
//
//  Created by Özgün on 24.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//

import UIKit


class Controller_PlaceDetail: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var c_View :View_PlaceDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    
        self.c_View = View_PlaceDetail(frame: self.view.frame, target: self)
        self.view.addSubview(self.c_View!)
        
    
    }
    
    
    
    
    //:MARK - TableView DataSource & Delegate
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CELL_PD_INF, forIndexPath: indexPath) as! Cell_PlaceDetail_Inf
        
        
        
        return cell
    }
    
    
    
    
}

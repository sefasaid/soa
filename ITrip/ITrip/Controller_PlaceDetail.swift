//
//  Controller_PlaceDetail.swift
//  ITrip
//
//  Created by Özgün on 24.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//

import UIKit


class Controller_PlaceDetail: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
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
        let cell = tableView.dequeueReusableCellWithIdentifier(CELL_PD_TV_INF, forIndexPath: indexPath) as! Cell_PD_TV_Inf
        
        
        return cell
    }
    
    
    //:MARK - CollectionView DataSource & Delegate
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(CELL_PD_CV_IMAGES, forIndexPath: indexPath) as! Cell_PD_CV_Images
        
        
        return cell
    }
    
    
    
    
}

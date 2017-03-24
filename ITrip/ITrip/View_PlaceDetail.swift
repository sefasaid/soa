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
    //-----
    var tableView = UITableView()
    var collectionView: UICollectionView!

    
    
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
        
        
        
        
        
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: self.frame.width, height: self.frame.height/2.7)
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height/2.7), collectionViewLayout: layout)
        collectionView.dataSource = target
        collectionView.delegate = target
        collectionView.registerClass(Cell_PD_CV_Images.self, forCellWithReuseIdentifier: CELL_PD_CV_IMAGES)
        collectionView.backgroundColor = UIColor.clearColor()
        collectionView.pagingEnabled = true

        
        
        
        
        //----- Draw TableView
        self.addSubview(tableView)
        tableView.snp_makeConstraints { (make) in
            make.top.equalTo(self)
            make.bottom.equalTo(self)
            make.left.equalTo(self)
            make.right.equalTo(self)
        }
        tableView.delegate = self.target
        tableView.dataSource = self.target
        tableView.rowHeight = 70
        tableView.registerClass(Cell_PD_TV_Inf.self, forCellReuseIdentifier: CELL_PD_TV_INF)
        tableView.tableHeaderView = collectionView
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
    
    }
    
    
}

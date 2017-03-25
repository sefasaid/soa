//
//  View_PlaceDetail.swift
//  ITrip
//
//  Created by Özgün on 24.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//

import UIKit
import SnapKit
import MXParallaxHeader

class View_PlaceDetail: UIView {
    
    var target : Controller_PlaceDetail?
    //-----
    var tableView = UITableView()
    var collectionView: UICollectionView!
    var btn_GoAndFind = UIButton()
    var top_View = UIView()
    var lbl_Title = UILabel()
    
    
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
        
        
        
        let view_Header = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height/2.7))
        view_Header.backgroundColor = UIColor.yellowColor()
        view_Header.layoutIfNeeded()
        view_Header.setNeedsLayout()
        view_Header.translatesAutoresizingMaskIntoConstraints = true
        view_Header.autoresizingMask = [UIViewAutoresizing.FlexibleHeight,UIViewAutoresizing.FlexibleWidth]

        
        
        
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
        collectionView.translatesAutoresizingMaskIntoConstraints = true
        collectionView.autoresizingMask = [UIViewAutoresizing.FlexibleHeight,UIViewAutoresizing.FlexibleWidth]
        collectionView.backgroundColor = UIColor.hexColor(0xF9F9F9)
        collectionView.tag = 2
        // view_Header.addSubview(collectionView)
        

        
        
        
        
        //----- Draw TableView
        self.addSubview(tableView)
        tableView.snp_makeConstraints { (make) in
            make.top.equalTo(self).offset(-64)
            make.bottom.equalTo(self)
            make.left.equalTo(self)
            make.right.equalTo(self)
        }
        tableView.delegate = self.target
        tableView.dataSource = self.target
        tableView.rowHeight = 70
        tableView.registerClass(Cell_PD_TV_Inf.self, forCellReuseIdentifier: CELL_PD_TV_INF)
        tableView.registerClass(Cell_PD_TV_Inf_2.self, forCellReuseIdentifier: CELL_PD_TV_INF_2)
        tableView.registerClass(Cell_PD_TV_Review.self, forCellReuseIdentifier: CELL_PD_TV_REVIEW)
        tableView.parallaxHeader.view = collectionView
        tableView.parallaxHeader.height = self.frame.height/2.7;
        tableView.parallaxHeader.mode = MXParallaxHeaderMode.Top
        tableView.parallaxHeader.minimumHeight = 64;
        tableView.contentInset = UIEdgeInsetsMake(CGFloat(self.frame.height/2.7), 0, 128, 0)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.tag = 1
        //-------
        
        self.addSubview(btn_GoAndFind)
        btn_GoAndFind.snp_makeConstraints { (make) in
            make.width.equalTo(self).multipliedBy(0.5)
            make.height.equalTo(64)
            make.centerX.equalTo(self)
            make.bottom.equalTo(self).offset(-30)
        }
        btn_GoAndFind.backgroundColor = UIColor.flatSkyBlueColor()
        btn_GoAndFind.setTitle(localized("btn"), forState: UIControlState.Normal)
        btn_GoAndFind.layer.cornerRadius = self.frame.width/12
        btn_GoAndFind.addTarget(self.target, action: "actionForGoAndFind:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        
        
        
        self.addSubview(top_View)
        top_View.snp_makeConstraints { (make) in
            make.width.equalTo(self)
            make.height.equalTo(64)
            make.top.equalTo(self)
        }
        top_View.backgroundColor = UIColor.hexColor(0xFFFFFF, alpha: 1)
        top_View.layer.shadowColor = UIColor.blackColor().CGColor
        top_View.layer.shadowOpacity = 1
        top_View.layer.shadowOffset = CGSize.zero
        top_View.layer.shadowRadius = 10
        top_View.alpha = 0
        
        
        self.top_View.addSubview(lbl_Title)
        lbl_Title.snp_makeConstraints { (make) in
            make.width.equalTo(self).offset(100)
            make.height.equalTo(64)
            make.top.equalTo(top_View).offset(7.5)
            make.left.equalTo(top_View).offset(85)
        }
        lbl_Title.textColor = UIColor.blackColor()
        lbl_Title.text = "Aya Sofya Camisi"
        lbl_Title.font = UIFont.appBoldFont(25)
        
        
    
    }
    
    
}

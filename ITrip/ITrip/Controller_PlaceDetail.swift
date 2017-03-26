//
//  Controller_PlaceDetail.swift
//  ITrip
//
//  Created by Özgün on 24.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//

import UIKit
import SDWebImage

class Controller_PlaceDetail: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    var c_View :View_PlaceDetail?
    var s_Arr = [String]()
    var place = Place()
    
    init(place:Place){
        super.init(nibName: nil, bundle: nil)
    
        self.place = place
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let btnName = UIButton()
        btnName.setImage(UIImage(named: "left"), forState: .Normal)
        btnName.frame = CGRectMake(0, 0, 30, 30)
        btnName.addTarget(self, action: "actionForLeft:", forControlEvents: .TouchUpInside)
        
        //.... Set Right/Left Bar Button item
        let rightBarButton = UIBarButtonItem()
        rightBarButton.customView = btnName
        self.navigationItem.leftBarButtonItem = rightBarButton
        

        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.translucent = true
        self.navigationController!.view.backgroundColor = UIColor.clearColor()
        self.navigationBackGroundColor(UIColor.clearColor(), tintC: UIColor.whiteColor())
        
        self.navigationController!.navigationBar.topItem!.title = "";
    
        self.c_View = View_PlaceDetail(frame: self.view.frame, target: self)
        self.view.addSubview(self.c_View!)
        self.c_View?.lbl_Title.text = self.place.name
        self.getData()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.translucent = true
        self.navigationController!.view.backgroundColor = UIColor.clearColor()
        
        
        self.navigationBackGroundColor(UIColor.clearColor(), tintC: UIColor.whiteColor())
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        self.navigationController!.navigationBar.setBackgroundImage(nil, forBarMetrics: UIBarMetrics.Default)
        self.navigationController!.navigationBar.shadowImage = nil
        self.navigationController!.navigationBar.translucent = false
    }
    
    //:MARK - Server Connection
    
    func getData(){
    
    RequestConnection.sharedInstance(self).connectionGET("/place/\(self.place.id)", parameter: "?populate=comments", complateBlock: { (json) in
        
            print(json)
            ApiParse.parseComment(self, json: json, complate: { (comment) in
                
                self.place.comments.append(comment)
                
                }, error: { (message) in
                    
                }, end: { 
                    self.c_View?.tableView.reloadData()
                    print("datalar reload oldu",self.place.comments.count)
            })
        
        
        }) { (error) in
            
        }
    
    }
    
    //:MARK - TableView DataSource & Delegate
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return 2
        }else{
            return self.place.comments.count
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        if(indexPath.row == 0 && indexPath.section == 0){
            let cell = tableView.dequeueReusableCellWithIdentifier(CELL_PD_TV_INF, forIndexPath: indexPath) as! Cell_PD_TV_Inf
            cell.lbl_Title.text = place.name
            
            return cell
        }else if(indexPath.row == 1 && indexPath.section == 0){
            let cell = tableView.dequeueReusableCellWithIdentifier(CELL_PD_TV_INF_2, forIndexPath: indexPath) as! Cell_PD_TV_Inf_2
            cell.btn_Map.addTarget(self, action: "actionForMap:", forControlEvents: UIControlEvents.TouchUpInside)
            cell.btn_Call.addTarget(self, action: "actionForCall:", forControlEvents: UIControlEvents.TouchUpInside)
            
            
            return cell
        }else if(indexPath.section == 1){
        
            let cell = tableView.dequeueReusableCellWithIdentifier(CELL_PD_TV_REVIEW, forIndexPath: indexPath) as! Cell_PD_TV_Review
            cell.lbl_Review.text = self.place.comments[indexPath.row].message
            cell.lbl_Name.text = self.place.comments[indexPath.row].user.name
            cell.lbl_Date.text = self.place.comments[indexPath.row].user.register
            cell.img_User.sd_setImageWithURL(NSURL(string: place.comments[indexPath.row].user.picture), placeholderImage: nil, options: SDWebImageOptions.RetryFailed) { (image, err, cache, url) in
                
                
            }

            return cell

        }else{
            return UITableViewCell()
        }
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if(indexPath.section == 1){
            
            
            let height = heightToText(self.place.comments[indexPath.row].message, font: UIFont.appFont(12), width: self.view.frame.width - 75)
            let total = 88 + height
            
            return total
        }else if(indexPath.section == 0){
        
            
            return 70
        }
        return 0
        
    }

    //:MARK - CollectionView DataSource & Delegate
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.place.images.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(CELL_PD_CV_IMAGES, forIndexPath: indexPath) as! Cell_PD_CV_Images
        
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        let cCell = cell as! Cell_PD_CV_Images
        
        cCell.img_BackGround.sd_setImageWithURL(NSURL(string: place.images[indexPath.row]), placeholderImage: nil, options: SDWebImageOptions.RetryFailed) { (image, err, cache, url) in
            
            
        }
    }
    
    //:MARK - Action For Buttons
    
    func actionForGoAndFind(sender:UIButton){
    
        
        self.navigationController?.radialPushViewController(Controller_SendForm(), duration: 0.5, startFrame: CGRect(x: self.view.frame.width/2, y: self.view.frame.height/2, width: 5, height: 5), transitionCompletion: {
            
        })
    }
    
    func actionForCall(sender:UIButton){
        let phone = "tel://905448572632";
        let url:NSURL = NSURL(string:phone)!;
        UIApplication.sharedApplication().openURL(url);
    }
    
    func actionForMap(sender:UIButton){
        let url = "http://maps.apple.com/maps?saddr=\(place.geo.latitude),\(place.geo.longitude)"
        UIApplication.sharedApplication().openURL(NSURL(string:url)!)
    }
    
    func actionForLeft(sender:UIButton){
    
        self.navigationController?.popViewControllerAnimated(true)
    
    }
    
    //:MARK - Scrollview Delegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        print(scrollView.tag)
        var offset           = scrollView.contentOffset.y
        var headerTransform  = CATransform3DIdentity
        var headerTransform2 = CATransform3DIdentity
        
        if (offset < -183 && scrollView.tag == 1) {
            
            headerTransform = CATransform3DTranslate(headerTransform, 1, max(0, offset - 78), 0)
            
            c_View?.lbl_Title.layer.transform = headerTransform
            print("offset---------------------------",offset)
            let mina = min (1.0, (offset + 150)/100)
            print("min------------------------------" ,mina )
            self.c_View?.top_View.alpha = mina
            self.c_View?.lbl_Title.layer.zPosition = 0
            self.c_View?.tableView.layer.zPosition = 0

            

        }
        else if(scrollView.tag == 1) {
            
            // Header -----------
            
            headerTransform = CATransform3DTranslate(headerTransform, 0, max(0, -offset - 78), 0)
            
            c_View?.lbl_Title.layer.transform = headerTransform
            print("offset---------",offset)
            let mina = min (1.0, (offset + 150)/100)
            print("min------------" ,mina )
            self.c_View?.top_View.alpha = mina
            self.c_View?.lbl_Title.layer.zPosition = 0
            self.c_View?.tableView.layer.zPosition = 0

            
        }
        

    }

    
    
    
}

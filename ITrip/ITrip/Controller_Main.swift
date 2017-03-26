//
//  ViewController.swift
//  ITrip
//
//  Created by Özgün on 24.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//

import UIKit
import SDWebImage
import BirdHUD


class Controller_Main: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var arr_Place = [Place]()
    var c_View : View_MainList?
    var blankPage : BlankView!
    var hud = BirdHUD()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.hud.changeText("Yükleniyor")
        
        self.c_View =  View_MainList(frame: self.view.frame)
        c_View!.setup(self)

        self.title = "ITrip"
        self.view.addSubview(c_View!)
        
        blankPage = BlankView(frame: self.view.frame)
        self.getData()

        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationBackGroundColor(UIColor.hexColor(0xFAFAFA, alpha: 1.0), tintC: UIColor.flatBlackColor())
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.flatBlackColor()]
    }
    
    override func viewDidAppear(animated: Bool) {
        self.navigationController!.navigationBar.topItem!.title = "ITrıp";
    }
    
    func getData(){
        
        self.hud.startAnimation(self)
        
        RequestConnection.sharedInstance(self).connectionGET("/place", parameter: "", complateBlock: { (json) in
            
            print(json)
            ApiParse.parsePlace(self, json: json, complate: { (place) in
                
                self.arr_Place.append(place)
                self.isBlankPage()
                }, error: { (message) in
                
                    self.isBlankPage()
                    self.hud.stopAnimation()
                    
                }, end: { 
                    self.c_View?.tableView.reloadData()
                    self.hud.stopAnimation()
                    
            })
            }) { (error) in
                
                self.isBlankPage()
                print(error)
                self.hud.stopAnimation()
                
                
        }
    
    }
    
    func isBlankPage(){
    
        if(self.arr_Place.count == 0){
            
            blankPage!.btn_UserAction.addTarget(self, action: "actionForReload:", forControlEvents: UIControlEvents.TouchUpInside)
            blankPage!.lbl_Title.text = "Gösterilcek Hicbir Veri Yok Tekrar Denemek Istermisin ?"
            blankPage!.btn_UserAction.backgroundColor = UIColor.flatWhiteColor()
            blankPage!.btn_UserAction.setTitleColor(UIColor.flatBlackColor(), forState: UIControlState.Normal)
            self.view.addSubview(blankPage!)
        
        }else{
            self.blankPage!.removeFromSuperview()

        
        }
    
    }
    // TableView Delegate & DataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arr_Place.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
     // 
      let cell = tableView.dequeueReusableCellWithIdentifier(CELL_MV_TB_ONE, forIndexPath: indexPath) as! Cell_ML_TV_One
        
        cell.lbl_Name.text = self.arr_Place[indexPath.row].name
        
        return cell
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let cCell = cell as! Cell_ML_TV_One
        
        
        let url = NSURL(string: self.arr_Place[indexPath.row].images[0])
        cCell.img_Place.sd_setImageWithURL(url, placeholderImage: nil, options: SDWebImageOptions.RetryFailed) { (image, err, cache, url) in
            
            
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detail = Controller_PlaceDetail(place: self.arr_Place[indexPath.row])
        self.navigationController?.radialPushViewController(detail, duration: 0.3, startFrame: CGRect(x: self.view.frame.width/2, y: self.view.frame.height, width: 10, height: 10), transitionCompletion: {
            
        })
        
        self.navigationController?.enableRadialSwipe()
        
    }

    //:MARK - Action For Button
    
    func actionForReload(sender:UIButton){
        
        getData()
    }


}


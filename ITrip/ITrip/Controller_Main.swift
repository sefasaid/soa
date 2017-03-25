//
//  ViewController.swift
//  ITrip
//
//  Created by Özgün on 24.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//

import UIKit
import SDWebImage

class Controller_Main: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var arr_Place = [Place]()
    var MainlistView : View_Main?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         self.MainlistView =  View_Main(frame: self.view.frame)
        MainlistView!.setup(self)

        self.title = "ITrip"
        self.view.addSubview(MainlistView!)
        
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
        
        RequestConnection.sharedInstance(self).connectionGET("/place", parameter: "", complateBlock: { (json) in
            
            print(json)
            ApiParse.parsePlace(self, json: json, complate: { (place) in
                
                self.arr_Place.append(place)
                print("resim geldi")
                
                }, error: { (message) in
                    
                }, end: { 
                    self.MainlistView?.table.reloadData()
                    print("bitti")
            })
            }) { (error) in
                
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
      let cell = tableView.dequeueReusableCellWithIdentifier("Cell_Main_One", forIndexPath: indexPath) as! Cell_MainList
        
        cell.PlaceName.text = self.arr_Place[indexPath.row].name
        
        return cell
    }
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let cCell = cell as! Cell_MainList
        
        
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



}


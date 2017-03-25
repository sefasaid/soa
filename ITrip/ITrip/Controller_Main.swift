//
//  ViewController.swift
//  ITrip
//
//  Created by Özgün on 24.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//

import UIKit

class Controller_Main: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let MainlistView = View_Main(frame: self.view.frame)
        MainlistView.setup(self)
        
        self.title = "ITrip"
        // UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
        
        self.view.addSubview(MainlistView)
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
    
    
    
    // TableView Delegate & DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
     // 
      let cell = tableView.dequeueReusableCellWithIdentifier("Cell_Main_One", forIndexPath: indexPath) as! Cell_MainList
        
        cell.img_Place.image = UIImage(named: "ayasofya-1")
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detail = Controller_PlaceDetail()
        self.navigationController?.pushViewController(detail, animated: true)
    }



}


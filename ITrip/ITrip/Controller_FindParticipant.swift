//
//  Controller_FindParticipant.swift
//  ITrip
//
//  Created by Özgün on 26.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//

import UIKit
import SDWebImage

class Controller_FindParticipant: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    
    var c_View : View_FindParticipant?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Gezmek Istiyenler"
        c_View = View_FindParticipant(frame: self.view.frame, target: self)
        
        self.view.addSubview(c_View!)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    
    //MARK: - TableView DataSource & Delegate
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CELL_FP_TV_ONE, forIndexPath: indexPath) as! Cell_FindParticipant
        
        
        cell.img_UserProfile.sd_setImageWithURL(NSURL(string: "https://avatars1.githubusercontent.com/u/9078907?v=3&u=0e63f118826ddf3e68cbc4c3970c1163007fcb6e&s=400"), placeholderImage: nil, options: SDWebImageOptions.RetryFailed) { (image, err, cache, url) in
            
        }
        
        return cell
    }
    
    
}

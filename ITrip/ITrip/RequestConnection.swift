//
//  RequestConnection.swift
//  ITrip
//
//  Created by Özgün on 25.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//


//
//  RequestConnection.swift
//  requestConnection
//
//  Created by ozgun Mac on 10.02.2016.
//  Copyright © 2016 ozgun Mac. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import CWStatusBarNotification
import ReachabilitySwift


class RequestConnection {
    //MARK:- Connection Variable
    private var serviceURL = String()
    private var servicePort = String()
    private var serviceDomain = String()
    private var serviceVersion = String()
    private var reachability: Reachability?
    private var target : UIViewController!
    
    //MARK:- Connection Instance
    class func sharedInstance(target:UIViewController) -> RequestConnection{
        
        
    
        
        
        let rc = RequestConnection()
        rc.serviceDomain    = configurationApi.domain
        rc.servicePort      = configurationApi.port
        rc.serviceVersion   = configurationApi.version
        rc.serviceURL       = String(format:"%@%@%@", rc.serviceDomain, rc.servicePort, rc.serviceVersion)
        rc.target = target
        
        do {
            rc.reachability = try Reachability.reachabilityForInternetConnection()
        } catch {
            print("Unable to create Reachability")
            
        }
        
        
        return rc
        
    }
    
    //MARK:- Connection POST Function
    func connectionPOST(service:String,parameter:NSDictionary,complateBlock:(json:JSON)->(),errorBlock:(error:NSError)->()){
        
        
        
        let URL = NSURL(string: String(format:"%@/%@", self.serviceURL , service))!
        print("RC POST URL  = \(URL)")
        
        
        if(self.reachability?.isReachable() == true){
            print("baglantı var")
            
            Alamofire.request(.POST, URL, parameters: parameter as? [String : AnyObject]).responseJSON { (response) -> Void in
                
                print("RC POST isFailer \(response.result.isFailure)")
                print("RC POST isSucces \(response.result.isSuccess)")
                if(response.result.value != nil && response.response != nil)
                {
                    
                    if(response.response?.statusCode == 200)
                    {//Server Success response Data
                        complateBlock(json: JSON(response.result.value!))
                    }else
                    {//Error Operation
                        errorBlock(error: response.result.error!)
                    }
                    
                }else
                {//Error Operation
                    errorBlock(error: response.result.error!)
                }
                
            }
        }else{
            
            self.target!.notificationNavigationBar(localized("NO_NET"), backColor: UIColor.flatPinkColor())

        }
    }
    //MARK: Connection GET Function
    func connectionGET(service:String,parameter:String,complateBlock:(json:JSON)->(),errorBlock:(error:NSError)->()){
        
        
        let str = NSString(format:"%@%@%@", self.serviceURL, service,parameter)
        var urlStr : NSString = str.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!

        let URL = NSURL(string: urlStr as String)
        
        print("RC GET URL = \(URL)")

        if(self.reachability?.isReachable() == true){
            print("baglantı var")
            Alamofire.request(.GET, URL!).responseJSON { (response) -> Void in
                
                print("RC GET isFailer \(response.result.isFailure)")
                print("RC GET isSucces \(response.result.isSuccess)")
                
                if(response.result.value != nil && response.response != nil)
                {
                    if(response.response?.statusCode == 200)
                    {//Server Success response Data
                        complateBlock(json: JSON(response.result.value!))
                    }else
                    {//Error Operation
                        errorBlock(error: response.result.error!)
                    }
                    
                }else
                {//Error Operation
                    errorBlock(error: response.result.error!)
                }
            }
        }else{
            self.target!.notificationNavigationBar(localized("NO_NET"), backColor: UIColor.flatPinkColor())
        }
        
    }
    
}


struct configurationApi {
    
    
    static var domain   = String()
    static var port     = String()
    static var version  = String()
    
    
}
//
//  HomeModel.swift
//  EventByte
//
//  Created by Grace Choe on 10/14/18.
//  Copyright © 2018 Grace Choe. All rights reserved.
//

import Foundation
import UIKit

protocol HomeModelProtocol: class {
    func itemsDownloaded(items: NSArray)
}


class HomeModel: NSObject, URLSessionDataDelegate {
    
    //properties
    
    weak var delegate: HomeModelProtocol!
    
    let urlPath = "http://ec2-18-209-35-93.compute-1.amazonaws.com/service.php"
    
    func downloadItems() {
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Failed to download data")
            }else {
                print("Data downloaded")
                self.parseJSON(data!)
            }
            
        }
        
        task.resume()
    }
    
    func parseJSON(_ data:Data) {
        
        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement = NSDictionary()
        let events = NSMutableArray()
        
        for i in 0 ..< jsonResult.count
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let event = EventModel()
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let eventName = jsonElement["EventName"] as? String,
                let eventDate = jsonElement["EventDate"] as? String,
                let eventTime = jsonElement["EventTime"] as? String,
                let eventLocation = jsonElement["EventLocation"] as? String,
                let orgName = jsonElement["OrgName"] as? String,
                let eventDescription = jsonElement["EventDescription"] as? String,
                let orgContact = jsonElement["OrgContact"] as? String
            {
                let eventTime2 = eventTime.prefix(5)
                
                event.eventName = eventName
                event.eventDateTime = eventDate + " " + eventTime2
                event.eventLocation = eventLocation
                event.orgName = orgName
                event.eventDescription = eventDescription
                event.orgContact = orgContact
                
            }
            
            events.add(event)
            
        }
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: events)
            
        })
    }
}


//
//  EventModel.swift
//  EventByte
//
//  Created by Grace Choe on 10/14/18.
//  Copyright © 2018 Grace Choe. All rights reserved.
//

import UIKit
import Foundation

class EventModel: NSObject {
    var eventName: String?
    var eventDateTime: String?
    var eventLocation: String?
    var orgName: String?
    var eventDescription: String?
    var orgContact: String?
    
    override init() {
        
    }
    
    init(eventName: String, eventDateTime: String, eventLocation: String, orgName: String, eventDescription: String, orgContact: String) {
        self.eventName = eventName
        self.eventDateTime = eventDateTime
        self.eventLocation = eventLocation
        self.orgName = orgName
        self.eventDescription = eventDescription
        self.orgContact = orgContact
    }
}

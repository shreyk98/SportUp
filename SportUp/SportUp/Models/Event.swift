//
//  Event.swift
//  SportUp
//
//  Created by Ege Tanboga on 10/7/17.
//  Copyright © 2017 Tanbooz. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot


class Event {
    //create lets for everything
    let eventID: String
    let eventName: String
    let creatorID: String
    let eventSport: String
    let eventLocation: String
    let creatorContact: String
    let emptySpot: Int
    let time: String
    let date: String
    
    init(eventID: String, eventName: String, creatorID: String, eventSport: String, eventLocation: String, creatorContact: String, emptySpot: Int, time: String, date: String) {
        self.eventID = eventID
        self.eventName = eventName
        self.creatorID = creatorID
        self.eventSport = eventSport
        self.eventLocation = eventLocation
        self.creatorContact = creatorContact
        self.emptySpot = emptySpot
        self.time = time
        self.date = date
    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict1 = snapshot.value as? [String : Any],
            let eventName = dict1["name"] as? String,
            let eventSport = dict1["sport"] as? String,
            let eventLocation = dict1["location"] as? String,
            let  emptySpot = dict1["emptySpots"] as? Int,
            let time = dict1["time"] as? String,
            let creatorID = dict1["creator"] as? String,
            let creatorContact = dict1["contact"] as? String,
            let date = dict1["date"] as? String
            else { return nil }
        
        self.eventID = snapshot.key
        self.eventName = eventName
        self.creatorID = creatorID
        self.eventSport = eventSport
        self.eventLocation = eventLocation
        self.creatorContact = creatorContact
        self.emptySpot = emptySpot
        self.time = time
        self.date = date
        
    }
}


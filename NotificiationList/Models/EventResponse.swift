//
//  EventResponse.swift
//  NotificiationList
//
//  Created by Furkan Beyhan on 5.03.2019.
//  Copyright © 2019 Furkan Beyhan. All rights reserved.
//

import Foundation
// YOUR JSON FILE VALUES
class EventResponse : Codable {
    
    let value : EventDetail
    let error : Bool
    let code : Int
    let message : String
    
}

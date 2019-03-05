//
//  Notificiation.swift
//  NotificiationList
//
//  Created by Furkan Beyhan on 2.03.2019.
//  Copyright © 2019 Furkan Beyhan. All rights reserved.
//

import Foundation
// YOUR JSON FILE VALUES
struct Notification : Decodable {
    
    let user : Users
    let message : String
    let transactionTime : String
    let serverTime : String
    let isSeen : Bool
    
}

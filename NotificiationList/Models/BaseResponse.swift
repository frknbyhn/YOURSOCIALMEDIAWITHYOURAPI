//
//  BaseResponse.swift
//  NotificiationList
//
//  Created by Furkan Beyhan on 4.03.2019.
//  Copyright © 2019 Furkan Beyhan. All rights reserved.
//

import Foundation
// YOUR JSON FILE VALUES
class BaseResponse : Codable {
    
    let value : [Base]
    let message : String
    let code : Int
    let error : Bool

}

//
//  NotificationResponse.swift
//  NotificiationList
//
//  Created by Furkan Beyhan on 1.03.2019.
//  Copyright © 2019 Furkan Beyhan. All rights reserved.
//

import Foundation
// YOUR JSON FILE VALUES
struct NotificationResponse: Decodable {
    
    let message: String
    let code: Int
    let error: Bool
    let notifications: [Notification]
    
    enum CodingKeys: String, CodingKey {
        
        case message
        case code
        case error
        case value
        case notifications = "notification"
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        message = try container.decode(String.self, forKey: .message)
        code = try container.decode(Int.self, forKey: .code)
        error = try container.decode(Bool.self, forKey: .error)
        
        let value = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .value)
        
        notifications = try value.decode([Notification].self, forKey: .notifications)
        
        
    }
}

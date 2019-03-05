//
//  NotificationTableViewCell.swift
//  NotificiationList
//
//  Created by Furkan Beyhan on 1.03.2019.
//  Copyright © 2019 Furkan Beyhan. All rights reserved.
//

import UIKit
import Kingfisher

class NotificationTableViewCell: UITableViewCell {

    @IBOutlet weak var userImageView: RoundedImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!





    var notification: Notification? {
        
        didSet {
            guard let notification = notification else { return }
            
            self.userImageView.kf.setImage(with: URL(string: notification.user.imageUrl)!)
            
            self.descriptionLabel.text = notification.message
            
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "yyyy-MM-dd"
//            let date = dateFormatter.date(from: notification.serverTime)            
//            GET DATE OBJECT WITH THIS SITE
//            https://www.nsdateformatter.com date nasıl çevirilir?
//            self.dateLabel.text = notification.
            
        }
    }
}

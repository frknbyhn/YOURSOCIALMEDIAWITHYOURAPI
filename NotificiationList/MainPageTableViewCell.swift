//
//  MainPageTableViewCell.swift
//  NotificiationList
//
//  Created by Furkan Beyhan on 4.03.2019.
//  Copyright © 2019 Furkan Beyhan. All rights reserved.
//

import UIKit
import Kingfisher

class MainPageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImageView: RoundedImageView!
    @IBOutlet weak var activityImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var eventLabel: UILabel!
    
    var mainResponse : Base? {
        
        didSet{
            guard let mainResponse = mainResponse else { return }
        
            self.activityImageView.kf.setImage(with: URL(string: mainResponse.imageUrl)!)
            self.userNameLabel.text = mainResponse.userName
            self.userImageView.kf.setImage(with: URL(string: mainResponse.userAvatarUrl)!)
    
        }
    }

}


    


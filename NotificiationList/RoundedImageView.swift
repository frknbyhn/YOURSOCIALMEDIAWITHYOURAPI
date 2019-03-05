//
//  RoundedImageView.swift
//  NotificiationList
//
//  Created by Furkan Beyhan on 1.03.2019.
//  Copyright © 2019 Furkan Beyhan. All rights reserved.
//

import UIKit

class RoundedImageView: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.clipsToBounds = true
        self.layer.cornerRadius = self.layer.bounds.height / 2
    }
}

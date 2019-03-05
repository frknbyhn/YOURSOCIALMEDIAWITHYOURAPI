//
//  EventDetailViewController.swift
//  NotificiationList
//
//  Created by Furkan Beyhan on 5.03.2019.
//  Copyright © 2019 Furkan Beyhan. All rights reserved.
//

import UIKit
import Kingfisher


class EventDetailViewController: UIViewController {
    
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventDescriptionField: UITextView!
    
    
    private var eventResponse : EventResponse?{
        didSet{
            eventTitle.text = eventResponse?.value.title
            eventDescriptionField.text = eventResponse?.value.eventDescription
            eventImageView.kf.setImage(with: URL(string: (eventResponse?.value.media[0].url)!))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ApiManager.shared.callEventDetail(class: EventResponse.self, success: { (responseObject) in
            if !responseObject.error{
                print(responseObject.message)
                self.eventResponse = responseObject
                return
            }
        }) { (error) in
            print(error.localizedDescription)
        }
    }
}


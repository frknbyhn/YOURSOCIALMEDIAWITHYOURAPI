//
//  ViewController.swift
//  NotificiationList
//
//  Created by Furkan Beyhan on 1.03.2019.
//  Copyright © 2019 Furkan Beyhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    private var notifications: [Notification]? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllNotification()
        
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(UINib(nibName: "NotificationTableViewCell", bundle: nil), forCellReuseIdentifier: "notificationCell")
    }
    
    private func getAllNotification(){
        
        ApiManager.shared.call(class: NotificationResponse.self, success: { (responseObject) in
        
            if !responseObject.error {
                print(responseObject.message)
                self.notifications = responseObject.notifications
                return
            }
            
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notifications?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? NotificationTableViewCell,
            let notification = self.notifications?[indexPath.row] else { return }
        
        cell.notification = notification
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "notificationCell", for: indexPath) as? NotificationTableViewCell else { return UITableViewCell() }
        return cell
    }
    
    
}

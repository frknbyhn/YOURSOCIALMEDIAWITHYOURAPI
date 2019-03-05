//
//  MainPageViewController.swift
//  NotificiationList
//
//  Created by Furkan Beyhan on 4.03.2019.
//  Copyright © 2019 Furkan Beyhan. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    private var mainResponse : BaseResponse? {
        didSet{
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMainPageData()
        
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(UINib(nibName: "MainPageTableViewCell", bundle: nil), forCellReuseIdentifier: "mainPageCell")
        
        
    }
    
   
    
    private func getMainPageData(){
        
        ApiManager.shared.callHomeFeed(class: BaseResponse.self, success: { (responseObject) in
            if !responseObject.error{
                print(responseObject.message)
                self.mainResponse = responseObject
                return
            }

        }) { (error) in
            print(error.localizedDescription)
        }
        
    }
    
    
    
    
    
}

extension MainPageViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mainResponse?.value.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let cell = cell as? MainPageTableViewCell, let response = self.mainResponse?.value[indexPath.row] else { return }
        
        cell.mainResponse = response
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "mainPageCell", for: indexPath) as? MainPageTableViewCell else { return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
    
}
    



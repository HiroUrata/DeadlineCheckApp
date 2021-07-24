//
//  TodayListViewController.swift
//  DeadlineCheckApp
//
//  Created by UrataHiroki on 2021/07/16.
//

import UIKit

class TodayListViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
        
    }
    

}


extension TodayListViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 115
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

//        let cellTodayProductLabel = cell.contentView.viewWithTag(1) as! UILabel
//        let cellTodayJANLabel = cell.contentView.viewWithTag(2) as! UILabel
//        let cellTodayDeadlineLabel = cell.contentView.viewWithTag(3) as! UILabel

        
        cell.layer.cornerRadius = 20.0

        return cell
    }
    
}
    
    
    
    


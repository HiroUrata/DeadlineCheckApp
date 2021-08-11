//
//  SearchResultViewController.swift
//  DeadlineCheckApp
//
//  Created by UrataHiroki on 2021/08/04.
//

import UIKit

class SearchResultViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let realmCRUDModel = RealmCRUDModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       
        
    }
    

}


extension SearchResultViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return realmCRUDModel.filterReadRealmArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let cellSearchProductLabel = cell.contentView.viewWithTag(1) as! UILabel
        let cellSearchJANLabel = cell.contentView.viewWithTag(2) as! UILabel
        let cellSearchDeadlineLabel = cell.contentView.viewWithTag(3) as! UILabel
        
        cellSearchProductLabel.text = realmCRUDModel.filterReadRealmArray[indexPath.row]["filterRealmProductName"]
        cellSearchJANLabel.text = realmCRUDModel.filterReadRealmArray[indexPath.row]["filterRealmJANCode"]
        cellSearchDeadlineLabel.text = realmCRUDModel.filterReadRealmArray[indexPath.row]["filterRealmDeadlineDay"]
        
        return cell
    }
 
    
}

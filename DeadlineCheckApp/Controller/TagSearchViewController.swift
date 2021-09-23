//
//  TagSearchViewController.swift
//  DeadlineCheckApp
//
//  Created by UrataHiroki on 2021/08/16.
//

import UIKit

class TagSearchViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    
    let realmCRUDModel = RealmCRUDModel()
    let segmentedControl = SegmentedControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        segmentedControl.createSegment(targetView: self.view)
        segmentedControl.uiSegmentControl.addTarget(self, action: #selector(tagSearch), for: .valueChanged)
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    @objc func tagSearch(sender:UISegmentedControl){
        
        realmCRUDModel.filterTagReadRealm(selectTag: segmentedControl.realmCRUDModel.realmTagArray[sender.selectedSegmentIndex])

    }
  
}


extension TagSearchViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 115
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return realmCRUDModel.filterTagReadResultArray.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let cellTodayProductLabel = cell.contentView.viewWithTag(1) as! UILabel
        let cellTodayJANLabel = cell.contentView.viewWithTag(2) as! UILabel
        let cellTodayDeadlineLabel = cell.contentView.viewWithTag(3) as! UILabel
        
        cellTodayProductLabel.text = realmCRUDModel.filterTagReadResultArray[indexPath.row]["RealmProductName"]
        cellTodayJANLabel.text = realmCRUDModel.filterTagReadResultArray[indexPath.row]["RealmJANCode"]
        cellTodayDeadlineLabel.text = realmCRUDModel.filterTagReadResultArray[indexPath.row]["RealmDeadlineDay"]
        
        cell.layer.cornerRadius = 20.0
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.white.cgColor

        return cell
    }
    
}



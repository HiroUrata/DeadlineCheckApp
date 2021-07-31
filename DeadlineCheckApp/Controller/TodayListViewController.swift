//
//  T/Users/uratahiroki/Desktop/EverydayIosApp/DeadlineCheckApp/DeadlineCheckApp/Controller/TodayListViewController.swiftodayListViewController.swift
//  DeadlineCheckApp
//
//  Created by UrataHiroki on 2021/07/16.
//

import UIKit

class TodayListViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    let realmCRUDModel = RealmCRUDModel()
    let getDateModel = GetDateModel()
    let segmentedControl = SegmentedControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
        self.getDateModel.todayGetDate()
        print(self.getDateModel.todayDate)
        segmentedControl.createSegment(targetView: self.view)
        realmCRUDModel.filterDayReadRealm(selectDay: getDateModel.todayDate, targetView: self)
    }
    

}


extension TodayListViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 115
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return realmCRUDModel.filterTodayReadRealmArray.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let cellTodayProductLabel = cell.contentView.viewWithTag(1) as! UILabel
        let cellTodayJANLabel = cell.contentView.viewWithTag(2) as! UILabel
        let cellTodayDeadlineLabel = cell.contentView.viewWithTag(3) as! UILabel
        
        cellTodayProductLabel.text = realmCRUDModel.filterTodayReadRealmArray[indexPath.row]["RealmProductName"]
        cellTodayJANLabel.text = realmCRUDModel.filterTodayReadRealmArray[indexPath.row]["RealmJANCode"]
        cellTodayDeadlineLabel.text = realmCRUDModel.filterTodayReadRealmArray[indexPath.row]["RealmDeadlineDay"]
        
        cell.layer.cornerRadius = 20.0
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.white.cgColor

        return cell
    }
    
}
    


    


    
    


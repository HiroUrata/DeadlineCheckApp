//
//  ViewController.swift
//  DeadlineCheckApp
//
//  Created by UrataHiroki on 2021/07/16.
//

import UIKit
import FSCalendar
import CalculateCalendarLogic


class ViewController: UIViewController{
    

    @IBOutlet weak var calendarView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    
    let calendar = Calendar()
    let realmCRUDModel = RealmCRUDModel()
    let getDateModel = GetDateModel()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.calendar.fsClendar.delegate = self
        self.calendar.fsClendar.dataSource = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.getDateModel.todayGetDate()
        
        self.realmCRUDModel.filterDayReadRealm(selectDay: self.getDateModel.todayDate, targetView: self)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.layer.cornerRadius = 20.0
        
        self.tableView.layer.shadowOffset = CGSize(width: 10, height: 10)
        self.tableView.layer.shadowOpacity = 0.5
        self.tableView.layer.shadowRadius = 7
        self.tableView.layer.masksToBounds = false
        
        
        self.calendarView.layer.cornerRadius = 20.0
        
        self.calendarView.layer.shadowOffset = CGSize(width: 10, height: 10)
        self.calendarView.layer.shadowOpacity = 0.5
        self.calendarView.layer.shadowRadius = 7
        
        self.calendar.createCalendar(targetView: self.calendarView)
        
        self.tableView.reloadData()
        
    }
    
}


extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        self.tableView.layer.masksToBounds = true
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        self.tableView.layer.masksToBounds = false
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 115
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let cellProductLabel = cell.contentView.viewWithTag(1) as! UILabel
        let cellJANLabel = cell.contentView.viewWithTag(2) as! UILabel
        let cellDeadlineLabel = cell.contentView.viewWithTag(3) as! UILabel
        
        cellProductLabel.text = self.realmCRUDModel.selectDayReadRealmArray[indexPath.row]["RealmProductName"]
        cellJANLabel.text = self.realmCRUDModel.selectDayReadRealmArray[indexPath.row]["RealmJANCode"]
        cellDeadlineLabel.text = self.realmCRUDModel.selectDayReadRealmArray[indexPath.row]["RealmDeadlineDay"]
        
        cell.layer.cornerRadius = 20.0
        
        return cell
    }
    
}


extension ViewController:FSCalendarDelegate,FSCalendarDataSource,FSCalendarDelegateAppearance{
    
}

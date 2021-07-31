//
//  ViewController.swift
//  DeadlineCheckApp
//
//  Created by UrataHiroki on 2021/07/16.
//

import UIKit
import FSCalendar
import CalculateCalendarLogic


class ViewController: UIViewController,FSCalendarDelegate,FSCalendarDataSource,FSCalendarDelegateAppearance{
    

    @IBOutlet weak var calendarView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    
    let calendarModel = CalendarModel()
    let realmCRUDModel = RealmCRUDModel()
    let alert = Alert()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.calendarModel.fsClendar.delegate = self
        self.calendarModel.fsClendar.dataSource = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
        
        self.tableView.layer.cornerRadius = 20.0
        
        self.tableView.layer.shadowOffset = CGSize(width: 10, height: 10)
        self.tableView.layer.shadowOpacity = 0.5
        self.tableView.layer.shadowRadius = 7
        self.tableView.layer.masksToBounds = false
        
        
        self.calendarView.layer.cornerRadius = 20.0
        
        self.calendarView.layer.shadowOffset = CGSize(width: 10, height: 10)
        self.calendarView.layer.shadowOpacity = 0.5
        self.calendarView.layer.shadowRadius = 7
        
        self.calendarModel.createCalendar(targetView: self.calendarView)
        
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
        
    return 135
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.realmCRUDModel.selectDayReadRealmArray.count
        
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


extension ViewController{
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        
        if calendarModel.judgePublicHoliday(date: date){
            
            return UIColor.red
            
        }
        
        if calendarModel.getWeek(date: date) == 1 {
            
            return UIColor.red
            
        }else if calendarModel.getWeek(date: date) == 7{
            
            return UIColor.blue
            
        }
        
        return nil
    }
    
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        let convertDate = Calendar(identifier: .gregorian)
        let year = convertDate.component(.year, from: date)
        let month = convertDate.component(.month, from: date)
        let day = convertDate.component(.day, from: date)
        
        self.realmCRUDModel.filterDayReadRealm(selectDay: "\(year)年\(month)月\(day)日", targetView: self)
        
        let slideVC = HalfView()
        slideVC.getSelectDay = "\(year)年\(month)月\(day)日"
        slideVC.modalPresentationStyle = .custom
        slideVC.transitioningDelegate = self
        self.present(slideVC, animated: true, completion: nil)        
    
     }
    
    
}


extension ViewController: UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        PresentationController(presentedViewController: presented, presenting: presenting)
        
    }
}

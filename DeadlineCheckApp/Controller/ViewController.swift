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
    @IBOutlet weak var tableViewOnView: UIView!
    
    
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
        
        
        self.tableViewOnView.layer.cornerRadius = 20.0
        
        self.tableViewOnView.layer.shadowOffset = CGSize(width: 10, height: 10)
        self.tableViewOnView.layer.shadowOpacity = 0.5
        self.tableViewOnView.layer.shadowRadius = 7
        
        self.tableView.layer.cornerRadius = 20.0
        
        self.calendarView.layer.cornerRadius = 20.0
        self.calendarView.layer.shadowOffset = CGSize(width: 10, height: 10)
        self.calendarView.layer.shadowOpacity = 0.5
        self.calendarView.layer.shadowRadius = 7
        
        self.tableView.backgroundColor = UIColor(red: 1.0, green: 0.40, blue: 0.51, alpha: 1.0)
        
        self.calendarModel.createCalendar(targetView: self.calendarView)
        
    }
    
    
    
}


extension ViewController:UITableViewDelegate,UITableViewDataSource{
    

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
    return 135
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.realmCRUDModel.filterSignUpDayReadArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let cellProductLabel = cell.contentView.viewWithTag(1) as! UILabel
        let cellJANLabel = cell.contentView.viewWithTag(2) as! UILabel
        let cellDeadlineLabel = cell.contentView.viewWithTag(3) as! UILabel

        cellProductLabel.text = self.realmCRUDModel.filterSignUpDayReadArray[indexPath.row]["filterRealmProductName"]
        cellJANLabel.text = self.realmCRUDModel.filterSignUpDayReadArray[indexPath.row]["filterRealmJANCode"]
        cellDeadlineLabel.text = self.realmCRUDModel.filterSignUpDayReadArray[indexPath.row]["filterRealmDeadlineDay"]

        cell.layer.cornerRadius = 20.0
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor(red: 1.0, green: 0.40, blue: 0.51, alpha: 1.0).cgColor
        cell.backgroundColor = .white //UIColor(red: 1.0, green: 0.40, blue: 0.51, alpha: 1.0)
        
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

        let slideVC = HalfView()

        if month < 10 && day < 10{

            self.realmCRUDModel.filterSignUpDayReadRealm(SignUpDay: "\(year)/\("0" + String(month))/\("0" + String(day))", targetView: self)
            slideVC.getSelectDay = "\(year)/\("0" + String(month))/\("0" + String(day))"

        }else if month < 10{

            self.realmCRUDModel.filterSignUpDayReadRealm(SignUpDay: "\(year)/\("0" + String(month))/\(day)", targetView: self)
            slideVC.getSelectDay = "\(year)/\("0" + String(month))/\(day)"

        }else if day < 10{

            self.realmCRUDModel.filterSignUpDayReadRealm(SignUpDay: "\(year)/\("0" + String(month))/\(day)", targetView: self)
            slideVC.getSelectDay = "\(year)/\("0" + String(month))/\(day)"

        }else{

            self.realmCRUDModel.filterSignUpDayReadRealm(SignUpDay: "\(year)/\(month)/\(day)", targetView: self)
            slideVC.getSelectDay = "\(year)/\(month)/\(day)"
        }
        
        self.tableView.reloadData()
        
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

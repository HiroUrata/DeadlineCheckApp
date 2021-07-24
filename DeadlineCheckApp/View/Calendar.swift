//
//  Calendar.swift
//  DeadlineCheckApp
//
//  Created by UrataHiroki on 2021/07/16.
//

import Foundation
import FSCalendar
import CalculateCalendarLogic

class CalendarModel:UIViewController{
    
    
    let fsClendar = FSCalendar()
    
    fileprivate let gregorian:Calendar  = Calendar(identifier: .gregorian)
    
    fileprivate lazy var dateFormatter:DateFormatter = {
       
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        return formatter
    }()
    
    
    func createCalendar(targetView:UIView){
        
        self.fsClendar.frame = CGRect(x: targetView.bounds.minX, y: targetView.bounds.minY, width: targetView.frame.size.width, height: targetView.frame.size.height)
        
        
        targetView.addSubview(self.fsClendar)
        
    }
    
}

extension CalendarModel{

    //祝日なのか調べる
    func judgePublicHoliday(date:Date) -> Bool {
        
        let judgeCalendar = Calendar(identifier: .gregorian)
        let year = judgeCalendar.component(.year, from: date)
        let month = judgeCalendar.component(.month, from: date)
        let day = judgeCalendar.component(.day, from: date)
        
        let calculateCalendarLogic = CalculateCalendarLogic()
        
        return calculateCalendarLogic.judgeJapaneseHoliday(year: year, month: month, day: day)
        
    }
    
    
    func getYMDInt(date:Date) -> (Int,Int,Int){
        
        let judgeCalendar = Calendar(identifier: .gregorian)
        let year = judgeCalendar.component(.year, from: date)
        let month = judgeCalendar.component(.month, from: date)
        let day = judgeCalendar.component(.day, from: date)
        
        return (year,month,day)
        
    }
    
    
    func getWeek(date:Date) -> Int {
        
        let judgeCalendar = Calendar(identifier: .gregorian)
        
        return judgeCalendar.component(.weekday, from: date)
        
    }
    
    
}


//
//  Calendar.swift
//  DeadlineCheckApp
//
//  Created by UrataHiroki on 2021/07/16.
//

import Foundation
import FSCalendar
import CalculateCalendarLogic

class Calendar:UIViewController{
    
    
    let fsClendar = FSCalendar()
    
    
    func createCalendar(targetView:UIView){
        
        self.fsClendar.frame = CGRect(x: targetView.bounds.minX, y: targetView.bounds.minY, width: targetView.frame.size.width, height: targetView.frame.size.height)
        
        
        targetView.addSubview(self.fsClendar)
        
    }
    
}

extension Calendar{
    
    
    
}

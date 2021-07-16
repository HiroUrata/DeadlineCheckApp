//
//  GetDateModel.swift
//  DeadlineCheckApp
//
//  Created by UrataHiroki on 2021/07/16.
//

import Foundation


class GetDateModel{
    
    var todayDate = String()
    
    func todayGetDate(){
        
        let dateformatter = DateFormatter()
        dateformatter.timeStyle = .none
        dateformatter.dateStyle = .long
        dateformatter.locale = Locale(identifier: "ja_JP")
        self.todayDate = dateformatter.string(from: Date())
        
    }
    
}

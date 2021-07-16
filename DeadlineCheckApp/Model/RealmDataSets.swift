//
//  RealmDataSets.swift
//  DeadlineCheckApp
//
//  Created by UrataHiroki on 2021/07/16.
//

import Foundation
import RealmSwift


class RealmDataSets:Object{
    
    @objc dynamic var productName = String()
    @objc dynamic var janCode = String()
    @objc dynamic var deadlineDay = String()
    
}

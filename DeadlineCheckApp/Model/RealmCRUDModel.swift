//
//  RealmCRUDModel.swift
//  DeadlineCheckApp
//
//  Created by UrataHiroki on 2021/07/16.
//

import Foundation
import UIKit
import RealmSwift

class RealmCRUDModel{
    
    let alert = Alert()
    
    var selectDayReadRealmArray:[[String:String]] = []
    var filterReadRealmArray:[[String:String]] = []
    
}


extension RealmCRUDModel{
    
    func createRealm(createProductName:String,createJANCode:String,createDeadlineDay:String,createTag:String){
        
        do{
            let realm = try Realm()
            let realmDataSets = RealmDataSets()
            
            realmDataSets.productName = createProductName
            realmDataSets.janCode = createJANCode
            realmDataSets.deadlineDay = createDeadlineDay
            realmDataSets.tag = createTag
            
            try realm.write({
                
                realm.add(realmDataSets)
                
            })
            
        }catch{
            
//            self.alert.createAlert(messageContents: "保存", alertTargetView: targetView)
            
        }
        
    }
    
}


extension RealmCRUDModel{
    
    func filterTagReadRealm(selectTag:String){
        
        do{
            let realm = try Realm()
            self.selectDayReadRealmArray = []
            
            for readRealm in realm.objects(RealmDataSets.self).filter("tag == selectTag"){
                
                self.selectDayReadRealmArray.append(["RealmProductName":readRealm.productName,
                                                     "RealmJANCode":readRealm.janCode,
                                                     "RealmDeadlineDay":readRealm.deadlineDay])
                
            }
            
            
        }catch{
            
            
            
        }
        
    }
    
}


extension RealmCRUDModel{
    
    func filterDayReadRealm(selectDay:String,targetView:UIViewController){
        
        do{
            let realm = try Realm()
            self.selectDayReadRealmArray = []
            
            for readRealm in realm.objects(RealmDataSets.self).filter("deadlineDay == selectDay"){
                
                self.selectDayReadRealmArray.append(["RealmProductName":readRealm.productName,
                                                     "RealmJANCode":readRealm.janCode,
                                                     "RealmDeadlineDay":readRealm.deadlineDay])
                
            }
            
            
        }catch{
            
            self.alert.createAlert(messageContents: "読み込み", alertTargetView: targetView)
            
        }
        
    }
    
}



extension RealmCRUDModel{
    
    func filterReadRealm(searchKeyProductName:String,searchKeyJANCode:String,searchKeyDeadlineDay:String,targetView:UIViewController){
        
        do{
            let realm = try Realm()
            
            if (searchKeyProductName.isEmpty && searchKeyJANCode.isEmpty && searchKeyDeadlineDay.isEmpty) != true{  //全て値有り
                
                self.filterReadRealmArray = []
                
                for readRealm in realm.objects(RealmDataSets.self).filter("productName == searchKeyProductName && janCode == searchKeyJANCode && deadlineDay == searchKeyDeadlineDay"){
                    
                    self.filterReadRealmArray.append(["filterRealmProductName":readRealm.productName,
                                                      "filterRealmJANCode":readRealm.janCode,
                                                      "filterRealmDeadlineDay":readRealm.deadlineDay])
                    
                }
                
            }else if (searchKeyProductName.isEmpty && searchKeyJANCode.isEmpty) != true && searchKeyDeadlineDay.isEmpty == true{ //ProductとJANCodeが値有り
                
                for readRealm in realm.objects(RealmDataSets.self).filter("productName == searchKeyProductName && janCode == searchKeyJANCode"){
                    
                    self.filterReadRealmArray.append(["filterRealmProductName":readRealm.productName,
                                                      "filterRealmJANCode":readRealm.janCode,
                                                      "filterRealmDeadlineDay":readRealm.deadlineDay])
                    
                }
        
            }else if (searchKeyProductName.isEmpty && searchKeyDeadlineDay.isEmpty) != true && searchKeyJANCode.isEmpty == true{  //ProductとDeadlineDayが値有り
                
                for readRealm in realm.objects(RealmDataSets.self).filter("productName == searchKeyProductName && deadlineDay == searchKeyDeadlineDay"){
                    
                    self.filterReadRealmArray.append(["filterRealmProductName":readRealm.productName,
                                                      "filterRealmJANCode":readRealm.janCode,
                                                      "filterRealmDeadlineDay":readRealm.deadlineDay])
                
                }
            
            }else if (searchKeyJANCode.isEmpty && searchKeyDeadlineDay.isEmpty) != true && searchKeyProductName.isEmpty == true{  //JANCodeとDeadlineDayが値有り
                
                for readRealm in realm.objects(RealmDataSets.self).filter("janCode == searchKeyJANCode && deadlineDay == searchKeyDeadlineDay"){
                    
                    self.filterReadRealmArray.append(["filterRealmProductName":readRealm.productName,
                                                      "filterRealmJANCode":readRealm.janCode,
                                                      "filterRealmDeadlineDay":readRealm.deadlineDay])
                
                }
            
            }else if (searchKeyProductName.isEmpty && searchKeyJANCode.isEmpty) == true && searchKeyDeadlineDay.isEmpty != true{ //ProductとJANCodeが値無し
                
                for readRealm in realm.objects(RealmDataSets.self).filter("deadlineDay == searchKeyDeadlineDay"){
                    
                    self.filterReadRealmArray.append(["filterRealmProductName":readRealm.productName,
                                                      "filterRealmJANCode":readRealm.janCode,
                                                      "filterRealmDeadlineDay":readRealm.deadlineDay])
                    
                }
                
            }else if (searchKeyProductName.isEmpty && searchKeyDeadlineDay.isEmpty) == true && searchKeyJANCode.isEmpty != true{  //ProductとDeadlineDayが値無し
                
                for readRealm in realm.objects(RealmDataSets.self).filter("janCode == searchKeyJANCode"){
                    
                    self.filterReadRealmArray.append(["filterRealmProductName":readRealm.productName,
                                                      "filterRealmJANCode":readRealm.janCode,
                                                      "filterRealmDeadlineDay":readRealm.deadlineDay])
                
                }
            
            }else if (searchKeyJANCode.isEmpty && searchKeyDeadlineDay.isEmpty) == true && searchKeyProductName.isEmpty != true{  //JANCodeとDeadlineDayが値無し
                
                for readRealm in realm.objects(RealmDataSets.self).filter("productName == searchKeyProductName"){
                    
                    self.filterReadRealmArray.append(["filterRealmProductName":readRealm.productName,
                                                      "filterRealmJANCode":readRealm.janCode,
                                                      "filterRealmDeadlineDay":readRealm.deadlineDay])
                
                }
            
            }else if (searchKeyProductName.isEmpty && searchKeyJANCode.isEmpty && searchKeyDeadlineDay.isEmpty) == true{  //全て値無し
                
                self.alert.createAlert(messageContents: "読み込み", alertTargetView: targetView)
                
            }else{
                
                self.alert.createAlert(messageContents: "読み込み", alertTargetView: targetView)
                
            }
            
        }catch{
            
            self.alert.createAlert(messageContents: "読み込み", alertTargetView: targetView)
            
        }
        
    }
    
}



extension RealmCRUDModel{
    
    func updateRealm(updateProductName:String,updateJANCode:String,updateDeadlineDay:String,updateTag:String,selectCell:Int,targetView:UIViewController){
        
        do{
            let realm = try Realm()
            let readResultRealm = realm.objects(RealmDataSets.self)
            let updateRealmArray = [updateProductName,updateJANCode,updateDeadlineDay,updateTag]
            
            var realmDatasArray = [readResultRealm[selectCell].productName,
                                   readResultRealm[selectCell].janCode,
                                   readResultRealm[selectCell].deadlineDay,
                                   readResultRealm[selectCell].tag]
            
            
            try realm.write({
                
                for updateContentsCount in 0...updateRealmArray.count - 1{
                    
                updateRealmArray.forEach({
            
                    if $0 == updateRealmArray[updateContentsCount] && $0.count >= 1{
                        
                        realmDatasArray[updateContentsCount] = $0
                        
                       }
                   
                })}
                
            })
     
        }catch{
            
            self.alert.createAlert(messageContents: "更新", alertTargetView: targetView)
            
        }
        
    }
    
}


extension RealmCRUDModel{
    
    func cellDeleteRealm(selectDay:String,selectCell:Int,targetView:UIViewController){
        
        do{
            let realm = try Realm()
            
            try realm.write({
            
                realm.delete(realm.objects(RealmDataSets.self).filter("deadlineDay == selectDay")[selectCell])
                
                self.filterDayReadRealm(selectDay: selectDay, targetView: targetView)
                
            })
            
        }catch{
            
            self.alert.createAlert(messageContents: "削除", alertTargetView: targetView)
            
        }
        
    }
    
}


extension RealmCRUDModel{
    
    func allDeleteRealm(selectDeadlineDay:String,targetView:UIViewController){
        
        do{
           let realm = try Realm()
            
            try realm.write({
                
                realm.delete(realm.objects(RealmDataSets.self).filter("deadlineDay == selectDeadlineDay"))

                
            })
            
        }catch{
            
            self.alert.createAlert(messageContents: "削除", alertTargetView: targetView)
            
        }
        
    }
    
}

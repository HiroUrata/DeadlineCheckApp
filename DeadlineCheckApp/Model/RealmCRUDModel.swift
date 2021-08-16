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
    var filterTagReadResultArray:[[String:String]] = []
    var filterReadRealmArray:[[String:String]] = []
    var filterTodayReadRealmArray:[[String:String]] = []
    var filterSignUpDayReadArray:[[String:String]] = []
    var realmTagArray = [String]()
    
}
                        

extension RealmCRUDModel{
    
    func createRealm(createProductName:String,createJANCode:String,createDeadlineDay:String,createSignUpDay:String,createTag:String,targetView:UIViewController){
        
        do{
            let realm = try Realm()
            let realmDataSets = RealmDataSets()
            
            realmDataSets.productName = createProductName
            realmDataSets.janCode = createJANCode
            realmDataSets.deadlineDay = createDeadlineDay
            realmDataSets.signUpDay = createSignUpDay
            realmDataSets.tag = createTag
            
            
            try realm.write({
                
                realm.add(realmDataSets)
                
            })
            
        }catch{
            
            self.alert.createAlert(messageContents: "保存", alertTargetView: targetView)
            
        }
        
    }
    
}

extension RealmCRUDModel{ //segmentのtitleと検索時に使用
    
    func readRealmTag(){
        
        do{
            let realm = try Realm()
            realmTagArray = []
            
            for readRealmTag in realm.objects(RealmDataSets.self){
                
                if realmTagArray.allSatisfy({$0 != readRealmTag.tag}) == true{
                    
                    realmTagArray.append(readRealmTag.tag)
                    
                }
               
            }
            
        }catch{
            
            
        }
    }
    
}


extension RealmCRUDModel{
    
    func filterTagReadRealm(selectTag:String){
        
        do{
            let realm = try Realm()
            self.filterTagReadResultArray = []
            
            realm.objects(RealmDataSets.self).filter("tag == '\(selectTag)'").forEach({
                
                self.filterTagReadResultArray.append(["RealmProductName":$0.productName,
                                                      "RealmJANCode":$0.janCode,
                                                      "RealmDeadlineDay":$0.deadlineDay])
                
            })
            
        }catch{
            
            
        }
    }
}


extension RealmCRUDModel{
    
    func filterDayReadRealm(selectDay:String,targetView:UIViewController){
        
        do{
            let realm = try Realm()
            self.filterTodayReadRealmArray = []
            
            for readRealm in realm.objects(RealmDataSets.self).filter("deadlineDay == '\(selectDay)'"){
                                
                self.filterTodayReadRealmArray.append(["RealmProductName":readRealm.productName,
                                                       "RealmJANCode":readRealm.janCode,
                                                       "RealmDeadlineDay":readRealm.deadlineDay])
                    
            }
    
        }catch{
            
            self.alert.createAlert(messageContents: "読み込み", alertTargetView: targetView)
            
        }
        
    }
    
}


extension RealmCRUDModel{
    
    func filterSignUpDayReadRealm(SignUpDay:String,targetView:UIViewController){
        
        do{
            let realm = try Realm()
            self.filterSignUpDayReadArray = []
            
            for readRealm in realm.objects(RealmDataSets.self).filter("signUpDay == '\(SignUpDay)'"){
                
                self.filterSignUpDayReadArray.append(["filterRealmProductName":readRealm.productName,
                                                      "filterRealmJANCode":readRealm.janCode,
                                                      "filterRealmDeadlineDay":readRealm.deadlineDay])
                
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
            filterReadRealmArray = []
            
            switch (searchKeyProductName.isEmpty, searchKeyJANCode.isEmpty, searchKeyDeadlineDay.isEmpty){
             
            case (false, false, false):
                
                for readRealm in realm.objects(RealmDataSets.self).filter(NSPredicate(format: "productName == %@", searchKeyProductName)).filter(NSPredicate(format: "janCode == %@", searchKeyJANCode)).filter(NSPredicate(format: "deadlineDay == %@", searchKeyDeadlineDay)){
                    
                    self.filterReadRealmArray.append(["filterRealmProductName":readRealm.productName,
                                                      "filterRealmJANCode":readRealm.janCode,
                                                      "filterRealmDeadlineDay":readRealm.deadlineDay])
                    print("1")
                }
                
            case(false,false,true):
                
                for readRealm in realm.objects(RealmDataSets.self).filter(NSPredicate(format: "productName == %@",searchKeyProductName)).filter(NSPredicate(format: "janCode == %@", searchKeyJANCode)){
                    
                    self.filterReadRealmArray.append(["filterRealmProductName":readRealm.productName,
                                                      "filterRealmJANCode":readRealm.janCode,
                                                      "filterRealmDeadlineDay":readRealm.deadlineDay])
                    print("2")
                }
                
            case(false,true,false):
                
                for readRealm in realm.objects(RealmDataSets.self).filter(NSPredicate(format: "productName == %@", searchKeyProductName)).filter(NSPredicate(format: "deadlineDay == %@", searchKeyDeadlineDay)){
                    
                    self.filterReadRealmArray.append(["filterRealmProductName":readRealm.productName,
                                                      "filterRealmJANCode":readRealm.janCode,
                                                      "filterRealmDeadlineDay":readRealm.deadlineDay])
                    print("3")
                }
                
            case(true,false,false):
                
                for readRealm in realm.objects(RealmDataSets.self).filter(NSPredicate(format: "janCode == %@", searchKeyJANCode)).filter(NSPredicate(format: "deadlineDay == %@", searchKeyDeadlineDay)){
                    
                    self.filterReadRealmArray.append(["filterRealmProductName":readRealm.productName,
                                                      "filterRealmJANCode":readRealm.janCode,
                                                      "filterRealmDeadlineDay":readRealm.deadlineDay])
                    print("4")
                }
                
            case(true,true,false):
                
                for readRealm in realm.objects(RealmDataSets.self).filter(NSPredicate(format: "deadlineDay == %@", searchKeyDeadlineDay)){
                    
                    self.filterReadRealmArray.append(["filterRealmProductName":readRealm.productName,
                                                      "filterRealmJANCode":readRealm.janCode,
                                                      "filterRealmDeadlineDay":readRealm.deadlineDay])
                    print("5")
                }
                
            case(true,false,true):
                
                for readRealm in realm.objects(RealmDataSets.self).filter(NSPredicate(format: "janCode == %@", searchKeyJANCode)){
                    
                    self.filterReadRealmArray.append(["filterRealmProductName":readRealm.productName,
                                                      "filterRealmJANCode":readRealm.janCode,
                                                      "filterRealmDeadlineDay":readRealm.deadlineDay])
                    print("6")
                }
                
            case(false,true,true):
                
                for readRealm in realm.objects(RealmDataSets.self).filter(NSPredicate(format: "productName == %@", searchKeyProductName)){
                    
                    self.filterReadRealmArray.append(["filterRealmProductName":readRealm.productName,
                                                      "filterRealmJANCode":readRealm.janCode,
                                                      "filterRealmDeadlineDay":readRealm.deadlineDay])
                    print("7")
                }
                
            case(true,true,true):
                self.alert.createAlert(messageContents: "読み込み", alertTargetView: targetView)
                
            }

        }catch{
            
            self.alert.createAlert(messageContents: "読み込み", alertTargetView: targetView)
            print("10")
        }
        
        print(filterReadRealmArray)
        print("11")
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

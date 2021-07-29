//
//  Alert.swift
//  DeadlineCheckApp
//
//  Created by UrataHiroki on 2021/07/16.
//

import Foundation
import UIKit

class Alert{
    
    
    
    func createAlert(messageContents:String,alertTargetView:UIViewController){
        
        let alert = UIAlertController(title: "ERROR", message: "データの\(messageContents)に失敗しました", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        alertTargetView.present(alert, animated: true, completion: nil)
        
    }
    
}

extension Alert{
    
    
    
    func showTextFieldAlert(whereCell:Int,targetView:UIViewController){
        
        let realmCRUDModel = RealmCRUDModel()
        
        var productNameTextField:UITextField?
        var janCodeTextField:UITextField?
        var deadlineDayTextField:UITextField?
        var tagTextField:UITextField?

        let alert = UIAlertController(title: "データを追加", message:"データを追加する場合は、値を入力して下さい", preferredStyle: .alert)

        alert.addTextField { (alertProductNameTextField:UITextField) in

            alertProductNameTextField.placeholder = "商品名"
            productNameTextField = alertProductNameTextField

        }

        alert.addTextField { (alertJANCodeTextField:UITextField) in

            alertJANCodeTextField.placeholder = "JANコード"
            janCodeTextField = alertJANCodeTextField

        }
        
        alert.addTextField { (alertDeadlineDayTextField:UITextField) in

            alertDeadlineDayTextField.placeholder = "期限 例:2021年1月1日" 
            deadlineDayTextField = alertDeadlineDayTextField

        }
        
        alert.addTextField { (alertTagTextField:UITextField) in

            alertTagTextField.placeholder = "商品の分類 例:食品"
            tagTextField = alertTagTextField

        }
         
        alert.addAction(UIAlertAction(title: "キャンセル", style: .default, handler: nil))
        
        alert.addAction(UIAlertAction(title: "追加", style: .default, handler: { _ in

            realmCRUDModel.updateRealm(updateProductName: (productNameTextField?.text)!, updateJANCode: (janCodeTextField?.text)!, updateDeadlineDay: (deadlineDayTextField?.text)!, updateTag: (tagTextField?.text)!, selectCell: whereCell, targetView: targetView)
            
         }))

        targetView.present(alert, animated: true, completion: nil)

    }
        
}
    






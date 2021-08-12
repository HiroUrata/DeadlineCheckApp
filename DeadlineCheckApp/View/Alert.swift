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
//            alertProductNameTextField.layer.borderWidth = 5.0
//            alertProductNameTextField.layer.borderColor = UIColor(red: 1.0, green: 0.40, blue: 0.51, alpha: 1.0).cgColor
//            alertProductNameTextField.borderStyle = .roundedRect
//            alertProductNameTextField.clearButtonMode = .whileEditing
            productNameTextField = alertProductNameTextField

        }

        alert.addTextField { (alertJANCodeTextField:UITextField) in

            alertJANCodeTextField.placeholder = "JANコード"
//            alertJANCodeTextField.layer.borderWidth = 1.0
//            alertJANCodeTextField.layer.borderColor = UIColor(red: 1.0, green: 0.40, blue: 0.51, alpha: 1.0).cgColor
//            alertJANCodeTextField.borderStyle = .roundedRect
//            alertJANCodeTextField.clearButtonMode = .always
            janCodeTextField = alertJANCodeTextField

        }
        
        alert.addTextField { (alertDeadlineDayTextField:UITextField) in

            alertDeadlineDayTextField.placeholder = "期限 例:2021/01/01"
//            alertDeadlineDayTextField.layer.borderWidth = 1.0
//            alertDeadlineDayTextField.layer.borderColor = UIColor(red: 1.0, green: 0.40, blue: 0.51, alpha: 1.0).cgColor
//            alertDeadlineDayTextField.borderStyle = .roundedRect
//            alertDeadlineDayTextField.clearButtonMode = .always
//            alertDeadlineDayTextField.addTarget(self, action: #selector(self.addSlash), for: .allEditingEvents)
            deadlineDayTextField = alertDeadlineDayTextField

        }
        
        alert.addTextField { (alertTagTextField:UITextField) in

            alertTagTextField.placeholder = "商品の分類 例:食品"
            alertTagTextField.layer.borderWidth = 1.0
            alertTagTextField.layer.borderColor = UIColor(red: 1.0, green: 0.40, blue: 0.51, alpha: 1.0).cgColor
            alertTagTextField.borderStyle = .roundedRect
            alertTagTextField.clearButtonMode = .always
            tagTextField = alertTagTextField

        }
         
        alert.addAction(UIAlertAction(title: "キャンセル", style: .default, handler: nil))
        
        alert.addAction(UIAlertAction(title: "追加", style: .default, handler: { _ in

            realmCRUDModel.updateRealm(updateProductName: (productNameTextField?.text)!, updateJANCode: (janCodeTextField?.text)!, updateDeadlineDay: (deadlineDayTextField?.text)!, updateTag: (tagTextField?.text)!, selectCell: whereCell, targetView: targetView)
            
         }))

        targetView.present(alert, animated: true, completion: nil)

    }
    
    @objc func addSlash(sender:UITextField){

        if sender.text?.count == 4{

            sender.text = sender.text! + "/"

        }else if sender.text?.count == 7{

            sender.text = sender.text! + "/"

        }

    }
        
}
    






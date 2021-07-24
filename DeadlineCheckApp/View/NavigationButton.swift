//
//  NavigationButton.swift
//  DeadlineCheckApp
//
//  Created by UrataHiroki on 2021/07/24.
//

import Foundation
import UIKit

class NavigationButton:UIViewController{
    
    var navigationRightAddButton = UIBarButtonItem() //インスタンス作成

    let realmCRUDModel = RealmCRUDModel()
    
}


extension NavigationButton{
    
    func createNavigationButton(targetView:UIViewController){
        
        navigationRightAddButton = UIBarButtonItem(barButtonSystemItem: .add, target: targetView, action: #selector(showAddAlert(_:)))
    
        targetView.navigationItem.rightBarButtonItem = navigationRightAddButton
        
      
        
    }
    
    @objc func showAddAlert(_ sender: UIBarButtonItem){
        
        var productNameTextField:UITextField?
        var janCodeTextField:UITextField?
        var deadlineDayTextField:UITextField?

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

            alertDeadlineDayTextField.placeholder = "期限 例:2021年01月01日"
            deadlineDayTextField = alertDeadlineDayTextField

        }

        alert.addAction(UIAlertAction(title: "キャンセル", style: .default, handler: nil))
        
        alert.addAction(UIAlertAction(title: "追加", style: .default, handler: { _ in

            self.realmCRUDModel.createRealm(createProductName: (productNameTextField?.text)!, createJANCode: (janCodeTextField?.text)!, createDeadlineDay: (deadlineDayTextField?.text)!)

         }))

         present(alert, animated: true, completion: nil)

    }
        
}



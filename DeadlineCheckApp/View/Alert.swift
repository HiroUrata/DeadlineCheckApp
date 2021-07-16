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





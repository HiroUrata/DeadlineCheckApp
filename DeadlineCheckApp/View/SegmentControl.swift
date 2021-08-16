//
//  SegmentControl.swift
//  DeadlineCheckApp
//
//  Created by UrataHiroki on 2021/07/29.
//

import Foundation
import UIKit

class SegmentedControl{

    var uiSegmentControl = UISegmentedControl()
        
    let realmCRUDModel = RealmCRUDModel()
    
}

extension SegmentedControl{
    
    func createSegment(targetView:UIView){
        
        realmCRUDModel.readRealmTag()
        
        uiSegmentControl.removeAllSegments()
        
        if realmCRUDModel.realmTagArray.count != 0{
        
           for segmentCount in 0...realmCRUDModel.realmTagArray.count - 1{
         
                uiSegmentControl.insertSegment(withTitle: realmCRUDModel.realmTagArray[segmentCount], at: segmentCount, animated: true)
                
           }
        }
        
        uiSegmentControl.frame = CGRect(x: targetView.bounds.minX + 5, y: targetView.bounds.minY + 97, width: targetView.frame.size.width - 10, height: 32)
        
        uiSegmentControl.selectedSegmentTintColor = UIColor(red: 1.0, green: 0.40, blue: 0.51, alpha: 1.0)
        
        uiSegmentControl.addTarget(self, action: #selector(tagSearch), for: .valueChanged)
        
        targetView.addSubview(uiSegmentControl)
    }
    
    @objc func tagSearch(sender:UISegmentedControl){
        
        realmCRUDModel.filterTagReadRealm(selectTag: realmCRUDModel.realmTagArray[sender.selectedSegmentIndex])
        print(realmCRUDModel.filterTagReadResultArray)
    }
    
}


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
        
        for segmentCount in 0...realmCRUDModel.realmTagArray.count - 1{
         
            uiSegmentControl.insertSegment(withTitle: realmCRUDModel.realmTagArray[segmentCount], at: segmentCount, animated: true)
            
        }
        
        uiSegmentControl.frame = CGRect(x: targetView.bounds.minX + 5, y: targetView.bounds.minY + 97, width: targetView.frame.size.width - 10, height: 32)
        
        targetView.addSubview(uiSegmentControl)
    }
    
}


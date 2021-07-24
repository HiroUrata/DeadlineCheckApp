//
//  TabBarController.swift
//  DeadlineCheckApp
//
//  Created by UrataHiroki on 2021/07/24.
//

import UIKit

class TabBarController: UITabBarController {

    
    let navigationButton = NavigationButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationButton.createNavigationButton(targetView: self)
    
    }
    
    
   

}

//
//  TabBarController.swift
//  DeadlineCheckApp
//
//  Created by UrataHiroki on 2021/08/11.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showSearchAlert)),
                                                   UIBarButtonItem(title: "Today", style: .done, target: self, action: #selector(showTodayList))]
        
    }
    
    @objc func showSearchAlert(){



    }

    @objc func showTodayList(){



    }

    

}

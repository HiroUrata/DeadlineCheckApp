//
//  TabBarController.swift
//  DeadlineCheckApp
//
//  Created by UrataHiroki on 2021/08/11.
//

import UIKit

class TabBarController: UITabBarController {
    
    var howHiddenBool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //tabBar.barTintColor =  UIColor(red: 1.0, green: 0.40, blue: 0.51, alpha: 1.0)  //.blackもいい感じ
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .white
        tabBar.barStyle = .black //barTintColorを使わない
        
        tabBar.layer.masksToBounds = true
        tabBar.layer.cornerRadius = 20.0

        navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showSearchAlert)),
                                                   UIBarButtonItem(title: "Today", style: .done, target: self, action: #selector(showTodayList))]
        
    }
    
    @objc func showSearchAlert(){
        
        if howHiddenBool == true {
            
            UITabBar.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {self.tabBar.frame.origin.y = self.tabBar.frame.origin.y + self.tabBar.frame.size.height}, completion: nil)
            howHiddenBool = false
            
        }else if howHiddenBool == false{
            
            UITabBar.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {self.tabBar.frame.origin.y = self.tabBar.frame.origin.y - self.tabBar.frame.size.height}, completion: nil)
            howHiddenBool = true
            
        }
        


    }

    @objc func showTodayList(){



    }

    

}

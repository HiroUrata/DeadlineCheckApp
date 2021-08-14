//
//  SearchViewController.swift
//  DeadlineCheckApp
//
//  Created by UrataHiroki on 2021/07/16.
//

import UIKit

class SearchViewController: UIViewController{

    @IBOutlet weak var productTextField: UITextField!
    @IBOutlet weak var janTextField: UITextField!
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    let realmCRUDModel = RealmCRUDModel()
    let alert = Alert()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       
        
        
        
    }
    
    @IBAction func search(_ sender: Any) {
        
        realmCRUDModel.filterReadRealm(searchKeyProductName: productTextField.text!, searchKeyJANCode: janTextField.text!, searchKeyDeadlineDay: dayTextField.text!, targetView: self)

        let srVC = storyboard?.instantiateViewController(identifier: "SRVC") as! SearchResultViewController
        self.navigationController?.pushViewController(srVC, animated: true)
        srVC.filterReadResultArray = realmCRUDModel.filterReadRealmArray
   
       
    }
    
   
}


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
        
        dayTextField.addTarget(self, action: #selector(addSlash), for: .editingChanged)
        
        
        
    }
    
    @objc func addSlash(sender:UITextField){
        
        if sender.text?.count == 4{
         
            sender.text = sender.text! + "/"
            
        }else if sender.text?.count == 7{
            
            sender.text = sender.text! + "/"
            
        }else if sender.text?.count == 10{
            
            print(sender.text?.components(separatedBy: "/") as Any)
            
            if Int((sender.text?.components(separatedBy: "/")[1])!)! > 12 {
                
                alert.warningAlert(messageContents: "月", alertTargetView: self)
                sender.text = ""
                
            }else if Int((sender.text?.components(separatedBy: "/")[2])!)! > 31{
                
                alert.warningAlert(messageContents: "日付", alertTargetView: self)
                sender.text = ""
                
            }
        }
        
    }
    
    @IBAction func search(_ sender: Any) {
        
        realmCRUDModel.filterReadRealm(searchKeyProductName: productTextField.text!, searchKeyJANCode: janTextField.text!, searchKeyDeadlineDay: dayTextField.text!, targetView: self)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
            let srVC = self.storyboard?.instantiateViewController(identifier: "SRVC") as! SearchResultViewController
            self.navigationController?.pushViewController(srVC, animated: true)
            srVC.filterReadResultArray = self.realmCRUDModel.filterReadRealmArray
            
        }
   
       
    }
    
   
}


//
//  HalfViewProgram.swift
//  createHalfView
//
//  Created by UrataHiroki on 2021/07/02.
//


import UIKit

class HalfView:UIViewController{
    
    @IBOutlet weak var productNameTextField: UITextField!
    @IBOutlet weak var janCodeTextField: UITextField!
    @IBOutlet weak var deadlineDayTextField: UITextField!
    @IBOutlet weak var tagTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    let realmCRUDModel = RealmCRUDModel()
    
    var hasSetPointOrigin = false
    var pointOrigin: CGPoint?
    var getSelectDay = String()
       
    override func viewDidLoad() {
           super.viewDidLoad()
        
        deadlineDayTextField.delegate = self
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerAction))
        view.addGestureRecognizer(panGesture)
        
        deadlineDayTextField.addTarget(self, action: #selector(addYearMonthDay), for: .allEditingEvents)
           
       }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        signUpButton.layer.cornerRadius = 20.0
        signUpButton.layer.borderColor = UIColor.white.cgColor
        signUpButton.layer.borderWidth = 1.0
        
    }
       
       override func viewDidLayoutSubviews() {
        
           if !hasSetPointOrigin {
            
               hasSetPointOrigin = true
               pointOrigin = self.view.frame.origin
            
           }
       }
    
    
       @objc func panGestureRecognizerAction(sender: UIPanGestureRecognizer) {
        
           let translation = sender.translation(in: view)
           
           guard translation.y >= 0 else { return }
           
           view.frame.origin = CGPoint(x: 0, y: self.pointOrigin!.y + translation.y)
           
           if sender.state == .ended {
            
               let dragVelocity = sender.velocity(in: view)
               if dragVelocity.y >= 1300 {
                
                   self.dismiss(animated: true, completion: nil)
                
               }else{
                  
                   UIView.animate(withDuration: 0.3) {
                    
                       self.view.frame.origin = self.pointOrigin ?? CGPoint(x: 0, y: 400)
                    
                   }
               }
           }
       }
    
    @objc func addYearMonthDay(_ sender:UITextField){
        
        if sender.text?.count == 4{
            
            sender.text = sender.text! + "/"
            
        }else if sender.text?.count == 7{
            
            sender.text = sender.text! + "/"
            
        }
        
    }
    
    
    @IBAction func signUp(_ sender: Any) {
        
        if (productNameTextField.text!.isEmpty && janCodeTextField.text!.isEmpty && deadlineDayTextField.text!.isEmpty && tagTextField.text!.isEmpty) != true{
            
            realmCRUDModel.createRealm(createProductName: productNameTextField.text!, createJANCode: janCodeTextField.text!, createDeadlineDay: deadlineDayTextField.text!, createSignUpDay: getSelectDay, createTag: tagTextField.text!, targetView: self)
            
            realmCRUDModel.filterDayReadRealm(selectDay: getSelectDay, targetView: self)
            
        }
        
        
        
    }
    
}

extension HalfView:UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if (deadlineDayTextField.text! as NSString).replacingCharacters(in: range, with: string).count <= 10{
            
            return true
            
        }
        
        return false
        
    }
    
    
}

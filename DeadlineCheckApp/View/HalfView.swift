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
       
       override func viewDidLoad() {
           super.viewDidLoad()
           let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerAction))
           view.addGestureRecognizer(panGesture)
           
           
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
                
               } else {
                  
                   UIView.animate(withDuration: 0.3) {
                    
                       self.view.frame.origin = self.pointOrigin ?? CGPoint(x: 0, y: 400)
                    
                   }
               }
           }
       }
    
    @IBAction func signUp(_ sender: Any) {
        
        if (productNameTextField.text!.isEmpty && janCodeTextField.text!.isEmpty && deadlineDayTextField.text!.isEmpty && tagTextField.text!.isEmpty) != true{
            
            realmCRUDModel.createRealm(createProductName: productNameTextField.text!, createJANCode: janCodeTextField.text!, createDeadlineDay: deadlineDayTextField.text!, createTag: tagTextField.text!, targetView: self)
            
        }
        
        
        
    }
    
}

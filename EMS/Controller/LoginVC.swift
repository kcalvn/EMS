//
//  ViewController.swift
//  EMS
//
//  Created by Kevin C on 1/4/18.
//  Copyright © 2018 KevinC. All rights reserved.
//

import UIKit

class LoginVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTF: CustomTextField!
    @IBOutlet weak var passwordTF: CustomTextField!
    var activeTextField: UITextField!
    
    @IBOutlet weak var signInBTN: CustomUIButton!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var loginStackView: UIStackView!
    
    var keyboardSize : CGSize!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let center: NotificationCenter = NotificationCenter.default
        center.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        center.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.singleTap(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        contentView.addGestureRecognizer(tapGesture)
        contentView.isUserInteractionEnabled = true
  
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc func singleTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    @objc func keyboardWillShow(notification: Notification) {
      
        let info:NSDictionary = notification.userInfo! as NSDictionary
        self.keyboardSize = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
        moveUp()
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        moveDown()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        logUserIn()
        return true
    }

    @IBAction func signInAction(_ sender: UIButton) {
        view.endEditing(true)
        logUserIn()
    }
    
    @IBAction func forgotPasswordAction(_ sender: UIButton) {
    }
    
    func moveUp(){
        if view.frame.origin.y == 0 {
            let textFeldOriginBottom = loginStackView!.frame.origin.y + loginStackView.frame.height
            let position = view.frame.height - textFeldOriginBottom
            let offset = position - keyboardSize!.height
            if offset < 0 {
                var frame = view.frame
                frame.origin.y = offset - 8
                UIView.animate(withDuration: 0.28, animations: { () -> Void in
                    self.view.frame = frame
                })
            }
        }
    }
    
    func moveDown(){
        if view.frame.origin.y != 0 {
            var frame = self.view.frame
            frame.origin.y = 0
            UIView.animate(withDuration: 0.28, animations: { () -> Void in
                self.view.frame = frame
            })
        }
    }
    
    func logUserIn() {
        if (self.usernameTF.text == "user@user.com") && (self.passwordTF.text == "user123") {
            infoDialog(title: "", message: "Welcome yow")
        }else {
            errorDiaglog(title: "", message: "Please enter a valid username and password.")
        }
    }
    
    func errorDiaglog(title: String, message: String){
        
        let appearance = SCLAlertView.SCLAppearance(
            showCircularIcon: true,
            buttonCornerRadius: 18.0
        )
        
        let alertView = SCLAlertView(appearance: appearance)
        alertView.showError(title, subTitle: message, closeButtonTitle: "Ok", colorStyle: 0xdd1c1a)
    }
    
    func infoDialog(title:String, message:String) {
        let appearance = SCLAlertView.SCLAppearance(
            showCircularIcon: true,
            buttonCornerRadius: 18.0
        )
        
        let alertView = SCLAlertView(appearance: appearance)
        alertView.showInfo(title, subTitle: message, closeButtonTitle: "Ok", colorStyle: 0x04BBBF)
    }
}

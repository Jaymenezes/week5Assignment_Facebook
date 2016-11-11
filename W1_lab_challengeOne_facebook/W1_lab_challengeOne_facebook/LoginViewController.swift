//
//  LoginViewController.swift
//  W1_lab_challengeOne_facebook
//
//  Created by user on 10/20/16.
//  Copyright © 2016 Jean. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var initialY: CGFloat!
    var offSetLogin: CGFloat!
    var offSetLogo: CGFloat!
    var offSetLabel: CGFloat!
    
    
    @IBOutlet weak var labelSuperView: UIView!
    @IBOutlet weak var logoSuperView: UIView!
    @IBOutlet weak var loginSuperView: UIView!
    @IBOutlet weak var logoFacebook: UIImageView!
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        let frame = (Notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        //        initialY = view.frame.origin.y
        offSetLogin = 50
        offSetLogo = 20
        offSetLabel = 300
        
        delay(0.5) {
            NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (notification: Notification) in
                let frame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
                
                
                
                self.loginSuperView.frame.origin.y = self.self.loginSuperView.frame.origin.y - self.offSetLogin
                
                self.logoFacebook.frame.origin.y = self.self.logoFacebook.frame.origin.y - self.offSetLogo
                
                self.labelSuperView.frame.origin.y = self.labelSuperView.frame.origin.y - self.offSetLabel
            }
        }
        
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            delay(0.25) {
                self.loginSuperView.frame.origin.y = self.self.loginSuperView.frame.origin.y + self.offSetLogin
                
                self.logoFacebook.frame.origin.y = self.self.logoFacebook.frame.origin.y + self.offSetLogo
                
                self.labelSuperView.frame.origin.y = self.labelSuperView.frame.origin.y + self.offSetLabel
                
            }
            
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressLogin(_ sender: AnyObject) {
        loginIndicator.startAnimating()
        loginButton.isSelected = true
        
        if loginTextField.text == "Codepath" && passwordTextField.text == "Awesome" {
            delay(2, closure: { () -> () in
                self.loginButton.isSelected = false
                self.loginIndicator.stopAnimating()
                
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            })
            
            // Code that runs if both email and password match the text we are looking for in each case
        } else {
            delay(2, closure: { () -> () in
                self.loginButton.isSelected = false
                self.loginIndicator.stopAnimating()
                let alertController = UIAlertController(title: "Invalid email/password", message: "Please try again", preferredStyle: .alert)
                
                let cancelAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
                    
                }
                alertController.addAction(cancelAction)
                
                self.present(alertController, animated: true) {
                    
                    // optional code for what happens after the alert controller has finished presenting
                }
                
                
                
            })
            
            // Code that runs if either the email or password do NOT match the text we are looking for in each case
        }
    }
    
    @IBAction func onTapGesture(_ sender: AnyObject) {
        view.endEditing(true)
        
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

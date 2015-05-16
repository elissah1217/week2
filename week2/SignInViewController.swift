//
//  SignInViewController.swift
//  week2
//
//  Created by Hsin Yi Huang on 5/12/15.
//  Copyright (c) 2015 Hsin Yi Huang. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var textfieldView: UIView!
    var scrollViewOrigY = CGFloat()
    var ctaViewOrigY = CGFloat()
    
    @IBOutlet weak var ctaView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollViewOrigY = scrollView.center.y
        ctaViewOrigY = ctaView.center.y
        scrollView.contentSize = CGSize(width:320, height:549)
        scrollView.delegate = self
        textfieldView.alpha = 0;
        textfieldView.transform = CGAffineTransformMakeScale(0.5, 0.5)
        UIView.animateWithDuration(0.8, animations: {
            self.textfieldView.transform = CGAffineTransformMakeScale(1, 1)
            self.textfieldView.alpha = 1;
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func textfieldPressed(sender: AnyObject) {
        
        UIView.animateWithDuration(0.3, animations: {
            //self.loginImageView.center.y = 30
            
            self.ctaView.center.y = 380
            self.scrollView.center.y = 180
        })
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {

        if scrollView.contentOffset.y < -10{
            closeKeyboard(scrollView)
        }
        //contentoffset
    }// any offset changes
    
 
    
    

    @IBAction func closeKeyboard(sender: AnyObject) {
        view.endEditing(true)
        
        UIView.animateWithDuration(0.3, animations: {
            self.ctaView.center.y = self.ctaViewOrigY
            self.scrollView.center.y = self.scrollViewOrigY
        })
        
    }
    
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    

    
    @IBAction func signInButtonPressed(sender: AnyObject) {
        if emailField.text.isEmpty{
            println("is empty")
            var alertView = UIAlertView(title: "Email Required", message: "Please enter your email address", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        }
        else if passwordField.text.isEmpty{
            var alertView = UIAlertView(title: "Password Required", message: "Please enter your password", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
            
        }
        else{
            
            if emailField.text == "tim@thecodepath.com" && passwordField.text == "password"{
                var alertView = UIAlertView(title: "Signing in", message: "", delegate: self, cancelButtonTitle:nil)
                alertView.show()
                delay(2, { () -> () in
                    alertView.dismissWithClickedButtonIndex(0, animated: true)
                    self.performSegueWithIdentifier("signInSegue", sender: nil)
                    
                })
            }
            else{
                var signinView = UIAlertView(title: "Signing in", message: "", delegate: self, cancelButtonTitle:nil)
                signinView.show()
                delay(2, { () -> () in
                    signinView.dismissWithClickedButtonIndex(0, animated: true)
                    var alertView = UIAlertView(title: "Sign In Failed", message: "Incorrect email or password", delegate: self, cancelButtonTitle: "OK")
                    alertView.show()
                    
                })
                
            }
            
            
           
        }
        
    }
    

}

//
//  CreateAccountViewController.swift
//  week2
//
//  Created by Hsin Yi Huang on 5/14/15.
//  Copyright (c) 2015 Hsin Yi Huang. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var ctaView: UIView!
    
    @IBOutlet weak var createButton: UIButton!
    
    @IBOutlet weak var firstnameField: UITextField!
    @IBOutlet weak var lastnameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var textfieldView: UIView!
    
    @IBOutlet weak var passwordImage1: UIImageView!
    @IBOutlet weak var passwordImage2: UIImageView!
    @IBOutlet weak var passwordImage3: UIImageView!
    @IBOutlet weak var passwordImage4: UIImageView!
    
    
    @IBOutlet weak var termButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        println(textfieldView.center.y)
        scrollview.delegate = self
        createButton.enabled = false
        scrollview.contentSize = CGSize(width:320, height:569)
        passwordImage1.alpha = 0
        passwordImage2.alpha = 0
        passwordImage3.alpha = 0
        passwordImage4.alpha = 0
        // Do any additional setup after loading the view.
        textfieldView.alpha = 0
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
            self.ctaView.center.y = 380
            self.scrollview.center.y = 210
            self.textfieldView.center.y = 220
        })
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        if scrollview.contentOffset.y < -10{
            closeKeyboard(scrollView)
            
        }
        
    }// any offset changes
    

    
  
    
    @IBAction func onEditing(sender: AnyObject) {
        passwordImage1.alpha = 0
        passwordImage2.alpha = 0
        passwordImage3.alpha = 0
        passwordImage4.alpha = 0
        
        if !passwordField.text.isEmpty{
            if(countElements(passwordField.text)<=3){
                passwordImage1.alpha = 1
            }
            else if(countElements(passwordField.text)<=6){
                passwordImage2.alpha = 1
            }
            else if(countElements(passwordField.text)<=9){
                passwordImage3.alpha = 1
            }
            else if(countElements(passwordField.text)>9){
                passwordImage4.alpha = 1
            }
        }
        

        
        
        if firstnameField.text.isEmpty || lastnameField.text.isEmpty || emailField.text.isEmpty || passwordField.text.isEmpty || !termButton.selected{
            createButton.enabled = false
        }
        else{
            createButton.enabled = true
        }
        
    }
    
    

    @IBAction func closeKeyboard(sender: AnyObject) {
        view.endEditing(true)
        println("close keyboard")
        UIView.animateWithDuration(0.3, animations: {
            self.ctaView.center.y = 512
            self.scrollview.center.y = 284
            self.textfieldView.center.y = 263.5
        })
        
    }
    
    
    @IBAction func termButtonPressed(sender: AnyObject) {
        termButton.selected = !termButton.selected
        onEditing(sender)
    }
    
    
    @IBAction func termViewButtonPressed(sender: AnyObject) {
        closeKeyboard(sender)
    }
    
    @IBAction func createButtonPressed(sender: AnyObject) {
        var alertView = UIAlertView(title: "Signing in", message: "", delegate: self, cancelButtonTitle:nil)
        alertView.show()
        delay(2, { () -> () in
            alertView.dismissWithClickedButtonIndex(0, animated: true)
            self.performSegueWithIdentifier("signUpSegue", sender: nil)
            
        })
    }
    
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

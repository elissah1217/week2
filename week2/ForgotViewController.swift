//
//  ForgotViewController.swift
//  week2
//
//  Created by Hsin Yi Huang on 5/15/15.
//  Copyright (c) 2015 Hsin Yi Huang. All rights reserved.
//

import UIKit

class ForgotViewController: UIViewController {
    
    
    @IBOutlet weak var scrollview: UIScrollView!
    
    @IBOutlet weak var ctaView: UIView!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        sendButton.enabled = false
        println(scrollview.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func editingBegin(sender: AnyObject) {
        UIView.animateWithDuration(0.5, animations: {
            self.scrollview.center.y = 200
            self.ctaView.center.y = 360
        })

        
    }
    
    @IBAction func onEditing(sender: AnyObject) {
        if emailField.text.isEmpty{
            sendButton.enabled = false
        }
        else{
            sendButton.enabled = true
        }
        
    }
    
    
    @IBAction func sendButtonPressed(sender: AnyObject) {
        var sendingAlert = UIAlertView(title: "Sending", message: "", delegate: self, cancelButtonTitle:nil)
        
        sendingAlert.show()
        delay(1.8, { () -> () in
            sendingAlert.title = "Email sent!"
            
        })
        delay(2.5, { () -> () in
            sendingAlert.dismissWithClickedButtonIndex(0, animated: true)
            self.navigationController?.popViewControllerAnimated(true)
        })
        
    }
    
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    @IBAction func closeKeyboard(sender: AnyObject) {
        view.endEditing(true)
        UIView.animateWithDuration(0.5, animations: {
            self.scrollview.center.y = 284
            self.ctaView.center.y = 522
        })
    }

}

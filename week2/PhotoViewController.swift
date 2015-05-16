//
//  PhotoViewController.swift
//  week2
//
//  Created by Hsin Yi Huang on 5/14/15.
//  Copyright (c) 2015 Hsin Yi Huang. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    
    var didSwipeRight:Bool = false
    var didSwipeLeft:Bool = false
    var swipeLeftEnable:Bool = false
    @IBOutlet weak var sharePopupView: UIView!
    @IBOutlet weak var sharePopupBackgroundView: UIView!
    @IBOutlet weak var photoScrollview: UIScrollView!
    
    @IBOutlet weak var facebookShareView: UIView!
    
    @IBOutlet weak var facebookTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        photoScrollview.contentSize = CGSize(width:640, height:502)
        photoScrollview.delegate = self
        let defs = NSUserDefaults.standardUserDefaults();
        defs.setBool(true, forKey: "didViewImage");
        var photoID = defs.integerForKey("photoID")
        defs.synchronize();
        println("photo ID\(photoID)")
        
        photoScrollview.contentOffset.x = CGFloat(photoID * 320)
        println(facebookShareView.center.y)
        sharePopupView.center.y = 780
        sharePopupBackgroundView.alpha = 0
        facebookShareView.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
       
        
        if photoScrollview.contentOffset.x == 320{
            swipeLeftEnable = true
            let defs = NSUserDefaults.standardUserDefaults();
            defs.setBool(true, forKey: "didSwipeRight");
            defs.synchronize();

            

        }
        if photoScrollview.contentOffset.x == 0 && swipeLeftEnable{
            let defs = NSUserDefaults.standardUserDefaults();
            defs.setBool(true, forKey: "didSwipeLeft");
            defs.synchronize();
        }
        
        
    }
    
    
    @IBAction func shareButtonPressed(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: {
            self.sharePopupView.center.y = 369.5
            self.sharePopupBackgroundView.alpha = 0.5
        })

    }
    
    
    
    @IBAction func facebookButtonPressed(sender: AnyObject) {
        facebookTextView.becomeFirstResponder()
        facebookShareView.hidden = false
        UIView.animateWithDuration(0.3, animations: {
            self.sharePopupView.center.y = 780
            self.facebookShareView.center.y = 155
            self.facebookShareView.alpha = 1
        })
        
        
    }
    
    
    @IBAction func postButtonPressed(sender: AnyObject) {
        closeFacebook(sender)
        let defs = NSUserDefaults.standardUserDefaults();
        defs.setBool(true, forKey: "didShare");
        defs.synchronize();
        var postingAlert = UIAlertView(title: "Posting", message: "", delegate: self, cancelButtonTitle:nil)
        
        postingAlert.show()
        delay(1.8, { () -> () in
            postingAlert.title = "Posted"
           
        })
        delay(2.5, { () -> () in
            postingAlert.dismissWithClickedButtonIndex(0, animated: true)
        })
        
    }
    
    
    @IBAction func closeFacebook(sender: AnyObject) {
        view.endEditing(true)
        UIView.animateWithDuration(0.2, animations: {
            self.sharePopupBackgroundView.alpha = 0
            self.facebookShareView.alpha = 0
        })
        
    }
    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: {
            self.sharePopupView.center.y = 780
            self.sharePopupBackgroundView.alpha = 0
        })
    }
    
    
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }

    

}

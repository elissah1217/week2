//
//  TermViewController.swift
//  week2
//
//  Created by Hsin Yi Huang on 5/15/15.
//  Copyright (c) 2015 Hsin Yi Huang. All rights reserved.
//

import UIKit

class TermViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL (string: "https://www.dropbox.com/terms?mobile=1")
        let requestObj = NSURLRequest(URL: url!)
        webView.loadRequest(requestObj)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func doneButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        

    }
    

}

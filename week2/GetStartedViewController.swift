//
//  GetStartedViewController.swift
//  week2
//
//  Created by Hsin Yi Huang on 5/14/15.
//  Copyright (c) 2015 Hsin Yi Huang. All rights reserved.
//

import UIKit

class GetStartedViewController: UIViewController {

    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var swipeButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defs = NSUserDefaults.standardUserDefaults();
        var didSwipeRight = defs.boolForKey("didSwipeRight")
        var didViewImage = defs.boolForKey("didViewImage")
        var didShare = defs.boolForKey("didShare")
        
        if didSwipeRight{
            swipeButton.selected = true
        }
        if didViewImage{
            photoButton.selected = true
        }
        if didShare{
            shareButton.selected = true
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func closeButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
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

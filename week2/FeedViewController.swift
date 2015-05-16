//
//  FeedViewController.swift
//  week2
//
//  Created by Hsin Yi Huang on 5/12/15.
//  Copyright (c) 2015 Hsin Yi Huang. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var learnView: UIView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var feedScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        feedScrollView.contentSize = feedImageView.image!.size
        println(feedScrollView.center.y)
        feedScrollView.frame.size.height -= learnView.frame.size.height
        feedScrollView.center.y += learnView.frame.size.height
        let defs = NSUserDefaults.standardUserDefaults();
        defs.setBool(false, forKey: "didSwipeRight");
        defs.setBool(false, forKey: "didSwipeLeft");
        defs.setBool(false, forKey: "didViewImage");
        defs.setBool(false, forKey: "didShare");
        defs.setInteger(0, forKey: "photoID");
        defs.synchronize();
        
        
        var didFavorite = defs.integerForKey("didFavorite");
        println("Favorite =\(didFavorite)");
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(Bool){
        super.viewDidAppear(true)
        println("appear")
        let defs = NSUserDefaults.standardUserDefaults();
        var didSwipeRight = defs.boolForKey("didSwipeRight")
        var didSwipeLeft = defs.boolForKey("didSwipeLeft")
        var didViewImage = defs.boolForKey("didViewImage")
        var didShare = defs.boolForKey("didShare")
        if didSwipeLeft && didViewImage && didShare{
            UIView.animateWithDuration(0.3, animations: {
                self.learnView.center.x = -320
                self.feedScrollView.center.y -= self.learnView.frame.size.height
                self.feedScrollView.frame.size.height += self.learnView.frame.size.height
            })
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func closeButtonPressed(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: {
            self.learnView.center.x = -320
            self.feedScrollView.center.y -= self.learnView.frame.size.height
            self.feedScrollView.frame.size.height += self.learnView.frame.size.height
        })
        
    }
    
    
    
    @IBAction func photo1Pressed(sender: AnyObject) {
        let defs = NSUserDefaults.standardUserDefaults();
        defs.setInteger(0, forKey: "photoID");
        defs.synchronize();
        
    }
    
    
    @IBAction func photo2Pressed(sender: AnyObject) {
        let defs = NSUserDefaults.standardUserDefaults();
        defs.setInteger(1, forKey: "photoID");
        defs.synchronize();
    }
    
    
    

}

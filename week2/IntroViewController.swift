//
//  IntroViewController.swift
//  week2
//
//  Created by Hsin Yi Huang on 5/12/15.
//  Copyright (c) 2015 Hsin Yi Huang. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate{

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    
    @IBOutlet weak var introScrollView: UIScrollView!
    var initialContentOffset = CGFloat()
    var finalContentOffset = CGFloat()
    var previousContentOffset = CGFloat()
    var progress = CGFloat()
    var didGoBack = false
    
    @IBOutlet weak var introImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        introScrollView.delegate = self
        introScrollView.contentSize = introImageView.image!.size
        
        initialContentOffset = 0
        finalContentOffset = 568
        progress = introScrollView.contentOffset.y / (finalContentOffset - initialContentOffset)
        
        previousContentOffset = initialContentOffset
        println(image2.center)
        //set up initial image position
        //image1.transform = CGAffineTransformMakeDegreeRotation(CGFloat(-10))
        image1.transform = trans(-10, 1)
        image1.center = CGPoint(x:40, y:500)
        image2.transform = trans(10, 1.7)
        image2.center = CGPoint(x:170, y:500)
        image3.transform = trans(10, 1.7)
        image3.center = CGPoint(x:50, y:400)
        image4.transform = trans(-10, 1.7)
        image4.center = CGPoint(x:150, y:400)
        image5.transform = trans(10, 1.7)
        image5.center = CGPoint(x:270, y:400)
        image6.transform = trans(-8, 1.7)
        image6.center = CGPoint(x:270, y:500)
        
        println("view did load")
        
        
        
    }
    
    
    override func viewWillAppear(Bool){
        super.viewWillAppear(true)
   
    }

    
    
 


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        //println("pre\(previousContentOffset)")
        println("scrol\(introScrollView.contentOffset.y)")
        
        progress = (introScrollView.contentOffset.y - initialContentOffset) / (finalContentOffset - initialContentOffset)
        
        image1.transform = trans(progressValue(-10, finalValue: 0), 1)
        image1.center = CGPoint(x: progressValue(40, finalValue: 122), y: progressValue(500, finalValue: 822))
        
        image2.transform = trans(progressValue(10, finalValue: 0), progressValue(1.7, finalValue: 1))
        image2.center = CGPoint(x: progressValue(170, finalValue: 84), y: progressValue(500, finalValue: 937))
        
        image3.transform = trans(progressValue(10, finalValue: 0), progressValue(1.7, finalValue: 1))
        image3.center = CGPoint(x: progressValue(50, finalValue: 161), y: progressValue(400, finalValue: 937))
        
        image4.transform = trans(progressValue(-10, finalValue: 0), progressValue(1.7, finalValue: 1))
        image4.center = CGPoint(x: progressValue(150, finalValue: 239), y: progressValue(400, finalValue: 937))
        
        image5.transform = trans(progressValue(10, finalValue: 0), progressValue(1.7, finalValue: 1))
        image5.center = CGPoint(x: progressValue(270, finalValue: 239), y: progressValue(400, finalValue: 860))
        
        image6.transform = trans(progressValue(-8, finalValue: 0), progressValue(1.7, finalValue: 1))
        image6.center = CGPoint(x: progressValue(270, finalValue: 239), y: progressValue(500, finalValue: 783))
       
        
        if introScrollView.contentOffset.y < 10 {
            UIView.animateWithDuration(0.7, animations: {
                self.introScrollView.contentOffset.y = self.initialContentOffset
            })
            
        }
        else if introScrollView.contentOffset.y >= 10 && introScrollView.contentOffset.y > previousContentOffset {
            println("SCROLL")
            
            UIView.animateWithDuration(0.7, animations: {
                self.introScrollView.contentOffset.y = self.finalContentOffset
            })
        }
       else if introScrollView.contentOffset.y <= 558 && introScrollView.contentOffset.y < previousContentOffset {
            UIView.animateWithDuration(0.7, animations: {
                self.introScrollView.contentOffset.y = self.initialContentOffset
            })
        }
        else if introScrollView.contentOffset.y > 558 {
            UIView.animateWithDuration(0.7, animations: {
                self.introScrollView.contentOffset.y = self.finalContentOffset
            })
        }
        else{
            
        }
        
        
        
     
        
      
        //setting value for preciousContentOffset
        
        if introScrollView.contentOffset.y < initialContentOffset{
            previousContentOffset = initialContentOffset
        }
        else if introScrollView.contentOffset.y > finalContentOffset{
            previousContentOffset = finalContentOffset
        }
        else{
            previousContentOffset = introScrollView.contentOffset.y
        }

        
    }
    
    
    
    func setFinalImagePosition(){
        introScrollView.contentOffset.y = finalContentOffset
        println(introScrollView.contentOffset.y)
        image1.transform = trans(0, 1)
        image1.center = CGPoint(x:122, y:822)
        image2.transform = trans(0, 1)
        image2.center = CGPoint(x:84, y:937)
        image3.transform = trans(0, 1)
        image3.center = CGPoint(x:161, y:937)
        image4.transform = trans(0, 1)
        image4.center = CGPoint(x:239, y:937)
        image5.transform = trans(0, 1)
        image5.center = CGPoint(x:239, y:860)
        image6.transform = trans(0, 1)
        image6.center = CGPoint(x:239, y:783)
    }

    
    //calculate the value that should be used during scrolling
    func progressValue(initialValue: CGFloat, finalValue: CGFloat) -> CGFloat {
        var initialValue = initialValue
        var finalValue = finalValue
        
        var currentValue = initialValue + ((finalValue - initialValue)*progress)
        return currentValue
    }
}

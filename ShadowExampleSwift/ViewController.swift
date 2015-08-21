//
//  ViewController.swift
//  ShadowExampleSwift
//
//  Created by Manish Kumar on 21/08/15.
//  Copyright (c) 2015 Innofied Solutions Pvt. Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createNormalShadowWithShadowOffset()
        //createTrapezoidalShadowToImage()
        //createOverallShadowToImage()
        //createEllepticalShadowBeneathImage()
        //createRoundedCornerShadow()
        //createCurlShadowForImageView()
        //createAnimatedShadows()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func createNormalShadowWithShadowOffset(){
        //applying shadow with offset to image
        imageView.layer.shadowColor = UIColor(white: 0.0, alpha: 0.5).CGColor
        imageView.layer.shadowOffset = CGSizeMake(3.0, 3.0)
        imageView.layer.shadowOpacity = 1.0
        imageView.layer.shadowRadius = 3.0
    }
    
    
    func createTrapezoidalShadowToImage(){

        var size = imageView.bounds.size

        //createing a trapezoidal path for shadow
        var path = UIBezierPath()
        path.moveToPoint(CGPointMake(size.width * 0.20, size.height * 0.80))
        path.addLineToPoint(CGPointMake(size.width * 0.80, size.height * 0.80))
        path.addLineToPoint(CGPointMake(size.width * 1.20, size.height * 1.20))
        path.addLineToPoint(CGPointMake(size.width * -0.20, size.height * 1.20))
        path.closePath()

        //applying path as shadow to image
        imageView.layer.shadowColor = UIColor(white: 0.0, alpha: 0.5).CGColor
        imageView.layer.shadowOffset = CGSizeMake(3.0, 3.0)
        imageView.layer.shadowOpacity = 1.0
        imageView.layer.shadowRadius = 2.0
        imageView.layer.shadowPath = path.CGPath

    }
    
    
    func createOverallShadowToImage(){
        
        //applying overall shadow to image
        imageView.layer.shadowColor = UIColor(white: 0.0, alpha: 0.5).CGColor
        imageView.layer.shadowOffset = CGSizeMake(0.0, 0.0)
        imageView.layer.shadowOpacity = 1.0
        imageView.layer.shadowRadius = 6.0
    }

    
    func createEllepticalShadowBeneathImage(){
        
        //create elliptical shdow forimage through UIBezierPath
        var ovalRect = CGRectMake(0.0, imageView.frame.size.height + 10, imageView.frame.size.width, 15)
        var path = UIBezierPath(ovalInRect: ovalRect)
        
        //applying shadow to path
        imageView.layer.shadowColor = UIColor(white: 0.0, alpha: 0.5).CGColor
        imageView.layer.shadowOffset = CGSizeMake(0.0, 0.0)
        imageView.layer.shadowOpacity = 1.0
        imageView.layer.shadowRadius = 3.0
        imageView.layer.shadowPath = path.CGPath
    }
    
    func createRoundedCornerShadow(){
        //make the image view rounded
        imageView.layer.cornerRadius = imageView.frame.size.width/2.0;
        imageView.layer.masksToBounds = true

        //aplying rounded corner shadow to image
        putShadowOnView(imageView, shadowColor: UIColor(white: 0.0, alpha: 0.5), radius: 5.0, offset: CGSizeMake(0.0, 0.0), opacity: 1.0)
    }

    
    func createCurlShadowForImageView(){
        
        //create a bezier path with curl effect
        var size = imageView.frame.size
        var path = UIBezierPath()
        
        //strating from left pont
        path.moveToPoint(CGPointZero)
        path.addLineToPoint(CGPointMake(0.0, size.height + 20.0))
        
        //curved bottom part
        path.addCurveToPoint(CGPointMake(size.width, size.height + 20.0), controlPoint1: CGPointMake(20.0, size.height), controlPoint2: CGPointMake(size.width - 20.0, size.height))

        //closing the path by going upper top part
        path.addLineToPoint(CGPointMake(size.width, 0.0))
        
        //close the path and apply the path as shadow
        path.closePath()
        
        //applying shadow to imageView thorugh the path created
        imageView.layer.shadowColor = UIColor(white: 0.0, alpha: 0.5).CGColor
        imageView.layer.shadowOffset = CGSizeMake(0.0, 0.0);
        imageView.layer.shadowOpacity = 1.0
        imageView.layer.shadowRadius = 3.0
        imageView.layer.shadowPath = path.CGPath
    }

    
    func createAnimatedShadows(){
        
        //applying the shadow
        imageView.layer.shadowColor =  UIColor(white: 0.0, alpha: 0.5).CGColor
        imageView.layer.shadowOffset = CGSizeMake(20.0, -20.0)
        imageView.layer.shadowOpacity = 1.0
        imageView.layer.shadowRadius = 2.0
    
        //applying animation to shadows
        var animation = CABasicAnimation(keyPath: "shadowOffset")
        animation.fromValue = NSValue(CGSize:CGSizeMake(-20.0, -20.0))
        animation.toValue = NSValue(CGSize: CGSizeMake(20.0, -20.0))
        animation.duration = 2.0
        imageView.layer.addAnimation(animation, forKey: "shadowOffset")
    }

    //http://stackoverflow.com/questions/4754392/uiview-with-rounded-corners-and-drop-shadow#12969741
    func putShadowOnView(viewToWorkUpon:UIView, shadowColor:UIColor, radius:CGFloat, offset:CGSize, opacity:Float)-> UIView{
        
        var shadowFrame = CGRectZero // Modify this if needed
        shadowFrame.size.width = 0.0
        shadowFrame.size.height = 0.0
        shadowFrame.origin.x = 0.0
        shadowFrame.origin.y = 0.0
    
        var shadow = UIView(frame: shadowFrame)//[[UIView alloc] initWithFrame:shadowFrame];
        shadow.userInteractionEnabled = false; // Modify this if needed
        shadow.layer.shadowColor = shadowColor.CGColor
        shadow.layer.shadowOffset = offset
        shadow.layer.shadowRadius = radius
        shadow.layer.masksToBounds = false
        shadow.clipsToBounds = false
        shadow.layer.shadowOpacity = opacity
        viewToWorkUpon.superview?.insertSubview(shadow, belowSubview: viewToWorkUpon)
        shadow.addSubview(viewToWorkUpon)
        return shadow
    }
}


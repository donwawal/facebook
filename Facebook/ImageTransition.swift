//
//  ImageTransition.swift
//  Facebook
//
//  Created by Jules Walter on 6/6/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {
    
    var feedViewController: NewsFeedViewController!
    var photoViewController: PhotoViewController!
    
    var originFrame: CGRect!
    var destinationFrame: CGRect!
    
    var window = UIApplication.sharedApplication().keyWindow
   
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        var initialFrame = feedViewController.selectedImageView.frame
        var scrollViewFrame = feedViewController.scrollView.frame
    
        originFrame = CGRect(x: initialFrame.origin.x + scrollViewFrame.origin.x
            , y: initialFrame.origin.y + scrollViewFrame.origin.y, width: initialFrame.width, height: initialFrame.height)
        
        var transitionImageView = UIImageView()
        transitionImageView.image = feedViewController.selectedImageView.image
        transitionImageView.frame = originFrame
        transitionImageView.contentMode = feedViewController.selectedImageView.contentMode
        transitionImageView.clipsToBounds = true
        window?.addSubview(transitionImageView)
        
        destinationFrame = window?.convertRect(photoViewController.photoImageView.frame, fromView: containerView)
        
        toViewController.view.alpha = 0
        
        photoViewController.selectedPhotoIndex = feedViewController.selectedPhotoIndex
        photoViewController.photoArray = feedViewController.photoArray
        photoViewController.photoImageView.image = feedViewController.selectedImageView.image
        
        duration = 1
        
        UIView.animateWithDuration(duration, animations: {
            
            transitionImageView.frame.size = self.photoViewController.photoImageView.frame.size
            transitionImageView.frame.origin = self.destinationFrame.origin
            
            }) { (finished: Bool) -> Void in
                toViewController.view.alpha = 1

                transitionImageView.removeFromSuperview()
                self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        var transitionImageView = UIImageView()
        window?.addSubview(transitionImageView)
        
        transitionImageView.image = photoViewController.photoImageView.image
        transitionImageView.frame = destinationFrame
        transitionImageView.contentMode = feedViewController.selectedImageView.contentMode
        transitionImageView.clipsToBounds = true
        
        duration = 1
        
        UIView.animateWithDuration(duration, animations: {
            containerView.backgroundColor = UIColor(white: 0, alpha: 0)
            fromViewController.view.alpha = 0
            transitionImageView.frame = self.originFrame
            }) { (finished: Bool) -> Void in
                transitionImageView.removeFromSuperview()
                self.finish()
        }
    }
}

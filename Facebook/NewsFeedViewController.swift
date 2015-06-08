//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    
    //unnecessary
    var selectedImageView: UIImageView!
    
    var imageTransition: ImageTransition!
    var photoArray: [UIImageView]!
    var initialFrames: [CGRect]!
    var selectedPhotoIndex: Int!
    
    @IBOutlet weak var photo1ImageView: UIImageView!
    @IBOutlet weak var photo2ImageView: UIImageView!
    @IBOutlet weak var photo3ImageView: UIImageView!
    @IBOutlet weak var photo4ImageView: UIImageView!
    @IBOutlet weak var photo5ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the content size of the scroll view
        scrollView.contentSize = CGSizeMake(320, feedImageView.image!.size.height)
        
        photoArray = [photo1ImageView, photo2ImageView, photo3ImageView, photo4ImageView, photo5ImageView]
        initialFrames = [photo1ImageView.frame, photo2ImageView.frame, photo3ImageView.frame, photo4ImageView.frame, photo5ImageView.frame]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
    }
    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        selectedImageView = sender.view as! UIImageView
        
        for i in 0...photoArray.count - 1{
            if photoArray[i] == selectedImageView{
                selectedPhotoIndex = i
            }
        }
        performSegueWithIdentifier("photoSegue", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationViewController = segue.destinationViewController as! PhotoViewController
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        imageTransition = ImageTransition()
        imageTransition.feedViewController = self
        imageTransition.photoViewController = destinationViewController
        destinationViewController.transitioningDelegate = imageTransition
    }
    
    
}

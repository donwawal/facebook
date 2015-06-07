//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Jules Walter on 6/4/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var actionButtonsView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    var photoArray: [UIImageView]!
    var image: UIImage!
    @IBOutlet var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.delegate = self
        scrollView.contentSize.width = 320 * CGFloat(photoArray.count)
        scrollView.contentSize.height = 569
        photoImageView.image = image
        photoImageView.clipsToBounds = true
    }

    override func viewDidAppear(animated: Bool) {
//        for i in 0...photoArray.count-1{
//            photoArray[i].frame = photoImageView.frame
//            photoArray[i].frame.origin.x = CGFloat(i * 320)
//            scrollView.addSubview(photoArray[i])
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissPhoto(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //Rewrite?
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return photoImageView
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // This method is called as the user scrolls
        var yOffset = Float(scrollView.contentOffset.y)

        var alpha = CGFloat(convertValue(yOffset, 0.0, -50.0, 1.0, 0.0))
        var alphaButtons = CGFloat(convertValue(yOffset, 0.0, -10, 1.0, 0.0))
        scrollView.backgroundColor = UIColor(white: 0, alpha: alpha)
        doneButton.alpha = alphaButtons
        actionButtonsView.alpha = alphaButtons
        //containerView.backgroundColor = UIColor(white: 0, alpha: alpha)
        //self.view.backgroundColor = UIColor.clearColor()
    }
    
    func scrollViewWillBeginDecelerating(scrollView: UIScrollView){
        var yOffset = Float(scrollView.contentOffset.y)
        if yOffset < -50 {
            dismissViewControllerAnimated(true, completion: nil)
        }
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

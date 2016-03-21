//
//  ViewController.swift
//  Animation-3
//
//  Created by 薛焱 on 16/3/10.
//  Copyright © 2016年 薛焱. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewForLayer: UIView!
    var myLayer: CALayer{
        return viewForLayer.layer
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayer()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func setUpLayer(){
        myLayer.backgroundColor = UIColor.blueColor().CGColor
        myLayer.borderWidth = 100
        myLayer.borderColor = UIColor.redColor().CGColor
        myLayer.shadowRadius = 3
        myLayer.shadowOffset = CGSize(width: 0, height: 3)
        myLayer.shadowOpacity = 0.7
        myLayer.contents = UIImage(named: "star")?.CGImage
        myLayer.contentsGravity = kCAGravityCenter
        myLayer.magnificationFilter = kCAFilterTrilinear
        myLayer.geometryFlipped = false
    }

    @IBAction func tap(sender: AnyObject) {
        myLayer.shadowOpacity = myLayer.shadowOpacity == 0.7 ? 0.0 : 0.7
    }
    @IBAction func pinch(sender: UIPinchGestureRecognizer) {
        let offset: CGFloat = sender.scale < 1 ? 5.0 : -5.0
        let oldFrame = myLayer.frame
        let oldOrgin = oldFrame.origin
        let newSize = CGSize(width: oldFrame.width + (offset * -2.0), height: oldFrame.height + (offset * -2.0))
        let newOrgin = CGPoint(x: oldOrgin.x + offset, y: oldOrgin.y + offset)
        let newFrame = CGRect(origin: newOrgin, size: newSize)
        if newFrame.width >= 100.0 && newFrame.width < 300 {
            myLayer.borderWidth -= offset
            myLayer.cornerRadius += offset / 2.0
            myLayer.frame = newFrame
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


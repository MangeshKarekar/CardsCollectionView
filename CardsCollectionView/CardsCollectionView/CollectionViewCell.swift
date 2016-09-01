//
//  CollectionViewCell.swift
//  CardsCollectionView
//
//  Created by Mangesh K on 31/08/2016.
//  Copyright © 2016 Mangesh. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell,UIGestureRecognizerDelegate {
    
  @IBOutlet weak var imageView: UIImageView!
  
  var imageName: String = "" {
    didSet {
      let image = UIImage(named: imageName)
      imageView.image = image
    }
  }
  
  
  var originalCenter = CGPoint()
  
  var originalFrame = CGRect()
  
  var myCollectionView:UICollectionView?{
    didSet{
      let centerX = myCollectionView!.contentOffset.x + (CGRectGetWidth(myCollectionView!.bounds) / 2.0)
      originalFrame = CGRect(x: centerX-frame.size.width/2, y: frame.origin.y,
                             width: bounds.size.width, height: bounds.size.height)
    }
  }


  override func awakeFromNib() {
    super.awakeFromNib()
    let recognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
    recognizer.delegate = self
    addGestureRecognizer(recognizer)
    
    }
  
  func handlePan(recognizer: UIPanGestureRecognizer) {
    // 1
    if recognizer.state == .Began {
      // when the gesture begins, record the current center location
      originalCenter = center
    }
    // 2
    if recognizer.state == .Changed {
      let translation = recognizer.translationInView(self)
      center = CGPointMake(originalCenter.x + translation.x, originalCenter.y)
      // has the user dragged the item far enough to initiate a delete/complete?
    }
    // 3
    if recognizer.state == .Ended {
      print("ended")
      UIView.animateWithDuration(0.2, animations: {self.frame = self.originalFrame})
      
    }
  }
  
  override func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
    if let panGestureRecognizer = gestureRecognizer as? UIPanGestureRecognizer {
      let translation = panGestureRecognizer.translationInView(superview!)
      if fabs(translation.x) > fabs(translation.y) {
        return true
      }
      return false
    }
    return false
  }

}

//
//  ViewController.swift
//  CardsCollectionView
//
//  Created by Mangesh K on 31/08/2016.
//  Copyright © 2016 Mangesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource {
  var imageNames = ["awt","bgsk","cdt","i5t","i6t","i6tc","i7t","i8T","ia1234","iat","pgsk","sgsk","skt","swt"]
  @IBOutlet weak var myCollectionView: UICollectionView!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
    return imageNames.count
    
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionViewCell
    cell.imageName = imageNames[indexPath.row]
    cell.myCollectionView = myCollectionView
    return cell
  }

}


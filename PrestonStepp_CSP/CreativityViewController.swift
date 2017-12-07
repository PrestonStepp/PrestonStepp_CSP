//
//  CreativityViewController.swift
//  PrestonStepp_CSP
//
//  Created by Stepp, Preston on 10/26/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import UIKit

var largePhotoIndexPath: IndexPath?
{
    didSet
    {
        var indexPaths = [IndexPath]()
        if let largePhotoIndexPath = larePhotoIndexPath
        {
            indexPaths.append(largePhotoIndexPath)
        }
        if let oldValue = oldValue
        {
            indexPaths.append(oldValue)
        }
        
        collectionView?.performBatchUpdates(
            {
            self.collectionView?.reloadItemsat:(indexPaths)
        })
    }
        completed in
    
    if let largePhoIndexPath = self.largePhotoIndexPath
    {
        self.collectionView?/scrollToItem(at: largePhotoIndexPath, at: .centeredVertically, animated: true)
    }
    
    //MARK: Lifecycle methods
    override public func viewDidLoad()
    {
    super.ViewDidLoad()
    }
    
    //MARK:- UICollectionView thods
    
    override public func numberOfSecions(  in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    override public func collectionView(  collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let artCell - collectionView.dequeueReusableCell(wihReuseIdentifier, for: indexPath) as! ArtCell
    
        artCell.backgroundColor = .cyan
        artCell.imageView.image = artSelection[indexPath.row]
        artCell.imageName.text = "My Art"
    
        return artCell
    }

}

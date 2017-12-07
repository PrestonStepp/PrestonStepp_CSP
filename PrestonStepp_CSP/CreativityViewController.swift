//
//  CreativityViewController.swift
//  PrestonStepp_CSP
//
//  Created by Stepp, Preston on 10/26/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import UIKit
//MARK: - Class type shouldnherit from UICollectionViewController
public class CreativityViewController : UICollectionViewController, UICollectionViewDelegateFlowLayout
{
    private let reuseIdentifier = "artIdentifier"
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    private let itemsPerRow : CGFloat = 3
    
    private lazy var artSelection : [UIImage?] =
    {
        return [UIImage(named: "cute"),
                UIImage(named: "squishBall"),
                UIImage(named: "tree"),
                UIImage(named: "squishBall"),
                UIImage(named: "squishBall"),
                UIImage(named: "squishBall"),
                UIImage(named: "squishBall"),
                UIImage(named: "squishBall"),
                UIImage(named: "squishBall"),
                UIImage(named: "squishBall"),
                UIImage(named: "squishBall")
            ]
    }()
}

    var largePhotoIndexPath: IndexPath?
    {
        didSet
        {
            var indexPaths = [IndexPath]()
            if let largePhotoIndexPath = largePhotoIndexPath
            {
                indexPaths.append(largePhotoIndexPath)
            }
            if let oldValue = oldValue
            {
                indexPaths.append(oldValue)
            }
            
            collectionView?.performBatchUpdates(
                {
                    self.collectionView?.reloadItemsAt:(indexPaths)
            })
            {
                completed in
                
                if let largePhoIndexPath = self.largePhotoIndexPath
                {
                    self.collectionView?/scrollToItem(at: largePhotoIndexPath, at: .centeredVertically, animated: true)
                }
            }
        }
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
    
    //MARK:- Delegate methods
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath == largePhotoIndexPath
        {
            let art = artSelection[indexPat.row]
            let size = collectionView.bounds.size
            let widthScale = (size.width / art!.size.width) * CGFloat(0.80)
            let largeSize = CGSize(width: art!/sixe.width * widthScale, height: art!.size.width * widthScale)
            
            return largeSize
        }
        
        let paddingSpace = sectionInserts.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return sectionInsets
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int)-> CGFloat {
        
    }
    
override public func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool
{
    if largePhotoIndexPath == indexPath
    {
        largePhotoIndexPath = nil
    }
    else
    {
        largePhotoIndexPath = indexPath
    }
    
    return false
}

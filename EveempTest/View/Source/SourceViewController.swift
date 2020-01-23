//
//  SourceViewController.swift
//  EveempTest
//
//  Created by Nico Prasasty S on 20/01/20.
//  Copyright © 2020 Nico Prasasty Sembiring. All rights reserved.
//

import UIKit
import SwiftyJSON

class SourceViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let sourceMV = SourceMV()
    let sourceCellID: String = "source"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource  = self
        collectionView.delegate = self
        
        let layout = CHTCollectionViewWaterfallLayout()
        
        // Change individual layout attributes for the spacing between cells
        layout.minimumColumnSpacing = 1.0
        layout.minimumInteritemSpacing = 1.0
        
        // Collection view attributes
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.alwaysBounceVertical = true
        
        // Add the waterfall layout to your collection view
        collectionView.collectionViewLayout = layout
        
        let viewNib = UINib(nibName: String(describing: SourceViewController.self), bundle: nil)
        collectionView.register(viewNib, forCellWithReuseIdentifier: sourceCellID)
        
        sourceMV.postSource(category: (navigationItem.title?.lowercased())!) { (success) in
            if success{
                print("")
            }
        }
    }
}

extension SourceViewController: UICollectionViewDelegate, UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout{
    //MARK: - CollectionView Delegate Methods
    
     //** Number of Cells in the CollectionView */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sourceMV.sourceCount
    }
    
    
    //** Create a basic CollectionView Cell */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Create the cell and return the cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: sourceCellID, for: indexPath) as! SourceCell
        
        
        // Add image to cell
//        cell.image.image = sourceMV.images[indexPath.row]
        return cell
    }
    
    
    //MARK: - CollectionView Waterfall Layout Delegate Methods (Required)
    
    //** Size for the cells in the Waterfall Layout */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // create a cell size from the image size, and return the size
//        let imageSize = model.images[indexPath.row].size
        
        return CGSize(width: 100, height: 100)
    }
}



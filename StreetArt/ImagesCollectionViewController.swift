//
//  ImagesCollectionViewController.swift
//  StreetArt
//
//  Created by Diogo Ribeiro on 27/02/2019.
//  Copyright © 2019 Diogo Ribeiro. All rights reserved.
//

import UIKit

private let theReuseIdentifier = "cellImage"

class ImageCollectionCellView: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
}

class ImagesCollectionViewController: UICollectionViewController {
    
    var list:[Art] = []
    var artSelected: Art?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        list = StreetArtDAO().loadIt()
        self.clearsSelectionOnViewWillAppear = false
        
        if let flowLayout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.minimumLineSpacing = 2
            flowLayout.minimumInteritemSpacing = 1
        }
        
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ArtDetailViewController {
            if let art = artSelected {
                vc.art = art
            }
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: theReuseIdentifier, for: indexPath) as! ImageCollectionCellView
        let art = list[indexPath.row]
    
        // Configure the cell
        cell.imageView.loadIt(imgUrl: art.imgUrl)
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.artSelected = list[indexPath.row]
        performSegue(withIdentifier: artDetailViewController, sender: nil)
    }



}

//
//  FirstViewController.swift
//  StreetArt
//
//  Created by Diogo Ribeiro on 25/02/2019.
//  Copyright © 2019 Diogo Ribeiro. All rights reserved.
//

import Koloda

class FirstViewController: BaseViewController {

    @IBOutlet weak var koladaView: KolodaView!
    @IBOutlet weak var likeButton: UIButton!
    
    var items:[Art] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = StreetArtDAO().loadIt().shuffled()
        koladaView.dataSource = self
        koladaView.delegate = self
        
        koladaView.layer.cornerRadius = 5
        koladaView.clipsToBounds = true
        koladaView.layoutIfNeeded()
    }

    @IBAction func shareAction(_ sender: Any) {
        let item = items[koladaView.currentCardIndex]
        shareIt(message: item.text, imgURL: item.imgUrl)
    }
    
    @IBAction func likeAction(_ sender: Any) {
        koladaView.swipe(SwipeResultDirection.right)
    }
    
}

extension FirstViewController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        koloda.reloadData()
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        performSegue(withIdentifier: artDetailViewController, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ArtDetailViewController {
            vc.art = items[koladaView.currentCardIndex]
        }
    }
}

extension FirstViewController: KolodaViewDataSource {
    
    func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
        return items.count
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .default
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let url = items[index].imgUrl
        let name = items[index].name
        
        guard let view = UINib(nibName: cardViewNib, bundle: nil).instantiate(withOwner: nil, options: nil).first as? CardOverlayView else {
            return UIView()
        }
        
        view.imageView.loadIt(imgUrl: url)
        view.artName.text = " " + name
        return view
    }
}

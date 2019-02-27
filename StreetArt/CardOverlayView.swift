//
//  CardOverlayView.swift
//  StreetArt
//
//  Created by Diogo Ribeiro on 26/02/2019.
//  Copyright © 2019 Diogo Ribeiro. All rights reserved.
//

import Foundation
import Koloda

class CardOverlayView: OverlayView {
    
    @IBOutlet weak var artName: UILabel!
    
    @IBOutlet lazy var imageView: UIImageView! = {
        [unowned self] in
        
        var imageView = UIImageView(frame: self.bounds)
        self.addSubview(imageView)
        
        return imageView
        }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 5
        artName.layer.cornerRadius = 5
        self.clipsToBounds = true
        self.layer.displayIfNeeded()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
     
    }

}

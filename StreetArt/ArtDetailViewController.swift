//
//  ArtDetailViewController.swift
//  StreetArt
//
//  Created by Diogo Ribeiro on 26/02/2019.
//  Copyright © 2019 Diogo Ribeiro. All rights reserved.
//

import UIKit

class ArtDetailViewController: BaseUITableViewController {
    
    var art: Art?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = art?.name ?? appName
        options = art?.optionsForHeader() ?? []
        optionsValues = art?.optionsForHeaderValues() ?? []
        headerSize = 200
        logoBannerName = art?.imgUrl ?? ""
    }

}

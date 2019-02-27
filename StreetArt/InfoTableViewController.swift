//
//  InfoTableViewController.swift
//  StreetArt
//
//  Created by Diogo Ribeiro on 27/02/2019.
//  Copyright © 2019 Diogo Ribeiro. All rights reserved.
//

import UIKit

class InfoTableViewController: BaseUITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        options = ["","Origem dos dados","Quem produziu os dados","Quem desenvolveu esta app"]
        optionsValues = [appName,"https://dados.gov.pt/pt/","Amadora Câmera Municipal","Diogo Ribeiro - about.me/D.H"]
    }
}

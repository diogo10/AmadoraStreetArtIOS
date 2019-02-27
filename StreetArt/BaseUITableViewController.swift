//
//  BaseUITableViewController.swift
//  StreetArt
//
//  Created by Diogo Ribeiro on 27/02/2019.
//  Copyright © 2019 Diogo Ribeiro. All rights reserved.
//

import Foundation
import UIKit

class BaseUITableViewController: UITableViewController {
    
    var options:[String] = ["","Origem dos dados","Quem produziu os dados","Quem desenvolveu esta app"]
    var optionsValues:[String] = [appName,"https://dados.gov.pt/pt/","Amadora Câmera Municipal","Diogo Ribeiro - about.me/D.H"]
    var headerSize = 100
    var labelItemSize = 50
    var logoBannerName = "logobanner"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearsSelectionOnViewWillAppear = false
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return CGFloat(headerSize) // image header size
        }else {
            return CGFloat(labelItemSize) // title size
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            let imageView = UIImageView()
            imageView.loadIt(imgUrl: logoBannerName)
            return imageView
        }else{
            let label = UITableViewHeaderFooterView()
            label.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            label.textLabel?.text = options[section]
            return label
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return options.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 100 // for descriptions
        cell.textLabel?.text = optionsValues[indexPath.section]
        return cell
    }
    
}


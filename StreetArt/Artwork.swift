//
//  Artwork.swift
//  StreetArt
//
//  Created by Diogo Ribeiro on 26/02/2019.
//  Copyright © 2019 Diogo Ribeiro. All rights reserved.
//

import MapKit

class Artwork: NSObject, MKAnnotation {
    let title: String?
    let owner: String
    let coordinate: CLLocationCoordinate2D
    let art: Art
        
    init(art: Art) {
        let point = CLLocationCoordinate2D(latitude: art.lat, longitude: art.long)
        
        self.title = art.name
        self.owner = art.owner
        self.coordinate = point
        self.art = art
        super.init()
    }
    
    var subtitle: String? {
        return owner
    }
   
}

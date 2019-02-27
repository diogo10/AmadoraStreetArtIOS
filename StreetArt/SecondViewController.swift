//
//  SecondViewController.swift
//  StreetArt
//
//  Created by Diogo Ribeiro on 25/02/2019.
//  Copyright © 2019 Diogo Ribeiro. All rights reserved.
//

import MapKit

class SecondViewController: BaseViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let initialLocation = CLLocation(latitude: 38.757093, longitude: -9.225208)
    let regionRadius: CLLocationDistance = 2000
    var artSelected: Art?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        centerMapOn(location: initialLocation)
        placeArts(arts: StreetArtDAO().loadIt())
    }


    func placeArts(arts:[Art]) {
        var points:[Artwork] = []
        
        for art in arts{
            if art.lat != 0 {
                points.append(Artwork(art: art))
            }
        }
        
        mapView.addAnnotations(points)
    }
    
    
    func centerMapOn(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ArtDetailViewController {
            if let art = artSelected{
                vc.art = art
            }
        }
    }
}

extension SecondViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard let annotation = annotation as? Artwork else { return nil }
        
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            let infoButton = UIButton(type: .detailDisclosure)
            infoButton.addTarget(self, action: #selector(showArtDetail), for: .touchUpInside) // will show the detail after the click on "I"
            view.rightCalloutAccessoryView = infoButton
        }
        
        
        return view
    }
    
    @objc func showArtDetail()  {
       performSegue(withIdentifier: "artDetailViewControllerFromMap", sender: nil)
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        if let artwork = view.annotation as? Artwork {
            self.artSelected = artwork.art
        }
    }
}

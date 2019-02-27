//
//  StreetArt.swift
//  StreetArt
//
//  Created by Diogo Ribeiro on 26/02/2019.
//  Copyright © 2019 Diogo Ribeiro. All rights reserved.
//

import Foundation

class Art {
    var id: String
    var name: String
    var imgUrl: String
    var text: String
    var lat: Double
    var long: Double
    var owner: String
    var place: String
    var street: String
    var type: String
    var date: String
    
    init(dic: NSDictionary) {
        self.id = dic["ID"] as? String ?? ""
        self.name = dic["name"] as? String ?? ""
        self.imgUrl = dic["pic_url"] as? String ?? ""
        self.text = dic["Descricao"] as? String ?? ""
        self.lat = Double((dic["Latitude"] as? String ?? "0")) ?? 0
        self.long = Double((dic["Longitude"] as? String ?? "0")) ?? 0
        self.owner = dic["Autoria"] as? String ?? ""
        self.place = dic["Freguesia"] as? String ?? ""
        self.street = dic["Localizacao"] as? String ?? ""
        self.type = dic["Tipologia"] as? String ?? ""
        self.date = dic["Data"] as? String ?? ""
    }
    
    func optionsForHeader() -> [String] {
        return ["Texto","Autor","Freguesia","Lugar","Tipo","Data","Nome"]
    }
    
    func optionsForHeaderValues() -> [String] {
        return [self.text,self.owner,self.place,self.street,self.type, self.date,self.name]
    }
}

class StreetArtDAO {
    
    func loadIt() -> [Art]{
        var artsItems: [Art] = []
        
        if let path = Bundle.main.path(forResource: "ArteUrbana", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let arts = jsonResult["d"] as? [NSDictionary] {
                    
                    for item in arts {
                        artsItems.append(Art(dic: item))
                    }
                
                }
            } catch {
                // handle error
                print("error")
            }
        }
        
        return artsItems
    }
    
}

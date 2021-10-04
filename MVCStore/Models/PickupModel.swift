//
//  PickupTruckModel.swift
//  MVCStore
//
//  Created by Fernado Belen on 02/10/2021.
//

import Foundation

class Pickup: Codable {
    var model: String
    var motor: String
    var year: Int
    var img: String
    var description: String
    
    init(model: String, motor: String, year: Int, img: String,description: String){
        self.model = model
        self.motor = motor
        self.year = year
        self.img = img
        self.description = description
    }
}

class GroupOfPickup: Codable {
    let pickups: [Pickup]
    
    init(pickups: [Pickup]){
        self.pickups = pickups
    }
}



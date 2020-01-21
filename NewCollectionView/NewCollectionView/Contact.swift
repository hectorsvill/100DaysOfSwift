//
//  Contact.swift
//  CollectionViewDemo
//
//  Created by Alex Nagy on 18/01/2020.
//  Copyright © 2020 Alex Nagy. All rights reserved.
//

import Foundation

struct Contact: Codable, Hashable {
    
    struct Address: Codable, Hashable {
        
        struct Geo: Codable, Hashable {
            let lat: String
            let lng: String
        }
        
        let street: String
        let suite: String
        let city: String
        let zipcode: String
        let geo: Geo
    }
    
    struct Company: Codable, Hashable {
        let name: String
        let catchPhrase: String
        let bs: String
    }
    
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company
    
}

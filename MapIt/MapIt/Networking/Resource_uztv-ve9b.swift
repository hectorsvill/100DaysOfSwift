//
//  Resource_uztv-ve9b.swift
//  MapIt
//
//  Created by s on 3/31/20.
//  Copyright © 2020 s. All rights reserved.
//

import Foundation

class Result: Decodable {
    let resrouces: [Resource_uztv_ve9b]
}


class Resource_uztv_ve9b: NSObject, Decodable {
    let map_order: String
    let name: String
    let number: String
    let street: String
    let city: String
    let state: String
    let zip: String
    let full_address: String
    let phone_number: String?
    let type: String
    let source: String
    let latitude: String
    let longitude: String
}

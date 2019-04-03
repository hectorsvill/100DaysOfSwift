//
//  CountryFacts.swift
//  FunCountryFacts
//
//  Created by Hector Steven on 4/3/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import Foundation

struct Countries: Codable {
	var results: [CountryFacts]
}

struct CountryFacts: Codable {
	var country: String
	var facts: [String]
}

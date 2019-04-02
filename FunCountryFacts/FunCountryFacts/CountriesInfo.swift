//
//  CountriesInfo.swift
//  FunCountryFacts
//
//  Created by Hector Steven on 4/1/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import Foundation

class CountriesInfo {
	func getCountriesList() -> [String] {
		let countryList = [
			"estonia", "france", "germany", "ireland",
			"italy", "monaco", "nigeria", "poland",
			"russia", "spain", "uk", "us"]
		return countryList.sorted()
	}
}

struct Countries: Codable {
	var results: [CountryFacts]
}




struct CountryFacts: Codable {
	var country: String
	var facts: [String]
}

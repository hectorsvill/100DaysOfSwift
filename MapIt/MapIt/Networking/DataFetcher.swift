//
//  DataFetcher.swift
//  MapIt
//
//  Created by s on 3/31/20.
//  Copyright © 2020 s. All rights reserved.
//

import Foundation


class DataFetcher {
    private let baseUrl = URL(string: "https://controllerdata.lacity.org")!


    init() {
        fetchAvailableCOVID19resourceslocatedwithintheCityofLosAngeles { _ , _ in

        }
    }

    func fetchAvailableCOVID19resourceslocatedwithintheCityofLosAngeles(completion: @escaping ([Resource_uztv_ve9b]?, Error?) -> () ) {
        let url = baseUrl.appendingPathComponent("resource").appendingPathComponent("uztv-ve9b").appendingPathExtension("json")

        print(url.absoluteString)

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                NSLog("Error with fetchAvailableCOVID19resourceslocatedwithintheCityofLosAngeles: \(error.localizedDescription)")
                completion(nil, error)
            }

            guard let data = data else { return }

            let decoder = JSONDecoder()
            print(data)
            do {
                let results = try decoder.decode([Resource_uztv_ve9b].self, from: data)
                print(results.count)
//                completion(results.resrouces, nil)
            }catch {
                NSLog("Decoder Error: \(error.localizedDescription)")
                completion(nil, error)
            }

        }.resume()


    }

}

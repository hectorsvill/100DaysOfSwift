//
//  Storyboarded.swift
//  Coordinator
//
//  Created by Hector on 10/26/19.
//  Copyright © 2019 Hector. All rights reserved.
//

import Foundation
import UIKit

protocol  Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}




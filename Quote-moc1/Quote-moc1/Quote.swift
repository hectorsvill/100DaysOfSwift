//
//  Quotes.swift
//  Quote-moc1
//
//  Created by Hector on 12/11/19.
//  Copyright © 2019 Hector. All rights reserved.
//

import Foundation


struct Quote: Hashable {
    let uuid = UUID().uuidString
    let quote: String
    
}


extension QuoteCollectionViewController {
    func createQuoteData() {
        
        quotes.append(Quote(quote:"Faith is an oasis in the heart which will never be reached by the caravan of thinking."))
        quotes.append(Quote(quote:"Pride is still aiming at the best houses: Men would be angels, angels would be gods. Aspiring to be gods, if angels fell aspiring to be angels men rebel."))
        quotes.append(Quote(quote:"Strategy is a route to achieving your objectives."))
        quotes.append(Quote(quote: "To turn really interesting ideas and fledgling technologies into a company that can continue to innovate for years, it requires a lot of disciplines."))
        
    }
    
}

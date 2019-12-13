//
//  QuoteCollectionViewCell.swift
//  Quote-moc1
//
//  Created by Hector on 12/11/19.
//  Copyright © 2019 Hector. All rights reserved.
//

import UIKit

class QuoteCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier: String = "QuoteCell"
    
    var quote: Quote? { didSet { setupviews() } }
    
    private let quoteTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupviews() {
        guard let quote = quote else { return }
        let quoteContainerView = UIView()
        
        addSubview(quoteContainerView)
        quoteContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let attributedText = NSMutableAttributedString(string: quote.quote, attributes: [NSAttributedString.Key.font: UIFont.italicSystemFont(ofSize: 24)])
        
        attributedText.append(NSAttributedString(string: "\n\n - Anon", attributes: [NSAttributedString.Key.font: UIFont.italicSystemFont(ofSize: 16)]))
        quoteTextView.attributedText = attributedText
        quoteTextView.textAlignment = .justified
        
        addSubview(quoteTextView)
        
        
        
        NSLayoutConstraint.activate([
            
            quoteContainerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            quoteContainerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            quoteContainerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            quoteContainerView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor),
            
            quoteTextView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            quoteTextView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            quoteTextView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 8),
            quoteTextView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -8),
            
        ])
        
        
        
    }
    

    
}

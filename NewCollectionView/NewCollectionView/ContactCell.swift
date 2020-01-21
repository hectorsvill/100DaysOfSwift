//
//  ContactCell.swift
//  CollectionViewDemo
//
//  Created by Alex Nagy on 18/01/2020.
//  Copyright © 2020 Alex Nagy. All rights reserved.
//

import UIKit
import TinyConstraints
import Kingfisher

class ContactCell: UICollectionViewCell, SelfConfiguringCell  {
    
    static let reuseIdentifier: String = "ContactCell"
    
    // http://avatars.adorable.io/
    fileprivate let imageApiBaseUrl = "https://api.adorable.io/avatars/285/"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var contactImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 22
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView()
        aiv.startAnimating()
        return aiv
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22)
        label.textColor = UIColor.init(white: 0.3, alpha: 0.8)
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = UIColor.init(white: 0.3, alpha: 0.4)
        return label
    }()
    
    private func setupView() {
    
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 8
        clipsToBounds = true
        
        addSubview(contactImageView)
        addSubview(activityIndicatorView)
        addSubview(nameLabel)
        addSubview(emailLabel)
        
        contactImageView.edgesToSuperview(excluding: .trailing, insets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        contactImageView.size(CGSize(width: 44, height: 44))
        
        activityIndicatorView.center(in: contactImageView)
        
        nameLabel.leadingToTrailing(of: contactImageView, offset: 8)
        nameLabel.trailingToSuperview(offset: 8)
        nameLabel.centerY(to: contactImageView, offset: -10)
        
        emailLabel.leadingToTrailing(of: contactImageView, offset: 8)
        emailLabel.trailingToSuperview(offset: 8)
        emailLabel.centerY(to: contactImageView, offset: 10)
        
    }
    
    func configure(with contact: Contact) {
        let imageUrl = "\(imageApiBaseUrl)\(contact.email)"
        if let url = URL(string: imageUrl) {
            let resource = ImageResource(downloadURL: url)
            self.contactImageView.kf.setImage(with: resource, placeholder: nil, options: nil, progressBlock: nil) { (result: Result<RetrieveImageResult, KingfisherError>) in
                switch result {
                case .success(_):
                    self.activityIndicatorView.stopAnimating()
                case .failure(let err):
                    print(err.localizedDescription)
                }
            }
        }
        
        nameLabel.text = contact.name
        emailLabel.text = contact.email
    }
    
}

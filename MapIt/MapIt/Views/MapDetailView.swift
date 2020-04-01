//
//  MapDetailView.swift
//  MapIt
//
//  Created by s on 4/1/20.
//  Copyright © 2020 s. All rights reserved.
//

import UIKit

class MapDetailView: UIView {
    var resource: Resource_uztv_ve9b? { didSet { setupViews() }}

    private var typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private var addressTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isUserInteractionEnabled = false
        textField.textColor = .label
        textField.textAlignment = .center
        textField.textContentType = .addressCity
        return textField
    }()

    private var phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isUserInteractionEnabled = false
        textField.textColor = .label
        textField.textAlignment = .center
        textField.textContentType = .telephoneNumber
        return textField
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        let stackView = UIStackView(arrangedSubviews: [typeLabel, addressTextField, phoneNumberTextField])

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical


        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
        ])

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func setupViews() {
        guard let resource = resource, let phoneNumber =  resource.phone_number else { return }

        print(resource.type, resource.full_address, phoneNumber)
        typeLabel.text = resource.type
        addressTextField.text = resource.full_address
        phoneNumberTextField.text = phoneNumber

    }

}

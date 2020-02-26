//
//  DropDownButton.swift
//  InsetItemGrid
//
//  Created by s on 2/18/20.
//  Copyright © 2020 s. All rights reserved.
//

import UIKit

// MARK: DROPDOWNBUTTON
class DropDownButton: UIButton {
    var dropDownMenuTableView = DropDownMenuTableView()
    var height_Anchor = NSLayoutConstraint()
    var isOPen = false
    var tableviewHeight:CGFloat = 200

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override func didMoveToSuperview() {

        backgroundColor = .systemGray2
        dropDownMenuTableView = .init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))

        dropDownMenuTableView.translatesAutoresizingMaskIntoConstraints = false
        superview?.addSubview(dropDownMenuTableView)

        NSLayoutConstraint.activate([
            dropDownMenuTableView.topAnchor.constraint(equalTo: bottomAnchor),
            dropDownMenuTableView.centerXAnchor.constraint(equalTo: centerXAnchor),
            dropDownMenuTableView.widthAnchor.constraint(equalTo: widthAnchor)

        ])
        
        height_Anchor = dropDownMenuTableView.heightAnchor.constraint(equalToConstant: 0)
        height_Anchor.isActive = true
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !isOPen {
            height_Anchor.constant = tableviewHeight
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2, options: .curveEaseOut, animations: {
                self.dropDownMenuTableView.layoutIfNeeded()
                self.dropDownMenuTableView.center.y += self.dropDownMenuTableView.frame.height / 2
            }) { _ in

            }
        } else {
            height_Anchor.constant = 0
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2, options: .curveEaseInOut, animations: {
                self.dropDownMenuTableView.center.y -= self.dropDownMenuTableView.frame.height / 2
                self.dropDownMenuTableView.layoutIfNeeded()
            }) { _ in

            }
        }

        isOPen.toggle()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

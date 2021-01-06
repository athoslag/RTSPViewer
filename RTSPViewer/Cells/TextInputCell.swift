//
//  TextInputCell.swift
//  RTSPViewer
//
//  Created by mani on 2020-01-05.
//  Copyright © 2020 mani. All rights reserved.
//

import UIKit

class TextInputCell: UITableViewCell {
    var keyboardType: UIKeyboardType = .default {
        didSet {
            textField.keyboardType = keyboardType
        }
    }
    var returnKeyType: UIReturnKeyType = .default {
        didSet {
            textField.returnKeyType = returnKeyType
        }
    }
    let textField = UITextField()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        initialize()
    }

    private func initialize() {
        textField.clearButtonMode = .whileEditing
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.tintColor = .lightGray
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.textColor = .lightGray

        contentView.addSubview(textField)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let margins = self.layoutMarginsGuide

        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: contentView.topAnchor),
            textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            textField.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
            ])
    }
}

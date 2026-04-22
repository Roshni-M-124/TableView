//
//  FriendCell.swift
//  profile_section
//
//  Created by Mobicip on 20/04/26.
//

import UIKit

class FriendCell: UITableViewCell {

    let friendLabel = UILabel()
    let iconView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        iconView.backgroundColor = .gray
        iconView.layer.cornerRadius = 20
        iconView.translatesAutoresizingMaskIntoConstraints = false

        friendLabel.translatesAutoresizingMaskIntoConstraints = false
        friendLabel.numberOfLines = 0
        friendLabel.font = UIFont.preferredFont(forTextStyle: .body)
        friendLabel.adjustsFontForContentSizeCategory = true

        contentView.addSubview(iconView)
        contentView.addSubview(friendLabel)

        NSLayoutConstraint.activate([
            iconView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            iconView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            iconView.widthAnchor.constraint(equalToConstant: 40),
            iconView.heightAnchor.constraint(equalToConstant: 40),
            iconView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10),

            friendLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 12),
            friendLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            friendLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            friendLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

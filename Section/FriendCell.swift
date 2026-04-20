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

        contentView.addSubview(iconView)
        contentView.addSubview(friendLabel)

        NSLayoutConstraint.activate([
            iconView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            iconView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 40),
            iconView.heightAnchor.constraint(equalToConstant: 40),

            friendLabel.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 12),
            friendLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

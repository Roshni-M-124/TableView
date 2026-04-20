//
//  InfoCell.swift
//  profile_section
//
//  Created by Mobicip on 20/04/26.
//

import UIKit

class InfoCell: UITableViewCell {

    let infoLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        infoLabel.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(infoLabel)

        NSLayoutConstraint.activate([
            infoLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

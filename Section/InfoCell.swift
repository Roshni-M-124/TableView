//
//  InfoCell.swift
//  profile_section
//
//  Created by Mobicip on 20/04/26.
//

import UIKit

class InfoCell: UITableViewCell {

    let infoLabel = UILabel()
    let titleLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.adjustsFontForContentSizeCategory = true
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.numberOfLines = 0
        infoLabel.font = UIFont.preferredFont(forTextStyle: .body)
        infoLabel.adjustsFontForContentSizeCategory = true

        contentView.addSubview(titleLabel)
        contentView.addSubview(infoLabel)

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor,constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
            infoLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            infoLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),

            titleLabel.firstBaselineAnchor.constraint(equalToSystemSpacingBelow: contentView.layoutMarginsGuide.topAnchor,multiplier: 1),
            //spacing calculated by system based on fornt size and style by use of baseline anchor and system spacing.
            infoLabel.firstBaselineAnchor.constraint(equalToSystemSpacingBelow: titleLabel.lastBaselineAnchor,multiplier: 1),
            contentView.layoutMarginsGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: infoLabel.lastBaselineAnchor,multiplier: 1)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

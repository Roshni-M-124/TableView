//
//  ProfileCell.swift
//  profile_section
//
//  Created by Mobicip on 20/04/26.
//

import UIKit

class ProfileCell: UITableViewCell {

    let circleView = UIImageView()
    let nameLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        circleView.backgroundColor = .lightGray
        circleView.layer.cornerRadius = 40
        circleView.translatesAutoresizingMaskIntoConstraints = false

        nameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        //for text label use adjustFontForContentSizeCategory and text style to : .headline,.body, .title1, .caption so as user changes system font size this also changes accordingly.
        
        nameLabel.adjustsFontForContentSizeCategory = true
        nameLabel.numberOfLines = 0
        nameLabel.textAlignment = .center
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(circleView)
        contentView.addSubview(nameLabel)

        NSLayoutConstraint.activate([
            circleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            circleView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            circleView.widthAnchor.constraint(equalToConstant: 80),
            circleView.heightAnchor.constraint(equalToConstant: 80),

            nameLabel.topAnchor.constraint(equalTo: circleView.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -20),
            
        ])
        //for self sizing cells, have vertical chaining of elements and top,bottom to content view bottom,trailing and leading to be fixed so as label grows cell grows.

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

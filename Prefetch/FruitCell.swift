//
//  FruitCell.swift
//  fruits
//
//  Created by Mobicip on 24/04/26.
//

import UIKit

class FruitCell: UITableViewCell {
    
    let fruitImage = UIImageView()
    let nameLabel = UILabel()
    let priceLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        fruitImage.translatesAutoresizingMaskIntoConstraints = false
        fruitImage.contentMode = .scaleAspectFill
        fruitImage.clipsToBounds = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .boldSystemFont(ofSize: 16)
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.font = .systemFont(ofSize: 14)
        priceLabel.textColor = .gray
        
        contentView.addSubview(fruitImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            fruitImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            fruitImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            fruitImage.widthAnchor.constraint(equalToConstant: 80),
            fruitImage.heightAnchor.constraint(equalToConstant: 80),
            
            nameLabel.topAnchor.constraint(equalTo: fruitImage.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: fruitImage.trailingAnchor, constant: 12),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            priceLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            fruitImage.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10),
            priceLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        fruitImage.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

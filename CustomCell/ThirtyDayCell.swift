//
//  ThirtyDayCell.swift
//  calendar
//
//  Created by Mobicip on 20/04/26.
//

import UIKit

class ThirtyDayCell:UITableViewCell{
    
    let cellView : UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let dayLabel:UILabel = {
        let label = UILabel()
        label.text = "Day 1"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        contentView.addSubview(cellView)
        cellView.addSubview(dayLabel)
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            cellView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            cellView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])

        dayLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        dayLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
    }
    
}

//
//  TableViewCell.swift
//  TableViewTutorial
//
//  Created by Акбота Бакыт on 15.11.2022.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {
    
    var imageViewCell = UIImageView()
    var titleLabelCell = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(imageViewCell)
        addSubview(titleLabelCell)
        
        configureImageViewCell()
        configureTitleLabelCell()
        
        setImageConstraints()
        setLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(data: AlbumModel) {
//        imageViewCell.image = 
        titleLabelCell.text = data.author
        imageViewCell.image = data.image
    }
    
    func configureImageViewCell() {
        imageViewCell.layer.cornerRadius = 5
        imageViewCell.clipsToBounds = true
    }
    
    func configureTitleLabelCell() {
        titleLabelCell.numberOfLines = 0
        titleLabelCell.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints() {
        imageViewCell.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageViewCell.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageViewCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            imageViewCell.heightAnchor.constraint(equalToConstant: 80),
            imageViewCell.widthAnchor.constraint(equalTo: imageViewCell.heightAnchor, multiplier: 16/9)
        ])
    }
    
    func setLabelConstraints() {
        titleLabelCell.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabelCell.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabelCell.leadingAnchor.constraint(equalTo: imageViewCell.trailingAnchor, constant: 20),
            titleLabelCell.heightAnchor.constraint(equalToConstant: 80),
            titleLabelCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
    }
    
}

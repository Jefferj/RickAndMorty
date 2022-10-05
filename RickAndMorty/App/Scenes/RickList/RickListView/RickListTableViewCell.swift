//
//  RickListTableViewCell.swift
//  RickAndMorty
//
//  Created by Jefferson Naranjo rodríguez on 5/10/22.
//

import Foundation
import UIKit

class RickListTableViewCell : UITableViewCell {
    
    var name : String? {
    didSet {
        rickName.text = name
      }
    }
    
    private lazy var rickImage : UIImageView = {
        let aImage = UIImageView()
        aImage.translatesAutoresizingMaskIntoConstraints = false
        aImage.layer.cornerRadius = 30
        aImage.backgroundColor = .red
        aImage.image = UIImage(named: "RickAndMortyCell")
        return aImage
    }()
    
    private lazy var rickName : UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.textColor = .darkGray
        aLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        return aLabel
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.contentView.backgroundColor = .white
        self.contentView.addSubview(rickImage)
        self.contentView.addSubview(rickName)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            rickImage.heightAnchor
                .constraint(equalToConstant: 60),
            rickImage.widthAnchor.constraint(equalToConstant: 60),
            rickImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            rickImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            rickImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            rickName.leadingAnchor.constraint(equalTo: rickImage.trailingAnchor, constant: 16),
            rickName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            rickName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            rickName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}

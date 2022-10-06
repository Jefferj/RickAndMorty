//
//  RickDetailViewController.swift
//  RickAndMorty
//
//  Created by Jefferson Naranjo rodríguez on 6/10/22.
//

import Foundation
import UIKit

class RickDetailViewController : UIViewController {
    
    private var service = RickDetailService()
    private var viewModel: RickDetailViewModel?
    
    private lazy var backgroundImage: UIImageView = {
        let aImage = UIImageView()
        aImage.translatesAutoresizingMaskIntoConstraints = false
        aImage.image = UIImage(named: "RickDetail")
        aImage.contentMode = .scaleAspectFill
        view.addSubview(aImage)
        return aImage
    }()
    
    private lazy var rickBackground: UIView = {
        let aView = UIView()
        aView.translatesAutoresizingMaskIntoConstraints = false
        aView.layer.cornerRadius = 70.0
        aView.backgroundColor = .white.withAlphaComponent(0.1)
        view.addSubview(aView)
        return aView
    }()
    
    private lazy var rickImage: UIImageView = {
        let aImage = UIImageView()
        aImage.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(aImage, aboveSubview: backgroundImage)
        return aImage
    }()
    
    private lazy var rickName: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.textColor = .white
        aLabel.font = UIFont.systemFont(ofSize: 28)
        aLabel.textAlignment = .center
        view.addSubview(aLabel)
        return aLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        self.viewModel = RickDetailViewModel(service: self.service)
        self.viewModel?.getCharacters {
            self.rickName.text = results.name
        }
    }
    
    private func setupView() {
        self.title = "Rick and morty"
        self.view.backgroundColor = .white
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            rickImage.heightAnchor.constraint(equalToConstant: 140),
            rickImage.widthAnchor.constraint(equalToConstant: 140),
            rickImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rickImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            rickName.topAnchor.constraint(equalTo: rickImage.bottomAnchor, constant: 22),
            rickName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            rickName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            rickBackground.heightAnchor.constraint(equalToConstant: 140),
            rickBackground.widthAnchor.constraint(equalToConstant: 140),
            rickBackground.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rickBackground.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}

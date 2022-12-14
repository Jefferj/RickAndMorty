//
//  RickListViewController.swift
//  RickAndMorty
//
//  Created by Jefferson Naranjo rodríguez on 5/10/22.
//

import Foundation
import UIKit

class RickListViewController : UIViewController {
    
    private var service = RickListService()
    private var viewModel : RickListViewModel?
    
    private lazy var tableView : UITableView = {
        let aTable = UITableView()
        aTable.translatesAutoresizingMaskIntoConstraints = false
        aTable.delegate = self
        aTable.dataSource = self
        aTable.register(RickListTableViewCell.self, forCellReuseIdentifier: String(describing: RickListTableViewCell.self))
        view.addSubview(aTable)
        return aTable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        self.viewModel = RickListViewModel(service: self.service)
        self.viewModel?.getCharacters {
            self.tableView.reloadData()
        }
        
    }
    
    private func setupView() {
        self.title = "Rick and Morty"
        self.view.backgroundColor = .cyan
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupConstraints () {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }
}

extension RickListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = RickDetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension RickListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel?.characters.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RickListTableViewCell.self), for: indexPath) as? RickListTableViewCell else {
            return UITableViewCell()
        }
        if let character = self.viewModel?.characters[indexPath.row] {
            cell.name = character.name
        }
        return cell
    }
}

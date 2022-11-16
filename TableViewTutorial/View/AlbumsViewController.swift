//
//  ViewController.swift
//  TableViewTutorial
//
//  Created by Акбота Бакыт on 15.11.2022.
//

import UIKit

class AlbumsViewController: UIViewController {
    
    private let viewModel = AlbumsViewModel()
    
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        configureConstraints()
        
        fetchInitialData()
    }
    
    func configureTableView() {
        setTableViewDelegates()
        tableView.rowHeight = 100
        tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configureConstraints() {
        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func fetchInitialData() {
        viewModel.fetchAlbums {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
}

extension AlbumsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? AlbumTableViewCell else { return UITableViewCell() }
        cell.set(data: viewModel.data[indexPath.row])
        return cell
    }
}

extension AlbumsViewController {

}


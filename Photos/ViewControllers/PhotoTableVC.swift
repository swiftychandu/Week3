//
//  PhotoTableVC.swift
//  Photos
//
//  Created by chandrasekhar yadavally on 4/5/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit

class PhotoTableVC: UIViewController {

    let tableView = UITableView()
    var photosData: [Photo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        getPhotos()
        configureTableView()
    }
   
    func configure() {
        view.backgroundColor = .systemBackground
        title = "Photos"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
  func configureTableView() {
    view.addSubview(tableView)
    tableView.backgroundColor = .systemBackground
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.rowHeight = 120
    tableView.register(TableViewCell.self, forCellReuseIdentifier: String(describing: TableViewCell.self))
    tableView.dataSource = self
    tableView.delegate = self
    
    NSLayoutConstraint.activate([
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
    }
    
    func getPhotos() {
         NetworkManager.shared.fetchPhotos { [weak self] photos in
             guard let self = self else { return }
             switch photos {
             case .success(let photos):
                self.photosData = photos
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
             case .failure(let error): self.presentAlertOnMainThread(title: "Something Wrong", message: error.rawValue, buttonTitle: "OK")
             }
         }
     }
}

extension PhotoTableVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        photosData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TableViewCell.self), for: indexPath) as! TableViewCell
        cell.set(photo: photosData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = photosData[indexPath.row].url
       showDetailVC(for: item)
        
    }
    
    
}

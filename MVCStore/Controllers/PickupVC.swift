//
//  PickupVC.swift
//  MVCStore
//
//  Created by Fernado Belen on 01/10/2021.
//

import UIKit

class PickupVC: UIViewController {
    
    var list = [Pickup]()
    let httpClient = HTTPClient()
    
    lazy var indicatorView: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView()
        indicatorView.backgroundColor = .white
        indicatorView.hidesWhenStopped = true
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        return indicatorView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        self.indicatorView.startAnimating()
        httpClient.request(urlString: "https://run.mocky.io/v3/030a0039-09aa-4fb8-a1f8-b44efa6e9fb4", method: "GET", completion: {(list: GroupOfPickup?, success: Bool) in
            if success, let list = list?.pickups {
                self.list = list
                self.tableView.reloadData()
            }
            self.indicatorView.stopAnimating()
        })
    }
    
    func setupView(){
        addViewHerarchy()
        addConstraints()
        addProperties()
        addPropertiesView()
    }
    
    func addViewHerarchy(){
        view.addSubview(tableView)
        view.addSubview(indicatorView)
    }
    
    func addConstraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            indicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
    }
    
    func addProperties(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PickupHomeCell.self, forCellReuseIdentifier: "PickupHomeCell")
    }
    
    func addPropertiesView(){
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.separatorColor = .black
        self.title = "Pickups"
    }
}

extension PickupVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PickupHomeCell", for: indexPath) as! PickupHomeCell
        cell.pickup = list[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pickupDetailVC = PickupDetailVC(with: list[indexPath.row])
        pickupDetailVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(pickupDetailVC, animated: true)
    }
}

extension PickupVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
}

//
//  CarsDetailVC.swift
//  MVCStore
//
//  Created by Fernado Belen on 02/10/2021.
//

import UIKit

class CarsDetailVC: UIViewController {
    
    var car: Car
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView(){
        addViewHerarchy()
        addConstraints()
        addProperties()
        addPropertiesView()
    }
    
    func addViewHerarchy(){
        view.addSubview(tableView)
    }
    
    func addConstraints(){
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: view.topAnchor),
                                     tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
    }
    
    func addProperties(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CarDetailCell.self, forCellReuseIdentifier: "CarDetailCell")
    }
    
    func addPropertiesView(){
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    init(with car: Car) {
        self.car = car
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CarsDetailVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CarDetailCell", for: indexPath) as! CarDetailCell
            cell.list = self.car
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension CarsDetailVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}

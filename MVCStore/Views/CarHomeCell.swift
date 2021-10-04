//
//  CarHomeCell.swift
//  MVCStore
//
//  Created by Fernado Belen on 02/10/2021.
//

import UIKit
import SDWebImage

class CarHomeCell: UITableViewCell {
    
    var car: Car! {
        didSet {
            imgPhoto.sd_setImage(with: URL(string: car.img)!, placeholderImage: UIImage(named: "placeholder-image"))
            lblName.text = car.model
            lblDescription.text = car.description
        }
    }
    
    private lazy var imgPhoto: UIImageView = {
        let imgPhoto = UIImageView()
        imgPhoto.translatesAutoresizingMaskIntoConstraints = false
        return imgPhoto
    }()
    
    private lazy var lblName: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 23)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lblDescription: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .gray
        label.font = .systemFont(ofSize: 15)
        label.numberOfLines = 0
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
        addViewHerarchy()
        addConstraints()
    }
    
    func addViewHerarchy(){
        addSubview(imgPhoto)
        addSubview(lblName)
        addSubview(lblDescription)
    }
    
    func addConstraints(){
        NSLayoutConstraint.activate([imgPhoto.topAnchor.constraint(equalTo: topAnchor, constant: 20),
                                     imgPhoto.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                                     imgPhoto.heightAnchor.constraint(equalToConstant: imageheigth),
                                     imgPhoto.widthAnchor.constraint(equalToConstant: imageWith),
                                     
                                     lblName.topAnchor.constraint(equalTo: topAnchor, constant: 20),
                                     lblName.leadingAnchor.constraint(equalTo: imgPhoto.trailingAnchor, constant: 20),
                                     lblName.heightAnchor.constraint(equalToConstant: 30),
                                     
                                     lblDescription.topAnchor.constraint(equalTo: lblName.bottomAnchor, constant: 10),
                                     lblDescription.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
                                     lblDescription.leadingAnchor.constraint(equalTo: imgPhoto.trailingAnchor, constant: 20),
                                     lblDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)])
    }
}

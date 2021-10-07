//
//  PickupHomeCell.swift
//  MVCStore
//
//  Created by Fernado Belen on 02/10/2021.
//

import UIKit
import SDWebImage

class PickupHomeCell: UITableViewCell {
    
    var pickup: Pickup! {
        didSet {
            imgPhoto.sd_setImage(with: URL(string: pickup.img)!, placeholderImage: UIImage(named: "placeholder-image"))
            lblName.text = pickup.model
            lblDescription.text = pickup.description
        }
    }
    
    let cellView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = CGFloat(16)
        view.layer.masksToBounds = true
        view.backgroundColor = .quaternarySystemFill
        view.layer.borderColor = CGColor(red: 232, green: 232, blue: 232, alpha: 0.7)
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imgPhoto: UIImageView = {
        let imgPhoto = UIImageView()
        imgPhoto.layer.cornerRadius = imageWith/20
        imgPhoto.layer.masksToBounds = true
        imgPhoto.translatesAutoresizingMaskIntoConstraints = false
        return imgPhoto
    }()
    
    private lazy var lblName: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 25)
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
        addSubview(cellView)
        cellView.addSubview(imgPhoto)
        cellView.addSubview(lblName)
        cellView.addSubview(lblDescription)
    }
    
    func addConstraints(){
        NSLayoutConstraint.activate([cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
                                     cellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
                                     cellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
                                     cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                                     imgPhoto.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 25),
                                     imgPhoto.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),
                                     imgPhoto.heightAnchor.constraint(equalToConstant: imageheigth),
                                     imgPhoto.widthAnchor.constraint(equalToConstant: imageWith),
                                     
                                     lblName.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 20),
                                     lblName.leadingAnchor.constraint(equalTo: imgPhoto.trailingAnchor, constant: 10),
                                     lblName.heightAnchor.constraint(equalToConstant: 30),
                                     
                                     lblDescription.topAnchor.constraint(equalTo: lblName.bottomAnchor, constant: 10),
                                     lblDescription.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -30),
                                     lblDescription.leadingAnchor.constraint(equalTo: imgPhoto.trailingAnchor, constant: 10),
                                     lblDescription.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -20)])
    }
}

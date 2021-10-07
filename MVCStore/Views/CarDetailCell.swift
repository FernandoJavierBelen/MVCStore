//
//  CarDetailCell.swift
//  MVCStore
//
//  Created by Fernado Belen on 02/10/2021.
//

import UIKit
import SDWebImage

class CarDetailCell: UITableViewCell {
    
    var list: Car! {
        didSet{
            imgPhoto.sd_setImage(with: URL(string: list.img), placeholderImage: UIImage(named: "placeholder-image"))
            lblModel.text = list.model
            lblMotor.text = list.motor
            lblYear.text = "\(list.year)"
            lblDescription.text = list.description
        }
    }
    
    private lazy var imgPhoto: UIImageView = {
        let imgPhoto = UIImageView()
        imgPhoto.layer.cornerRadius = imgWith/20
        imgPhoto.layer.masksToBounds = true
        imgPhoto.translatesAutoresizingMaskIntoConstraints = false
        return imgPhoto
    }()
    
    private lazy var lblModel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lblMotor: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lblYear: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lblDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Etiquetas
    private lazy var lblMotorTitle: UILabel = {
        let label = UILabel()
        label.text = String.lblMotorTitle
        label.textColor = .gray
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lblYearTitle: UILabel = {
        let label = UILabel()
        label.text = String.lblYearTitle
        label.textColor = .gray
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lblDescriptionTitle: UILabel = {
        let label = UILabel()
        label.text = String.lblDescriptionTitle
        label.textColor = .gray
        label.font = .systemFont(ofSize: 16)
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
        addSubview(lblModel)
        addSubview(lblMotor)
        addSubview(lblYear)
        addSubview(lblDescription)
        addSubview(lblMotorTitle)
        addSubview(lblYearTitle)
        addSubview(lblDescriptionTitle)
    }
    
    func addConstraints(){
        NSLayoutConstraint.activate([lblModel.topAnchor.constraint(equalTo: topAnchor, constant: -50),
                                     lblModel.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     lblModel.heightAnchor.constraint(equalToConstant: 35),
                                     
                                     imgPhoto.topAnchor.constraint(equalTo: lblModel.bottomAnchor, constant: 25),
                                     imgPhoto.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 30),
                                     imgPhoto.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -30),
                                     imgPhoto.heightAnchor.constraint(equalToConstant: imgHeith),
                                     imgPhoto.widthAnchor.constraint(equalToConstant: imgWith),
                                     
                                     lblMotorTitle.topAnchor.constraint(equalTo: imgPhoto.bottomAnchor, constant: 20),
                                     lblMotorTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
                                     lblMotorTitle.heightAnchor.constraint(equalToConstant: 20),
                                     
                                     lblMotor.topAnchor.constraint(equalTo: imgPhoto.bottomAnchor, constant: 20),
                                     lblMotor.leadingAnchor.constraint(equalTo: lblMotorTitle.trailingAnchor, constant: 5),
                                     lblMotor.heightAnchor.constraint(equalToConstant: 20),
                                     
                                     lblYearTitle.topAnchor.constraint(equalTo: lblMotorTitle.bottomAnchor, constant: 20),
                                     lblYearTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
                                     lblYearTitle.heightAnchor.constraint(equalToConstant: 20),
                                     
                                     lblYear.topAnchor.constraint(equalTo: lblMotor.bottomAnchor, constant: 20),
                                     lblYear.leadingAnchor.constraint(equalTo: lblYearTitle.trailingAnchor, constant: 15),
                                     lblYear.heightAnchor.constraint(equalToConstant: 20),
                                     
                                     lblDescriptionTitle.topAnchor.constraint(equalTo: lblYearTitle.bottomAnchor, constant: 30),
                                     lblDescriptionTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
                                     lblDescriptionTitle.heightAnchor.constraint(equalToConstant: 20),
                                     
                                     lblDescription.topAnchor.constraint(equalTo: lblDescriptionTitle.bottomAnchor, constant: 20),
                                     lblDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
                                     lblDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
                                     lblDescription.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)])
    }
}

fileprivate extension String {
    static var lblModelTitle = "Model: "
    static var lblMotorTitle = "Motor: "
    static var lblYearTitle = "Year: "
    static var lblDescriptionTitle = "Description: "
}

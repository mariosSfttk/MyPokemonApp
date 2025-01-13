//
//  PokemonCell.swift
//  MyPokemon
//
//  Created by Mario Vargas on 11/01/25.
//

import UIKit

class PokemonCell: UITableViewCell {
    var generalView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        view.layer.borderWidth = 2
        view.backgroundColor = .colorCellBG
        return view
    }()
    
    var circleView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .colorBackground
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 1
        return view
    }()
    
    var imgPokemon: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var lblName: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    ///constraints
    func generalViewConstraints() {
        NSLayoutConstraint.activate([
            generalView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            generalView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            generalView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            generalView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
        ])
    }
    
    func circleViewContraints() {
        NSLayoutConstraint.activate([
            circleView.leadingAnchor.constraint(equalTo: generalView.leadingAnchor, constant: 12),
            circleView.topAnchor.constraint(equalTo: generalView.topAnchor, constant: 16),
            circleView.bottomAnchor.constraint(equalTo: generalView.bottomAnchor, constant: -16),
            circleView.heightAnchor.constraint(equalToConstant: 40),
            circleView.widthAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    func imgPokemonConstraints() {
        NSLayoutConstraint.activate([
            imgPokemon.topAnchor.constraint(equalTo: generalView.topAnchor, constant: 4),
            imgPokemon.bottomAnchor.constraint(equalTo: generalView.bottomAnchor, constant: -4),
            imgPokemon.leadingAnchor.constraint(equalTo: generalView.leadingAnchor, constant: 4),
            imgPokemon.widthAnchor.constraint(equalToConstant: 60),
            imgPokemon.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    func labelNameConstraints() {
        NSLayoutConstraint.activate([
            lblName.leadingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: 24),
            lblName.trailingAnchor.constraint(equalTo: generalView.trailingAnchor, constant: 12),
            lblName.topAnchor.constraint(equalTo: generalView.topAnchor, constant: 12),
            lblName.centerYAnchor.constraint(equalTo: generalView.centerYAnchor),
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        contentView.backgroundColor = .colorBackground
        addSubview(generalView)
        generalView.addSubview(circleView)
        generalView.addSubview(imgPokemon)
        generalView.addSubview(lblName)
        generalViewConstraints()
        circleViewContraints()
        imgPokemonConstraints()
        labelNameConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(data: Results) {
        lblName.text = data.name
        let components = data.url.components(separatedBy: "/")
        let number = components[components.count - 2]        
        getImage(forUrl: String(format: "%@%@.png", URL_FOR_IMAGE, number)) { image in
            self.imgPokemon.image = image as UIImage
        }
    }
}

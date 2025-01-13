//
//  PokemonCellTableViewCell.swift
//  MyPokemon
//
//  Created by JESSICA OLIVERA on 09/01/25.
//

import UIKit

class PokemonCell: UITableViewCell {
    var generalView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        view.layer.borderWidth = 2
        view.backgroundColor = .yellow
        return view
    }()
    
    var circleView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 1
        return view
    }()
    
    var imgPokemon: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
//        image.image = UIImage(systemName: "questionmark")
        return image
    }()
    
    var lblName: UILabel = {
       let label = UILabel()
        return label
    }()
    
    ///constraints
    func generalViewConstraints() {
        generalView.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        generalView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        generalView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        generalView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func circleViewContraints() {
        circleView.leadingAnchor.constraint(equalTo: generalView.leadingAnchor, constant: 12).isActive = true
        circleView.topAnchor.constraint(equalTo: generalView.topAnchor, constant: 16).isActive = true
        circleView.bottomAnchor.constraint(equalTo: generalView.bottomAnchor, constant: -16).isActive = true
        circleView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        circleView.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func imgPokemonConstraints() {
        imgPokemon.topAnchor.constraint(equalTo: generalView.topAnchor, constant: 4).isActive = true
        imgPokemon.bottomAnchor.constraint(equalTo: generalView.bottomAnchor, constant: -4).isActive = true
        imgPokemon.leadingAnchor.constraint(equalTo: generalView.leadingAnchor, constant: 4).isActive = true
        imgPokemon.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imgPokemon.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func labelNameConstraints() {
        lblName.translatesAutoresizingMaskIntoConstraints = false
        lblName.leadingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: 24).isActive = true
        lblName.trailingAnchor.constraint(equalTo: generalView.trailingAnchor, constant: 12).isActive = true
        lblName.topAnchor.constraint(equalTo: generalView.topAnchor, constant: 12).isActive = true
        lblName.centerYAnchor.constraint(equalTo: generalView.centerYAnchor).isActive = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
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
        getImage(front: String(format: "%@%@.png", URL_FOR_IMAGE, number))
    }
    
    func getImage(front: String) {
        DispatchQueue.global(qos: .background).async {
            let imgUrl = NSURL( string: front)
            let imageData = NSData(contentsOf: imgUrl! as URL)
            DispatchQueue.main.async {
                self.imgPokemon.image = UIImage.init(data: imageData! as Data)
            }
        }
        
    }
}

//
//  DetailView.swift
//  MyPokemon
//
//  Created by Mario Vargas on 11/01/25.
//

import UIKit

class DetailView: UIViewController {
    
    var safeView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .colorHeader
        return view
    }()
    
    lazy var btnBack: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didPressBack), for: .touchUpInside)
        btn.setImage(UIImage(systemName: Strings.Icons.backArrow)?.withTintColor(.colorBackground, renderingMode: .alwaysOriginal), for: .normal)
        return btn
    }()
    
    var scrollView: UIScrollView = {
       let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .clear
        return scroll
    }()
    
    var contentView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var lblPokemonName: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 24)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    var lblPokemonNumber: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 24)
        lbl.numberOfLines = 0
        lbl.textAlignment = .right
        return lbl
    }()
    
    lazy var normalSpriteView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()
    
    lazy var shinySpriteView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()
    
    var lblStats: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 22)
        lbl.text = Strings.DetailScreen.stats
        return lbl
    }()
    
    var lblStatsValues: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        return lbl
    }()
    
    lazy var btnGetType: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didPressType), for: .touchUpInside)
        btn.setTitle(Strings.DetailScreen.btnType, for: .normal)
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    var pokemonName: String?
    var detailViewModel = DetailViewModel()
    var delegate: InitViewProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addingSubViews()
        setupComponentsView()
        view.backgroundColor = .colorBackground
        Loader.sharedInstance.showIndicator(view: self)
        detailViewModel.getPokemonInfo(pokemon: pokemonName!)
        binding()
    }
    
    
    @objc func didPressBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func didPressType() {
        delegate?.invokeFromDetail(type: detailViewModel.getPokemonType())
        navigationController?.popViewController(animated: true)
    }
    
    
    func binding() {
        self.detailViewModel.refreshData = { [weak self] in
            DispatchQueue.main.async { [weak self] in
                self!.lblPokemonName.text = self!.detailViewModel.getPokemonName()
                self!.lblPokemonNumber.text = self!.detailViewModel.getPokemonNumber()
                self!.lblStatsValues.text = self!.detailViewModel.getStats()
                getImage(forUrl: (self?.detailViewModel.pokemonDetailInfo?.sprites.front_default)!) { myImage in
                    self?.normalSpriteView.image = myImage as UIImage
                }
                getImage(forUrl: (self?.detailViewModel.pokemonDetailInfo?.sprites.front_shiny)!) { myImage in
                    self?.shinySpriteView.image = myImage as UIImage
                }
                self!.btnGetType.backgroundColor = self!.detailViewModel.getBtnColor()
                Loader.sharedInstance.hideIndicator()
            }
        }
    }

}

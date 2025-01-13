//
//  InitView.swift
//  MyPokemon
//
//  Created by Mario Vargas on 11/01/25.
//

import UIKit

protocol InitViewProtocol {
    func invokeFromDetail(type: String)
}

class InitView: UIViewController, InitViewProtocol {
    
    var headerView: UIView = {
      let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .colorHeader
        return view
    }()
    
    lazy var segmentedControl: UISegmentedControl = {
        let segmented = UISegmentedControl(items: [Strings.InitScreen.optionName, Strings.InitScreen.optionType])
        segmented.translatesAutoresizingMaskIntoConstraints = false
        segmented.addTarget(self, action: #selector(didChangeSegmented), for: .valueChanged)
        segmented.backgroundColor = .colorSegmented
        segmented.selectedSegmentIndex = 0
        return segmented
    }()
    
    var iconSearch: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = UIImage(systemName: Strings.Icons.magnifyingglassIcon)
        imgView.backgroundColor = .colorSearchBg
        imgView.tintColor = .colorHeader
        imgView.layer.cornerRadius = 8
        imgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        imgView.layer.borderWidth = 2
        imgView.layer.borderColor = UIColor.colorSearchBg.cgColor
        return imgView
    }()
    
    lazy var btnSearch: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didPressSearch), for: .touchUpInside)
        return btn
    }()
    
    lazy var txtSearch: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.borderStyle = .roundedRect
        txt.font = UIFont.systemFont(ofSize: 18)
        txt.placeholder = Strings.InitScreen.searchByName
        txt.addTarget(self, action: #selector(updateTextField), for: .editingChanged)
        return txt
    }()
        
    var tblPokemon: UITableView = {
      let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.allowsSelection = true
        table.separatorStyle = .none
        table.register(PokemonCell.self, forCellReuseIdentifier: "Cell")
        table.backgroundColor = .colorBackground
        return table
    }()
    
    var initViewModel = InitViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        addingSubViews()
        setupComponentsView()
        configureTable()
        Loader.sharedInstance.showIndicator(view: self)
        initViewModel.getInitData()
        binding()
        view.backgroundColor = .colorBackground
    }
    
    @objc
    func updateTextField(_ textField: UITextField) {
    }
    
    @objc
    func didChangeSegmented(_ segmented: UISegmentedControl) {
        txtSearch.placeholder = segmented.selectedSegmentIndex == 0 ? Strings.InitScreen.searchByName: Strings.InitScreen.searchByType
    }
    
    @objc
    func didPressSearch() {
        Loader.sharedInstance.showIndicator(view: self)
        dismissKeyboard()
        guard let toSearch = txtSearch.text, toSearch != "" else {
            initViewModel.getInitData()
            return
        }
        txtSearch.text = ""
        if segmentedControl.selectedSegmentIndex == 0 {
            initViewModel.getDataByName(toSearch: toSearch)
        } else {
            initViewModel.getDataByType(toSearch: toSearch)
        }
    }
    
    @objc
    func viewWasTapped() {
        dismissKeyboard()
    }
    
    func binding() {
        self.initViewModel.refreshData = { [weak self] in
            DispatchQueue.main.async {
                self?.tblPokemon.reloadData()
                Loader.sharedInstance.hideIndicator()
            }
        }
    }
    
    func invokeFromDetail(type: String) {
        initViewModel.getDataByType(toSearch: type)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }

}

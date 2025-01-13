//
//  InitFacade.swift
//  MyPokemon
//
//  Created by Mario Vargas on 11/01/25.
//

import Foundation
import UIKit

extension InitView {
    
    func addingSubViews() {
        view.addSubview(headerView)
        view.addSubview(segmentedControl)
        view.addSubview(txtSearch)
        view.addSubview(iconSearch)
        view.addSubview(btnSearch)
        
        view.addSubview(tblPokemon)
    }
    
    func setupComponentsView() {
        setHeaderConstraints()
        setSegmentedConstraints()
        setIconSearchConstraints()
        setBtnSearchConstraints()
        setTxtSearchConstraints()
        setTableConstraints()
    }
    
    func setHeaderConstraints() {
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 41),
        ])
    }
    
    func setSegmentedConstraints() {
        NSLayoutConstraint.activate([
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentedControl.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12),
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func setIconSearchConstraints() {
        NSLayoutConstraint.activate([
            iconSearch.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 15),
            iconSearch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            iconSearch.trailingAnchor.constraint(equalTo: txtSearch.leadingAnchor, constant: 3),
            iconSearch.heightAnchor.constraint(equalToConstant: 36),
            iconSearch.widthAnchor.constraint(equalToConstant: 37),
        ])
    }
    
    func setBtnSearchConstraints() {
        NSLayoutConstraint.activate([
            btnSearch.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 15),
            btnSearch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            btnSearch.trailingAnchor.constraint(equalTo: txtSearch.leadingAnchor, constant: 3),
            btnSearch.heightAnchor.constraint(equalToConstant: 36),
            btnSearch.widthAnchor.constraint(equalToConstant: 37),
        ])
    }
    
    func setTxtSearchConstraints() {
        NSLayoutConstraint.activate([
            txtSearch.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 16),
            view.trailingAnchor.constraint(equalTo: txtSearch.trailingAnchor, constant: 16)
        ])
    }
    
    func setTableConstraints() {
        NSLayoutConstraint.activate([
            tblPokemon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            view.trailingAnchor.constraint(equalTo: tblPokemon.trailingAnchor, constant: 12),
            tblPokemon.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 12),
            tblPokemon.topAnchor.constraint(equalTo: txtSearch.bottomAnchor, constant: 20)
        ])
    }
}

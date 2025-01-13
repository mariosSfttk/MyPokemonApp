//
//  DetailFacade.swift
//  MyPokemon
//
//  Created by Mario Vargas on 11/01/25.
//

import Foundation
import UIKit

extension DetailView {
    
    func addingSubViews() {
        view.addSubview(safeView)
        safeView.addSubview(btnBack)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(lblPokemonName)
        contentView.addSubview(lblPokemonNumber)
        contentView.addSubview(normalSpriteView)
        contentView.addSubview(shinySpriteView)
        contentView.addSubview(lblStats)
        contentView.addSubview(lblStatsValues)
        
        view.addSubview(btnGetType)
    }
    
    func setupComponentsView() {
        setSafeViewConstraints()
        setBtnBackConstraints()
        setScrollViewConstraints()
        setContentViewConstraints()
        setLblPokemonNameConstraints()
        setLblPokemonNumberConstraints()
        setNormalSpriteConstraints()
        setShinySpriteConstraints()
        setLblStatsConstraints()
        setLblStatsValuesConstraints()
        
        setBtnGetTypeConstraints()
    }
    
    func setSafeViewConstraints() {
        NSLayoutConstraint.activate([
            safeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            safeView.topAnchor.constraint(equalTo: view.topAnchor),
            safeView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            safeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 41),
        ])
    }
    
    func setBtnBackConstraints() {
        NSLayoutConstraint.activate([
            btnBack.leadingAnchor.constraint(equalTo: safeView.leadingAnchor, constant: 12),
            btnBack.topAnchor.constraint(equalTo: safeView.safeAreaLayoutGuide.topAnchor, constant: 0),
            btnBack.heightAnchor.constraint(equalToConstant: 41),
        ])
    }
    
    func setScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeView.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func setContentViewConstraints() {
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
    }
    
    func setLblPokemonNameConstraints() {
        NSLayoutConstraint.activate([
            lblPokemonName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            lblPokemonName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
        ])
    }
    
    func setLblPokemonNumberConstraints() {
        NSLayoutConstraint.activate([
            lblPokemonNumber.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            lblPokemonNumber.leadingAnchor.constraint(equalTo: lblPokemonName.trailingAnchor, constant: 4),
            contentView.trailingAnchor.constraint(equalTo: lblPokemonNumber.trailingAnchor, constant: 12),
        ])
    }
    
    func setNormalSpriteConstraints() {
        NSLayoutConstraint.activate([
            normalSpriteView.topAnchor.constraint(equalTo: lblPokemonName.bottomAnchor, constant: 8),
            normalSpriteView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            normalSpriteView.widthAnchor.constraint(equalToConstant: 200),
            normalSpriteView.heightAnchor.constraint(equalTo: normalSpriteView.widthAnchor, multiplier: 1, constant: 1),
        ])
    }
    
    func setShinySpriteConstraints() {
        NSLayoutConstraint.activate([
            shinySpriteView.bottomAnchor.constraint(equalTo: normalSpriteView.bottomAnchor),
            shinySpriteView.leadingAnchor.constraint(equalTo: normalSpriteView.leadingAnchor),
            shinySpriteView.heightAnchor.constraint(equalTo: shinySpriteView.widthAnchor, multiplier: 1, constant: 1),
        ])
    }
    
    func setLblStatsConstraints() {
        NSLayoutConstraint.activate([
            lblStats.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            lblStats.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            lblStats.topAnchor.constraint(equalTo: shinySpriteView.bottomAnchor, constant: 12),
        ])
    }
    
    func setLblStatsValuesConstraints() {
        NSLayoutConstraint.activate([
            lblStatsValues.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            lblStatsValues.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            lblStatsValues.topAnchor.constraint(equalTo: lblStats.bottomAnchor, constant: 12),
        ])
    }
    
    func setBtnGetTypeConstraints() {
        NSLayoutConstraint.activate([
            btnGetType.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            btnGetType.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            btnGetType.topAnchor.constraint(equalTo: lblStatsValues.bottomAnchor, constant: 12),
            btnGetType.heightAnchor.constraint(equalToConstant: 43),
        ])
    }
}

//
//  LoginFacade.swift
//  MyPokemon
//
//  Created by Mario Vargas on 11/01/25.
//

import Foundation
import UIKit


extension LoginView {
    func addingSubViews() {
        view.addSubview(imgLogo)
        view.addSubview(txtUserName)
        view.addSubview(txtPassword)
        view.addSubview(btnLogin)
        view.addSubview(lblNotUser)
        view.addSubview(btnCreateAccount)
    }
    
    func setupComponentsView() {
        setImgLogoConstraints()
        setTxtUserNameConstraints()
        setTxtPasswordConstraints()
        setBtnLoginConstraints()
        setLblNotUserConstraints()
        setBtnCreateAccountsConstraints()
    }
    
    func setImgLogoConstraints() {
        NSLayoutConstraint.activate([
            imgLogo.bottomAnchor.constraint(equalTo: txtUserName.topAnchor, constant: -20),
            imgLogo.widthAnchor.constraint(equalToConstant: 180),
            imgLogo.heightAnchor.constraint(equalTo: imgLogo.widthAnchor, multiplier: 1/1, constant: 0),
            imgLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func setTxtUserNameConstraints(){
        NSLayoutConstraint.activate([
            txtUserName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            txtUserName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            txtUserName.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            txtUserName.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    func setTxtPasswordConstraints(){
        txtPassword.isSecureTextEntry = true
        NSLayoutConstraint.activate([
            txtPassword.leadingAnchor.constraint(equalTo: txtUserName.leadingAnchor),
            txtPassword.widthAnchor.constraint(equalTo: txtUserName.widthAnchor),
            txtPassword.topAnchor.constraint(equalTo: txtUserName.bottomAnchor, constant: 8),
            txtPassword.heightAnchor.constraint(equalTo: txtUserName.heightAnchor)
        ])
    }
    
    func setBtnLoginConstraints(){
        NSLayoutConstraint.activate([
            btnLogin.leadingAnchor.constraint(equalTo: txtPassword.leadingAnchor),
            btnLogin.widthAnchor.constraint(equalTo: txtPassword.widthAnchor),
            btnLogin.topAnchor.constraint(equalTo: txtPassword.bottomAnchor, constant: 20),
            btnLogin.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func setLblNotUserConstraints(){
        NSLayoutConstraint.activate([
            lblNotUser.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lblNotUser.topAnchor.constraint(greaterThanOrEqualTo: btnLogin.bottomAnchor, constant: 40),
            lblNotUser.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func setBtnCreateAccountsConstraints(){
        NSLayoutConstraint.activate([
            btnCreateAccount.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            btnCreateAccount.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnCreateAccount.topAnchor.constraint(equalTo: lblNotUser.bottomAnchor, constant: 4),
            view.bottomAnchor.constraint(greaterThanOrEqualTo: view.bottomAnchor, constant: 40),
        ])
    }
}

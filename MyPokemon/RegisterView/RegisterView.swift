//
//  RegisterView.swift
//  MyPokemon
//
//  Created by Mario Vargas on 11/01/25.
//

import UIKit

class RegisterView: UIViewController {
    
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
    
    var lblTitleHeader: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = Strings.RegisterScreen.titleHeader
        lbl.textColor = .colorBackground
        return lbl
    }()
    
    var lblDescription: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = Strings.RegisterScreen.descriptionText
        lbl.numberOfLines = 0
        return lbl
    }()
    
    lazy var txtUserName: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.borderStyle = .roundedRect
        txt.font = UIFont.systemFont(ofSize: 18)
        txt.addTarget(self, action: #selector(updateTextField), for: .editingChanged)
        return txt
    }()
    
    var lblName: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = Strings.RegisterScreen.nameLabel
        return lbl
    }()
    
    lazy var txtPassword: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.borderStyle = .roundedRect
        txt.font = UIFont.systemFont(ofSize: 18)
        txt.addTarget(self, action: #selector(updateTextField), for: .editingChanged)
        return txt
    }()
    
    var lblPassword: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = Strings.RegisterScreen.passLabel
        lbl.textAlignment = .left
        return lbl
    }()
    
    lazy var btnSend: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didPressSend), for: .touchUpInside)
        btn.setTitle(Strings.RegisterScreen.sendBtn, for: .normal)
        btn.backgroundColor = .colorInactiveButton
        btn.layer.cornerRadius = 5
        btn.isEnabled = false
        return btn
    }()
    
    var registerViewModel = RegisterViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        addingSubViews()
        setupComponentsView()
        
        view.backgroundColor = .colorBackground
    }
    
    @objc func didPressBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func didPressSend() {
        Loader.sharedInstance.showIndicator(view: self)
        if let user = txtUserName.text, let pass = txtPassword.text, user != "", pass != "" {
            if registerViewModel.registerUserWasSuccess(name: user, pass: pass) {
                showAlert()
            }
        }
    }
    
    @objc func updateTextField(_ textField: UITextField) {
        let isValid = txtPassword.text!.count > 0 && txtUserName.text!.count > 0
        btnSend.isEnabled = isValid
        btnSend.backgroundColor = isValid ? .colorActiveButton: .colorInactiveButton
    }
    
    func showAlert() {
        AlertHelpper.showAlert(parent: self, title: Strings.RegisterScreen.congrats, message: Strings.RegisterScreen.successRegister,twoButtons: false, completionOk:  {
            self.navigationController?.popViewController(animated: true)
        })
    }
}

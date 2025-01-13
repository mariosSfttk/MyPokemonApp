//
//  LoginView.swift
//  MyPokemon
//
//  Created by Mario Vargas on 11/01/25.
//

import UIKit

class LoginView: UIViewController {
    
    var imgLogo: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: Strings.Icons.loginLogo)
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    lazy var txtUserName: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.borderStyle = .roundedRect
        txt.font = UIFont.systemFont(ofSize: 18)
        txt.placeholder = Strings.LoginScreen.userPlaceHolder
        txt.addTarget(self, action: #selector(updateTextField), for: .editingChanged)
        return txt
    }()
    
    lazy var txtPassword: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.borderStyle = .roundedRect
        txt.isSecureTextEntry = true
        txt.font = UIFont.systemFont(ofSize: 18)
        txt.placeholder = Strings.LoginScreen.passwordPlaceHolder
        txt.addTarget(self, action: #selector(updateTextField), for: .editingChanged)
        return txt
    }()
    
    lazy var btnLogin: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didPressLogin), for: .touchUpInside)
        btn.setTitle(Strings.LoginScreen.btnLogin, for: .normal)
        btn.backgroundColor = .colorInactiveButton
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    var lblNotUser: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = Strings.LoginScreen.notRegistered
        lbl.textAlignment = .center
        return lbl
    }()
    
    lazy var btnCreateAccount: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didPressCreateAccount), for: .touchUpInside)
        btn.setTitle(Strings.LoginScreen.createAccount, for: .normal)
        btn.setTitleColor(.colorLinkButton, for: .normal)
        return btn
    }()
    
    var loginViewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addingSubViews()
        setupComponentsView()
        view.backgroundColor = .colorBackground
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc
    func didPressLogin() {
        Loader.sharedInstance.showIndicator(view: self)
        guard let user = txtUserName.text, let pass = txtPassword.text, user != "", pass != "" else {
            self.showAlert(true)
            return
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.txtUserName.text = ""
            self.txtPassword.text = ""
            self.btnLogin.isEnabled = false
            self.btnLogin.backgroundColor = .colorInactiveButton
            
            Loader.sharedInstance.hideIndicator()
            
            if self.loginViewModel.validateUser(loginUser: LoginUser(name: user, password: pass)) {
                self.navigationController?.pushViewController(InitView(), animated: true)
            } else {
                self.showAlert(false)
            }
            
        }
    }
    
    @objc
    func didPressCreateAccount() {
        self.navigationController?.pushViewController(RegisterView(), animated: true)
    }
    
    @objc func updateTextField(_ textField: UITextField) {
        let isValid = txtPassword.text!.count > 0 && txtUserName.text!.count > 0
        btnLogin.isEnabled = isValid
        btnLogin.backgroundColor = isValid ? .colorActiveButton : .colorInactiveButton
    }
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showAlert(_ isEmpty: Bool) {
        AlertHelpper.showAlert(parent: self, title: Strings.LoginScreen.alertError, message: isEmpty ? Strings.LoginScreen.emptyFields: Strings.LoginScreen.wrongInformation, completionOk:  {
            Loader.sharedInstance.hideIndicator()
            self.navigationController?.popViewController(animated: true)
        })
    }

}

//
//  SigninViewController.swift
//  iOS_market
//
//  Created by Nazym Sayakhmet on 20.10.2023.
//

import UIKit
import SnapKit

class SigninViewController: UIViewController {
    let registeredUserName = "qwerty"
    let registeredPassword = "Qwerty23#"
    
    let logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "smallLogo")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let userName: TextFieldDelegate = {
        let textField = TextFieldDelegate()
        textField.setPlaceholderText(text: "Имя пользователя")
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        return textField
    }()
    
    let lineView: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
        line.contentMode = .scaleToFill
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    let passwordTextField: TextFieldDelegate = {
        let textField = TextFieldDelegate()
        textField.setPlaceholderText(text: "Пароль")
        textField.isSecureTextEntry = true
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        return textField
    }()
    
    let lineView1: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
        line.contentMode = .scaleToFill
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    let showPasswordButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "eye-disable"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
        return button
    }()
    
    let signinButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.configureButton()
        button.addTarget(self, action: #selector(signinTouched), for: .touchUpInside)
        return button
    }()
    
    let signupButton: UIButton = {
        let button = UIButton()
        button.setTitle("Зарегистрироваться", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(UIColor(red: 84/255, green: 88/255, blue: 234/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "GothamPro-Medium", size: 14)
        button.addTarget(self, action: #selector(signupTouched), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = " "
        //navigationController?.customize()
        setupViews()
    }
    
    func setupViews() {
        setupLogo()
        setupName()
        setupLine()
        setupPassword()
        setupLine1()
        setupShowPassword()
        setupSignin()
        setupSignup()
    }
    
    func setupLogo() {
        view.addSubview(logoImage)
        logoImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
        
        }
    }
    
    func setupName() {
        view.addSubview(userName)
        userName.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(100)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
    }
    
    func setupLine() {
        view.addSubview(lineView)
        lineView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(userName)
            make.top.equalTo(userName.snp.bottom).offset(6)
            make.height.equalTo(0.5)
        }
    }
    
    func setupPassword() {
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(userName)
            make.top.equalTo(lineView.snp.bottom).offset(32)
        }
    }
    
    func setupLine1() {
        view.addSubview(lineView1)
        lineView1.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(userName)
            make.top.equalTo(passwordTextField.snp.bottom).offset(6)
            make.height.equalTo(0.5)
        }
    }
    
    func setupShowPassword() {
        view.addSubview(showPasswordButton)
        showPasswordButton.snp.makeConstraints { make in
            make.size.equalTo(24)
            make.trailing.equalTo(passwordTextField.snp.trailing)
            make.bottom.equalTo(lineView1.snp.top).offset(-6)
        }
    }
    
    func setupSignin() {
        signinButton.isEnabled = false
        view.addSubview(signinButton)
        signinButton.snp.makeConstraints { make in
            make.top.equalTo(lineView1.snp.bottom).offset(82)
            make.horizontalEdges.equalTo(userName)
            make.height.equalTo(44)
        }
    }
    
    func setupSignup() {
        view.addSubview(signupButton)
        signupButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
            make.horizontalEdges.equalTo(userName)
            make.height.equalTo(44)
        }
    }
    
    @objc func showPassword() {
        let isPasswordFieldEmpty = passwordTextField.text?.isEmpty ?? true
        
        if !isPasswordFieldEmpty {
            passwordTextField.isSecureTextEntry.toggle()
            if passwordTextField.isSecureTextEntry {
                showPasswordButton.setImage(UIImage(named: "eye-disable"), for: .normal)
            } else {
                showPasswordButton.setImage(UIImage(named: "eye"), for: .normal)
            }
        }
    }
    
    @objc func textFieldDidChange() {
        let isUserNameFieldEmpty = userName.text?.isEmpty ?? true
        let isPasswordFieldEmpty = passwordTextField.text?.isEmpty ?? true
        
        if !isUserNameFieldEmpty && !isPasswordFieldEmpty {
            signinButton.isEnabled = true
            signinButton.backgroundColor = UIColor(red: 84/255, green: 88/255, blue: 234/255, alpha: 1)
        } else {
            signinButton.isEnabled = false
            signinButton.backgroundColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
        }
    }
    
    @objc func signinTouched() {
        if userName.text?.lowercased() == registeredUserName && passwordTextField.text == registeredPassword {
            let profileVC = ProfileViewController()
            profileVC.modalPresentationStyle = .overFullScreen
            present(profileVC, animated: true)
        } else {
            signinButton.isEnabled = false
            signinButton.backgroundColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
            let attributes: [NSAttributedString.Key: Any] = [ .foregroundColor: UIColor.red ]
            userName.attributedText = NSAttributedString(string: userName.text ?? "", attributes: attributes)
            passwordTextField.attributedText = NSAttributedString(string: passwordTextField.text ?? "", attributes: attributes)
            
            let alertVC = AlertViewController()
            alertVC.modalPresentationStyle = .overFullScreen
            present(alertVC, animated: true)
        }
    }
    
    @objc func signupTouched() {
        let signupVC = SignupViewController()
        self.view.window?.rootViewController = UINavigationController(rootViewController: signupVC)
        self.view.window?.makeKeyAndVisible()
        navigationController?.pushViewController(signupVC, animated: true)
    }
    
    


}

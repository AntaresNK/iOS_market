//
//  SignupViewController.swift
//  iOS_market
//
//  Created by Nazym Sayakhmet on 20.10.2023.
//

import UIKit

class SignupViewController: UIViewController {
    
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
    
    let emailTextField: TextFieldDelegate = {
        let textField = TextFieldDelegate()
        textField.setPlaceholderText(text: "Почта")
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
    
    let signupButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.configureButton()
        button.addTarget(self, action: #selector(signupTouched), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Регистрация"
        setupViews()
        
        let backButton = UIBarButtonItem(image: UIImage(named: "backIcon")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(backPressed))
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    func setupViews() {
        setupLogo()
        setupName()
        setupLine()
        setupEmail()
        setupLine1()
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
    
    func setupEmail() {
        view.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(userName)
            make.top.equalTo(lineView.snp.bottom).offset(32)
        }
    }
    
    func setupLine1() {
        view.addSubview(lineView1)
        lineView1.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(userName)
            make.top.equalTo(emailTextField.snp.bottom).offset(6)
            make.height.equalTo(0.5)
        }
    }
    
    func setupSignup() {
        signupButton.isEnabled = false
        view.addSubview(signupButton)
        signupButton.snp.makeConstraints { make in
            make.top.equalTo(lineView1.snp.bottom).offset(82)
            make.horizontalEdges.equalTo(userName)
            make.height.equalTo(44)
        }
    }
    
    @objc func textFieldDidChange() {
        let isUserNameFieldEmpty = userName.text?.isEmpty ?? true
        let isEmailFieldEmpty = emailTextField.text?.isEmpty ?? true
        
        if !isUserNameFieldEmpty && !isEmailFieldEmpty {
            signupButton.isEnabled = true
            signupButton.backgroundColor = UIColor(red: 84/255, green: 88/255, blue: 234/255, alpha: 1)
        } else {
            signupButton.isEnabled = false
            signupButton.backgroundColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
        }
    }
    
    @objc func signupTouched() {
        let passwordVC = CreatePasswordViewController()
        passwordVC.modalPresentationStyle = .overFullScreen
        navigationController?.show(passwordVC, sender: self)
        
    }
    
    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
    }


}

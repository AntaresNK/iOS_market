//
//  CreatePasswordViewController.swift
//  iOS_market
//
//  Created by Nazym Sayakhmet on 20.11.2023.
//

import UIKit

class CreatePasswordViewController: UIViewController, UITextFieldDelegate {
    
    let lockImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "lock")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Придумайте пароль"
        label.font = UIFont(name: "GothamPro-Medium", size: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tipLabel: UILabel = {
        let label = UILabel()
        label.text = "Минимальная длина — 8 символов.\n Для надежности пароль должен\n содержать буквы и цифры."
        label.font = UIFont(name: "GothamPro", size: 16)
        label.textAlignment = .center
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.font = UIFont(name: "GothamPro-Bold", size: 34)
        textField.isSecureTextEntry = true
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let repeatPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.font = UIFont(name: "GothamPro-Bold", size: 34)
        textField.isSecureTextEntry = true
        textField.isHidden = true
        textField.addTarget(self, action: #selector(checkPassword), for: .editingChanged)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let errorMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "Пароли не совпадают"
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .center
        label.isHidden = true
        label.textColor = .systemRed
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Далее", for: .normal)
        button.configureButton()
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "Регистрация"
        passwordTextField.delegate = self
        repeatPasswordTextField.delegate = self
        setupViews()
       
        let showPasswordButton = UIBarButtonItem(image: UIImage(named: "eye-disabled")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(showPasswordButtonTapped))
        let backButton = UIBarButtonItem(image: UIImage(named: "backIcon")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(backPressed))
        self.navigationItem.leftBarButtonItem = backButton
        navigationItem.rightBarButtonItem = showPasswordButton
        
    }
    
    func setupViews() {
        setLockImage()
        setMainLabel()
        setTipLabel()
        setPasswordTextField()
        setRepeatPasswordTextField()
        setErrorMessageLabel()
        setNextButton()
    }
    
    func setLockImage() {
        view.addSubview(lockImage)
        lockImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(32)
            make.centerX.equalToSuperview()
        }
    }
    
    func setMainLabel() {
        view.addSubview(mainLabel)
        mainLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(lockImage.snp.bottom).offset(28)
        }
    }
    
    func setTipLabel() {
        view.addSubview(tipLabel)
        tipLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(mainLabel.snp.bottom).offset(8)
        }
    }
    
    func setPasswordTextField() {
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalTo(tipLabel.snp.bottom).offset(28)
        }
    }
    
    func setRepeatPasswordTextField() {
        view.addSubview(repeatPasswordTextField)
        repeatPasswordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalTo(passwordTextField.snp.bottom).offset(8)
        }
    }
    
    func setErrorMessageLabel() {
        view.addSubview(errorMessageLabel)
        errorMessageLabel.snp.makeConstraints { make in
            make.top.equalTo(repeatPasswordTextField.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
    }
    
    func setNextButton() {
        view.addSubview(nextButton)
        nextButton.isEnabled = false
        nextButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(errorMessageLabel.snp.bottom).offset(20)
            make.height.equalTo(44)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string.rangeOfCharacter(from: .whitespaces) != nil {
            return false
        }
        
        var currentText = textField.text ?? ""
        
        if textField == passwordTextField {
            currentText = passwordTextField.text ?? ""
        } else if textField == repeatPasswordTextField {
            currentText = repeatPasswordTextField.text ?? ""
        }

        if let textRange = Range(range, in: currentText) {
            let newText = currentText.replacingCharacters(in: textRange, with: string)
            let maxCharacter = 17
            
            return newText.count <= maxCharacter
        }
        
        return true
    }
    
    func containsUppercaseLetter(text: String) -> Bool {
        let uppercaseLetterRegex = ".*[A-Z]+.*"
        return NSPredicate(format: "SELF MATCHES %@", uppercaseLetterRegex).evaluate(with: text)
    }

    func containsNumber(text: String) -> Bool {
        let numberRegex = ".*\\d+.*"
        return NSPredicate(format: "SELF MATCHES %@", numberRegex).evaluate(with: text)
    }

    func containsSpecialSymbol(text: String) -> Bool {
        let specialSymbolRegex = ".*[@$#!%*?&]+.*"
        return NSPredicate(format: "SELF MATCHES %@", specialSymbolRegex).evaluate(with: text)
    }
    
    @objc func textFieldDidChange() {
        let text = passwordTextField.text ?? ""
        if containsUppercaseLetter(text: text) && containsNumber(text: text) && containsSpecialSymbol(text: text) {
            nextButton.isEnabled = true
            nextButton.backgroundColor = UIColor(red: 84/255, green: 88/255, blue: 234/255, alpha: 1)
        } else {
            nextButton.isEnabled = false
            nextButton.backgroundColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
        }
    }

    @objc func showPasswordButtonTapped() {
        passwordTextField.isSecureTextEntry.toggle()
        repeatPasswordTextField.isSecureTextEntry.toggle()
    }
    
    @objc func nextButtonTapped() {
        repeatPasswordTextField.isHidden = false
        passwordTextField.isEnabled = false
        mainLabel.text = "Повторите пароль"
        nextButton.setTitle("Готово", for: .normal)
        nextButton.isEnabled = false
        nextButton.backgroundColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
    }
    
    @objc func checkPassword() {
        let password = passwordTextField.text!
        let repeatedPassword = repeatPasswordTextField.text!
        
        if password == repeatedPassword {
            nextButton.isEnabled = true
            nextButton.backgroundColor = UIColor(red: 84/255, green: 88/255, blue: 234/255, alpha: 1)
            nextButton.addTarget(self, action: #selector(openProfile), for: .touchUpInside)
        }
    }
    
    @objc func openProfile() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
    }
}

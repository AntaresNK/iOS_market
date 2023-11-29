//
//  ProfieView.swift
//  iOS_market
//
//  Created by Nazym Sayakhmet on 23.11.2023.
//

import UIKit
import SnapKit

class ProfileView: UIView {
    
    let profileImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "avatar")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Алеся"
        label.font = UIFont(name: "GothamPro-Medium", size: 18)
        return label
    }()
    
    let itemsView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let favsImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "favs")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let favsLabel: UILabel = {
        let label = UILabel()
        label.text = "Понравившиеся"
        label.font = UIFont(name: "GothamPro-Medium", size: 16)
        return label
    }()
    
    let favsButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "arrow"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 247/255, green: 246/255, blue: 249/255, alpha: 1)
        return view
    }()
    
    let myProductsImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "items")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let myProductsLabel: UILabel = {
        let label = UILabel()
        label.text = "Мои товары"
        label.font = UIFont(name: "GothamPro-Medium", size: 16)
        return label
    }()
    
    let myProductsButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "arrow"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let logoutView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let logoutImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logout")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let logoutLabel: UILabel = {
        let label = UILabel()
        label.text = "Выйти"
        label.font = UIFont(name: "GothamPro-Medium", size: 16)
        return label
    }()
    
    let logoutButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "arrow"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let completeRegistrationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Закончить регистрацию", for: .normal)
        button.configureButton()
        button.backgroundColor = UIColor(red: 84/255, green: 88/255, blue: 234/255, alpha: 1)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        setProfileImage()
        setNameLabel()
        setItemsView()
        setFavsImage()
        setfavsLabel()
        setFavsButton()
        setLineView()
        setMyProductsImage()
        setMyProductsLabel()
        setMyProductsButton()
        setLogoutView()
        setLogoutImage()
        setLogoutLabel()
        setLogoutButton()
        setCompleteRegistrationButton()
    }
    
    func setProfileImage() {
        addSubview(profileImage)
        profileImage.snp.makeConstraints { make in
            make.size.equalTo(80)
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(24)
        }
    }
    
    func setNameLabel() {
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
        }
    }
    
    func setItemsView() {
        addSubview(itemsView)
        itemsView.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(24)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(121)
        }
    }
    
    func setFavsImage() {
        itemsView.addSubview(favsImage)
        favsImage.snp.makeConstraints { make in
            make.left.equalTo(itemsView.snp.left).offset(20)
            make.top.equalTo(itemsView.snp.top).offset(16)
            make.size.equalTo(30)
        }
    }
    
    func setfavsLabel() {
        itemsView.addSubview(favsLabel)
        favsLabel.snp.makeConstraints { make in
            make.centerY.equalTo(favsImage)
            make.left.equalTo(favsImage.snp.right).offset(9)
        }
    }
    
    func setFavsButton() {
        itemsView.addSubview(favsButton)
        favsButton.snp.makeConstraints { make in
            make.centerY.equalTo(favsImage)
            make.right.equalTo(itemsView.snp.right).offset(-16)
            make.size.equalTo(24)
        }
    }
    
    func setLineView() {
        itemsView.addSubview(lineView)
        lineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.left.equalTo(favsLabel.snp.left)
            make.right.equalTo(favsButton.snp.right)
            make.centerY.equalToSuperview()
        }
        
    }
    
    func setMyProductsImage() {
        itemsView.addSubview(myProductsImage)
        myProductsImage.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(favsImage)
            make.bottom.equalTo(itemsView.snp.bottom).offset(-20)
            make.size.equalTo(30)
        }
    }
    
    func setMyProductsLabel() {
        itemsView.addSubview(myProductsLabel)
        myProductsLabel.snp.makeConstraints { make in
            make.centerY.equalTo(myProductsImage)
            make.left.equalTo(myProductsImage.snp.right).offset(9)
        }
    }
    
    func setMyProductsButton() {
        itemsView.addSubview(myProductsButton)
        myProductsButton.snp.makeConstraints { make in
            make.right.equalTo(itemsView.snp.right).offset(-16)
            make.centerY.equalTo(myProductsImage)
            make.size.equalTo(24)
        }
    }
    
    func setLogoutView() {
        addSubview(logoutView)
        logoutView.snp.makeConstraints { make in
            make.top.equalTo(itemsView.snp.bottom).offset(16)
            make.horizontalEdges.equalTo(itemsView)
            make.height.equalTo(70)
        }
    }
    
    func setLogoutImage() {
        logoutView.addSubview(logoutImage)
        logoutImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(logoutView.snp.left).offset(16)
            make.size.equalTo(30)
        }
    }
    
    func setLogoutLabel() {
        logoutView.addSubview(logoutLabel)
        logoutLabel.snp.makeConstraints { make in
            make.centerY.equalTo(logoutImage)
            make.left.equalTo(logoutImage.snp.right).offset(9)
        }
    }
    
    func setLogoutButton() {
        logoutView.addSubview(logoutButton)
        logoutButton.snp.makeConstraints { make in
            make.right.equalTo(logoutView.snp.right).offset(-16)
            make.centerY.equalTo(logoutImage)
            make.size.equalTo(24)
        }
    }
    
    func setCompleteRegistrationButton() {
        addSubview(completeRegistrationButton)
        completeRegistrationButton.snp.makeConstraints { make in
            make.top.equalTo(logoutView.snp.bottom).offset(188)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(44)
        }
    }
}

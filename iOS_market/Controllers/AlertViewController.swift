//
//  AlertViewController.swift
//  iOS_market
//
//  Created by Nazym Sayakhmet on 20.10.2023.
//

import UIKit
import SnapKit

class AlertViewController: UIViewController {
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 243/255, green: 69/255, blue: 69/255, alpha: 1)
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let warningImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "exclamationmark.circle.fill")
        image.tintColor = .white
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let warningLabel: UILabel = {
        let label = UILabel()
        label.text = "Неверный логин или пароль"
        label.textColor = .white
        label.font = UIFont(name: "GothamPro-Medium", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
               view.addGestureRecognizer(tapGesture)
    }
    
    func setupViews() {
        view.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.horizontalEdges.equalToSuperview().inset(28)
        }
        
        setupWarningImage()
        setupWarningLabel()
    }
    
    func setupWarningImage() {
        backgroundView.addSubview(warningImage)
        warningImage.snp.makeConstraints { make in
            make.size.equalTo(24)
            make.leading.equalToSuperview().inset(26)
            make.centerY.equalToSuperview()
        }
    }
    
    func setupWarningLabel() {
        backgroundView.addSubview(warningLabel)
        warningLabel.snp.makeConstraints { make in
            make.leading.equalTo(warningImage.snp.trailing).offset(6)
            make.centerY.equalToSuperview()
        }
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        if !backgroundView.frame.contains(location) {
            backgroundView.removeFromSuperview()
        }
    }
}

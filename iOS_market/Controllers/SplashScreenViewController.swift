//
//  ViewController.swift
//  iOS_market
//
//  Created by Nazym Sayakhmet on 20.10.2023.
//

import UIKit
import SnapKit

class SplashScreenViewController: UIViewController {
    
    var timer: Timer?
    
    let logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .white
        setupViews()
        
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(openSignin), userInfo: nil, repeats: false)
    }
    
    func setupViews() {
        view.addSubview(logoImage)
        logoImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    @objc func openSignin() {
        let signinVC = SigninViewController()
        signinVC.modalPresentationStyle = .overFullScreen
        present(signinVC, animated: true, completion: nil)
    }


}


//
//  ProfileViewController.swift
//  iOS_market
//
//  Created by Nazym Sayakhmet on 20.10.2023.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    let customView = ProfileView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 247/255, green: 246/255, blue: 249/255, alpha: 1)
        title = "Профиль"
        setupNavigationBar()
        setupCustomView()
       
    }
    
    func setupNavigationBar() {
        navigationItem.hidesBackButton = true
        let editButton = UIBarButtonItem(image: UIImage(named: "edit")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(editPressed))
        self.navigationItem.rightBarButtonItem = editButton
    }
    
    func setupCustomView() {
            view.addSubview(customView)
            customView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }

   @objc func editPressed() {
        
    }

}

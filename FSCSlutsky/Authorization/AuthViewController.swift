//
//  ViewController.swift
//  FSCSlutsky
//
//  Created by Павел on 29.08.2023.
//

import UIKit

class AuthViewController: UIViewController {
    
    private var authService: AuthService!
    
    // MARK: объявление view
    private let vkLogo = UIImageView(image: UIImage(named: "VKLogo"))
    
    private let signInButton: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.bordered()
        configuration.title = "Войти"
        configuration.baseForegroundColor = DesignSystem.Button.textColor
        configuration.baseBackgroundColor = DesignSystem.Button.backgroundColor
        configuration.contentInsets = DesignSystem.Button.insets
        configuration.cornerStyle = DesignSystem.Button.corners
        button.configuration = configuration
        button.addTarget(self, action: #selector(signInTouch), for: .touchUpInside)
        return button
    }()

    // MARK: инстанс класса
    override func viewDidLoad() {
        super.viewDidLoad()
        authService = SceneDelegate.shared().authService
        
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = DesignSystem.Colors.background
        view.addSubview(signInButton)
        view.addSubview(vkLogo)
    }
    
    private func setupConstraints() {
        let screen = view.safeAreaLayoutGuide
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        vkLogo.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.centerYAnchor.constraint(equalTo: screen.centerYAnchor, constant: screen.layoutFrame.height/6).isActive = true
        signInButton.centerXAnchor.constraint(equalTo: screen.centerXAnchor).isActive = true
        vkLogo.centerYAnchor.constraint(equalTo: screen.centerYAnchor, constant: -screen.layoutFrame.height/6).isActive = true
        vkLogo.centerXAnchor.constraint(equalTo: screen.centerXAnchor).isActive = true
    }
   
    @objc func signInTouch() {
        authService.wakeUpSession()
    }
}


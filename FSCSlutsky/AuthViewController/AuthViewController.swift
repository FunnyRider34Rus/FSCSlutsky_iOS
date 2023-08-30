//
//  ViewController.swift
//  FSCSlutsky
//
//  Created by Павел on 29.08.2023.
//

import UIKit

class AuthViewController: UIViewController {
    
    private var authService: AuthService!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        authService = SceneDelegate.shared().authService
        view.backgroundColor = .blue
        
    }
    @IBAction func sighInTouch(_ sender: UIButton) {
        authService.wakeUpSession()
    }
}


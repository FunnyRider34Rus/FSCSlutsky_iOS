//
//  AuthServiceProtocol.swift
//  FSCSlutsky
//
//  Created by Павел on 30.08.2023.
//

import UIKit

protocol AuthServiceProtocol: class {
    func authServiceShouldPresent(viewController: UIViewController)
    func authServiceSignIn()
    func authServiceSignInDidFail()
}

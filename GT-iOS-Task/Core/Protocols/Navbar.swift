//
//  NavbarProtocol.swift
//  ViberTemplate
//
//  Created by Abdelrhman Eliwa on 05/05/2021.
//

import UIKit

protocol DefaultNavbarProtocol {
    func setupNavbarDefaultUI()
}

protocol CustomeNavbarProtocol {
    func setupCustomeNavbar(
        with title: String?,
        leftbarButtonItems: [UIBarButtonItem]?,
        rightbarButtonItems: [UIBarButtonItem]?
    )
    func hideCustomeNavbar()
}

// MARK: - Default Implementation
extension CustomeNavbarProtocol where Self: UIViewController {
    private var navbar: UINavigationBar? {
        return self.navigationController?.navigationBar
    }
    
    /// This func helps you to setup the UI of the Navbar with Custom UI and title
    /// - Parameters:
    ///   - title: The title of the Navbar
    ///   - leftbarButtonItems: left buttons of the Navbar
    ///   - rightbarButtonItems: right buttons of the Navbar
    func setupCustomeNavbar(
        with title: String? = nil,
        leftbarButtonItems: [UIBarButtonItem]? = nil,
        rightbarButtonItems: [UIBarButtonItem]? = nil
    ) {
        navbar?.isHidden = false
        navbar?.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navbar?.shadowImage = UIImage()
        navbar?.prefersLargeTitles = false
        navbar?.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        navbar?.tintColor = .black
        navbar?.barTintColor = .white
        navigationItem.title = title
        
        navigationItem.leftBarButtonItems = leftbarButtonItems
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        navigationItem.rightBarButtonItems = rightbarButtonItems
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    func hideCustomeNavbar() {
        navbar?.isHidden = true
    }
}

extension DefaultNavbarProtocol where Self: UIViewController {
    private var navbar: UINavigationBar? {
        return self.navigationController?.navigationBar
    }
    
    /// This func helps you to setup the UI of the Navbar to be hidden
    func setupNavbarDefaultUI() {
        navbar?.barTintColor = .clear
        navbar?.tintColor = .clear
        navbar?.prefersLargeTitles = false
        navbar?.isHidden = true
    }
}

//
//  TabBarController.swift
//  Chatty
//
//  Created by Andrei Dogaru-Serban on 16/04/2021.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.items![0].selectedImage = UIImage(systemName: "message.fill")
        tabBar.items![1].selectedImage = UIImage(systemName: "gearshape.fill")
    }
}

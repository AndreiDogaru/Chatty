//
//  SceneDelegate.swift
//  Chatty
//
//  Created by Andrei Dogaru-Serban on 16/04/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
//        if isUserLoggedIn {
//            // instantiate the tab bar controller and set it as root view controller
//            // using the storyboard identifier we set earlier
//            let mainTabBarController = storyboard.instantiateViewController(identifier: Constants.TAB_BAR_CONTROLLER)
//            window?.rootViewController = mainTabBarController
//        } else {
            // if user isn't logged in
            // instantiate the navigation controller and set it as root view controller
            // using the storyboard identifier we set earlier
            let loginNavController = storyboard.instantiateViewController(identifier: Constants.LOGIN_NAVIGATION_CONTROLLER)
            window?.rootViewController = loginNavController
//        }
    }
    
    
    func changeRootViewController(_ vc: UIViewController, _ transition: UIView.AnimationOptions = .transitionFlipFromBottom, animated: Bool = true) {
        guard let window = self.window else {
            return
        }
        
        // change the root view controller to your specific view controller
        window.rootViewController = vc
        
        UIView.transition(with: window, duration: 0.5, options: [transition], animations: nil, completion: nil)
    }

}


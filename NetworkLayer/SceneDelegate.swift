//
//  SceneDelegate.swift
//  NetworkLayer
//
//  Created by Karla E. Martins Fernandes on 07/07/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinator?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
                   options connectionOptions: UIScene.ConnectionOptions) {
                       
            guard let windowScene = (scene as? UIWindowScene) else { return }

            window = UIWindow(windowScene: windowScene)
        
        
        let navigationController = UINavigationController()

        let appCoordinator = AppCoordinator(navigationController: navigationController)
        self.coordinator = appCoordinator

        appCoordinator.start()

            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
        }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}


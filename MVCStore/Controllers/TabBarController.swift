//
//  TabBarController.swift
//  MVCStore
//
//  Created by Fernado Belen on 01/10/2021.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().barTintColor = UIColor.systemGray6
        UITabBar.appearance().tintColor = UIColor.black
        UITabBar.appearance().unselectedItemTintColor = .gray
        setupTabBar()
    }
    
    func setupTabBar() {
        
        let carsVC = createNavController(vc: CarsVC(), title: "Cars", selected: nil, unselected: nil)
        carsVC.tabBarItem = UITabBarItem(title: "Cars", image: UIImage(named: "car"), selectedImage: UIImage(named: "car"))
        
        let PickupTruckVC = createNavController(vc: PickupVC(), title: "Pickup", selected: nil, unselected: nil)
        PickupTruckVC.tabBarItem = UITabBarItem(title: "Pickup", image: UIImage(named: "pickup"), selectedImage: UIImage(named: "pickup"))
        
        viewControllers = [carsVC, PickupTruckVC]
        
        guard let items = tabBar.items else { return }
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
    }
}

extension UITabBarController {
    
    func createNavController(vc: UIViewController, title: String?, selected: UIImage?, unselected: UIImage?) -> UINavigationController {
        
        let viewController = vc
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselected
        navController.tabBarItem.selectedImage = selected
        navController.tabBarItem.title = title
        return navController
    }
}

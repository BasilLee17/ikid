//
//  ViewController.swift
//  ikid
//
//  Created by Isabelle Donsbach on 5/1/22.
//

import UIKit

class ViewController: UIViewController {
    
    var start: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        start = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 52))
        start.setTitle("Go to Jokes!", for: .normal)
        start.backgroundColor = .white
        start.setTitleColor(.white, for: .normal)
        start.backgroundColor = .systemBlue
        start.layer.cornerRadius = 15
        view.addSubview(start)
        start.addTarget(self, action: #selector(startClick), for: .touchUpInside)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        start.center = view.center
    }

    @objc func startClick() {
        let tabBarVC = UITabBarController()
        let vcGood = UINavigationController(rootViewController: GoodViewController())
        vcGood.title = "Good"
        let vcPun = UINavigationController(rootViewController: PunViewController())
        vcPun.title = "Pun"
        let vcDad = UINavigationController(rootViewController: DadViewController())
        vcDad.title = "Dad"
        let vcKnock = UINavigationController(rootViewController: KnockKnockViewController())
        vcKnock.title = "Knock Knock"
        tabBarVC.setViewControllers([vcGood, vcPun, vcDad, vcKnock], animated: false)
        
        tabBarVC.modalPresentationStyle = .fullScreen
        tabBarVC.tabBar.isTranslucent = false
        //tabBarVC.tabBar.tintColor = .white
        tabBarVC.tabBar.barTintColor = .white
        //tabBarVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "San Francisco", size: 50)], for: .normal)
        present(tabBarVC, animated: true)
    }

}


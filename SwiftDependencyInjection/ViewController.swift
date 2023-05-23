//
//  ViewController.swift
//  SwiftDependencyInjection
//
//  Created by Ali serkan Boyracı  on 16.05.2023.
//

import UIKit
import Swinject

class ViewController: UIViewController {
    
    //Swinject
    let container : Container = {
        let container = Container()
        container.register(BackgroundProvidingClass.self) { resolver in
            return BackgroundProvidingClass()
        }
        
        container.register(AnotherVCViewController.self) { resolver in
            let vc = AnotherVCViewController(providerProtocol: resolver.resolve(BackgroundProvidingClass.self))
                return vc
        }
            
            return container
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemBlue
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
        button.setTitle("Open Other VC", for: .normal)
        button.center = view.center
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc private func buttonClicked() {
        if let viewController = container.resolve(AnotherVCViewController.self) {
            present(viewController, animated: true)
        }
        
        
    }


}


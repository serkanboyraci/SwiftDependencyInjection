//
//  BackgroundProvidingClass.swift
//  SwiftDependencyInjection
//
//  Created by Ali serkan Boyracı  on 23.05.2023.
//

import Foundation
import UIKit

class BackgroundProvidingClass : BackgroundProviderProtocol {
    var backgroundColor: UIColor {
        let backgroundColors : [UIColor] = [.systemGray, .systemRed, .systemMint, .systemGreen]
        return backgroundColors.randomElement()!
    }
    
    
}



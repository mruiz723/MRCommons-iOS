//
//  MainFactory.swift
//  MRCommons-Example
//
//  Created by Marlon David Ruiz Arroyave on 2/01/21.
//

import Foundation
import UIKit

struct MainFactory {
    
    static func makeViewController() -> ViewController {
        let viewModel = ViewModel(counterValue: 0)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "ViewController") as? ViewController ?? ViewController()
        viewController.viewModel = viewModel
        return viewController
    }
}

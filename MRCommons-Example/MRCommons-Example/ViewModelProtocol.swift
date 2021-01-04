//
//  ViewModelProtocol.swift
//  MRCommons-Example
//
//  Created by Marlon David Ruiz Arroyave on 2/01/21.
//

import Foundation
import MRCommons

protocol ViewModelProtocol {
    var counter: Bindable<Int> { get set }
    func viewDidLoad()
    func incrementCounter()
}

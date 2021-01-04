//
//  ViewModel.swift
//  MRCommons-Example
//
//  Created by Marlon David Ruiz Arroyave on 2/01/21.
//

import Foundation
import MRCommons

struct ViewModel: ViewModelProtocol {
    
    // MARK: - Properties
    
    var counter: Bindable<Int>
    
    // MARK: - Init
    
    init(counterValue: Int = 0) {
        counter = Bindable(counterValue)
    }
    
    // MARK: - ViewModelProtocol
    
    func viewDidLoad() {
        incrementCounter()
    }
    
    func incrementCounter() {
        counter.value += 1
    }
}

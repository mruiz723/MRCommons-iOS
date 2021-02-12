//
//  ViewController.swift
//  MRCommons-Example
//
//  Created by Marlon David Ruiz Arroyave on 2/01/21.
//

import UIKit
import MRCommons

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var countLabel: UILabel!

    var urlRequest: URLRequest?

    // MARK: - Properties
    var httpHeaders: HTTPHeaders = HTTPHeaders()
    var viewModel: ViewModelProtocol! {
        didSet {
            viewModel.counter.bind { [weak self] newValue in
                self?.countLabel.text = String(newValue)
            }
        }
    }
    
    // MARK: - IBActions
    
    
    @IBAction func incrementCounter(_ sender: UIButton) {
        viewModel.incrementCounter()
    }
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.viewDidLoad()
        urlRequest = URLRequestBuil
    }
}

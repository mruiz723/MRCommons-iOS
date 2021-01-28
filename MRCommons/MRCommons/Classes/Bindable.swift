//
//  Bindable.swift
//  MRCommons
//
//  Created by Marlon David Ruiz Arroyave on 2/01/21.
//

import Foundation

/// This class allow us to implement a data binding mechanism
/// (Connection between UI and Business logic (data changes))
public class Bindable<T> {
    
    // MARK: - Properties
    
    public typealias Listener = (T) -> ()
    
    /// A listener property is a closure that recieves a new value, and return nil
    private var listener: Listener?
    
    /// Contain the current value and in its didSet property observer calls listener closure passing the value
    public var value: T {
        didSet {
            listener?(value)
        }
    }
    
    // MARK: - Init
    
    /**
        Create a Bindable object.
        - Parameter value: the init value for the bindable object.
        - Returns: A Bindable object with a init value.
     */
    public init(_ value: T) {
        self.value = value
    }
    
    // MARK: - Public Methods
    
    /**
        Assign a listener closure to the bindable object
        - Parameter listener: A listener property is a closure that recieves a new value, and return nil.
     */
    public func bind(listener: Listener?) {
        self.listener = listener
    }
    
    ///  Assign a listener closure to the bindable object
    ///
    /// - Parameters:
    ///     - listener:A listener property is a closure that recieves a new value, and return nil.
    public func bindAndFire(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}

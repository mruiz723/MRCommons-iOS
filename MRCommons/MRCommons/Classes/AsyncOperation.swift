//
//  AsyncOperation.swift
//  TwAuth
//
//  Created by Marlon David Ruiz Arroyave on 7/02/21.
//

import Foundation

/// This class allows us to implement an async operation knowing and handling its state
open class AsyncOperation: Operation {
    public var state = State.ready {
        willSet {
            willChangeValue(forKey: newValue.keyPath)
            willChangeValue(forKey: state.keyPath)
        }
        didSet {
            didChangeValue(forKey: oldValue.keyPath)
            didChangeValue(forKey: state.keyPath)
        }
    }

    // Override properties
    open override var isReady: Bool {
        return super.isReady && state == .ready
    }

    open override var isExecuting: Bool {
        return state == .executing
    }

    open override var isFinished: Bool {
        return state == .finished
    }

    open override var isAsynchronous: Bool {
        return true
    }

    // Override start
    open override func start() {
        if isCancelled {
            state = .finished
            return
        }
        main()
        state = .executing
    }
}

public extension AsyncOperation {
    /// State types for our operation
    enum State: String {
        case ready, executing, finished

        fileprivate var keyPath: String {
            return "is\(rawValue.capitalized)"
        }
    }
}

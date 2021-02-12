//
//  AsyncOperation.swift
//  TwAuth
//
//  Created by Marlon David Ruiz Arroyave on 7/02/21.
//

import Foundation

/// This class allows us to implement an async operation knowing and handling its state
public class AsyncOperation: Operation {
    open var state = State.ready {
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
    public override var isReady: Bool {
        return super.isReady && state == .ready
    }

    public override var isExecuting: Bool {
        return state == .executing
    }

    public override var isFinished: Bool {
        return state == .finished
    }

    public override var isAsynchronous: Bool {
        return true
    }

    // Override start
    public override func start() {
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

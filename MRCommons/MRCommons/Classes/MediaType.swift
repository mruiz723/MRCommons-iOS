//
//  MediaType.swift
//  TwAuth
//
//  Created by Marlon David Ruiz Arroyave on 7/02/21.
//

import Foundation

public enum MediaType {
    case urlEncoded
    case json
}

extension MediaType {
    public var value: String {
        switch self {
        case .urlEncoded:
            return "application/x-www-form-urlencoded"
        case .json:
            return "application/json"
        }
    }
}

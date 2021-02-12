//
//  HTTPMethod.swift
//  TwAuth
//
//  Created by Marlon David Ruiz Arroyave on 7/02/21.
//

import Foundation

public enum HTTPMethod {
  case get
  case post
  case put
  case delete
}

extension HTTPMethod {
  public var value: String {
    switch self {
    case .get:
        return "GET"
    case .post:
        return "POST"
    case .put:
        return "PUT"
    case .delete:
        return "DELETE"
    }
  }
}

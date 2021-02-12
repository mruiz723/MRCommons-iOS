//
//  NetworkError.swift
//  TwAuth
//
//  Created by Marlon David Ruiz Arroyave on 1/02/21.
//

import Foundation

public enum NetworkError: LocalizedError {

    case invalidURL
    case invalidBody
    case invalidResponse
    case invalidData

    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidBody:
            return "Invalid Body"
        case .invalidResponse:
            return "Invalid response"
        case .invalidData:
            return "Invalid Data"
        }
    }
}

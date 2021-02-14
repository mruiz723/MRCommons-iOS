//
//  HTTPHeader.swift
//  TwAuth
//
//  Created by Marlon David Ruiz Arroyave on 7/02/21.
//

import Foundation

public struct HTTPHeaders {
    private var headers: [HTTPHeader] = []

    public mutating func addAll(_ headers: [HTTPHeader]) {
        headers.forEach { add($0) }
    }

    private mutating func add(_ header: HTTPHeader) {
        update(header)
    }

    private mutating func update(_ header: HTTPHeader) {
        guard let index = headers.firstIndex(of: header) else {
            headers.append(header)
            return
        }

        headers.replaceSubrange(index...index, with: [header])
    }

    public var dictionary: [String: String]? {
        let namesAndValues = headers.map { ($0.key, $0.value) }

        return Dictionary(namesAndValues, uniquingKeysWith: { _, last in last })
    }
}

public struct HTTPHeader: Hashable {

    let key: String
    let value: String

    public init(key: String, value: String) {
        self.key = key
        self.value = value
    }
}

public extension HTTPHeader {

    static func accept(_ value: String) -> HTTPHeader {
        HTTPHeader(key: Constant.acceptType, value: value)
    }

    static func contentType(_ value: String) -> HTTPHeader {
        HTTPHeader(key: Constant.contentType, value: value)
    }

    static func userAgent(_ value: String) -> HTTPHeader {
        HTTPHeader(key: Constant.userAgent, value: value)
    }

    static func authorization(username: String, password: String) -> HTTPHeader {
        let credential = Data("\(username):\(password)".utf8).base64EncodedString()

        return authorization("\(Constant.basic) \(credential)")
    }

    static func authorization(bearerToken: String) -> HTTPHeader {
        authorization("\(Constant.basic) \(bearerToken)")
    }

    static func authorization(_ value: String) -> HTTPHeader {
        HTTPHeader(key: Constant.authorization, value: value)
    }
}

public extension HTTPHeader {
    struct Constant {
        static let acceptType = "Accept"
        static let contentType = "Content-Type"
        static let userAgent = "User-Agent"
        static let basic = "Basic"
        static let bearer = "Bearer"
        static let authorization = "Authorization"
    }
}

//
//  URLRequestBuilder.swift
//  TwAuth
//
//  Created by Marlon David Ruiz Arroyave on 7/02/21.
//

import Foundation

public class URLRequestBuilder {

    private var httpMethod: HTTPMethod
    private var parameters: [Parameter]
    private var headers: [HTTPHeader]
    private var url: URL?

    init(withURL url: URL?) throws {
        self.url = url
        httpMethod = .get
        parameters = []
        headers = []
    }

    public func setHTTPMethod(_ method: HTTPMethod) -> URLRequestBuilder {
        httpMethod = method
        return self
    }

    public func setParameters(_ parameters: [Parameter]) -> URLRequestBuilder {
        self.parameters.append(contentsOf: parameters)
        return self
    }

    public func setHeaders(_ headers: [HTTPHeader]) -> URLRequestBuilder {
        self.headers.append(contentsOf: headers)
        return self
    }

    public func build() throws -> URLRequest {
        guard let url = url else {
            throw NetworkError.invalidURL
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.value
        var httpHeaders = HTTPHeaders()
        httpHeaders.addAll(URLRequestBuilder.commonHeaders(httpMethod: httpMethod) + headers)
        urlRequest.allHTTPHeaderFields = httpHeaders.dictionary
        var params = Parameters()
        params.addAll(parameters)

        switch httpMethod {
        case .post, .put, .delete:
            do {
                urlRequest.httpBody = try transformParameters(httpHeaders: urlRequest.allHTTPHeaderFields, params: params)
            } catch {
                throw(error)
            }
        case .get:
            guard let request = urlRequest.url?.absoluteString.appending(addQueryParameters(params: params)) else {
                return urlRequest
            }
            urlRequest.url = URL(string: request)
        }

        return urlRequest
    }

    public static func commonHeaders(httpMethod: HTTPMethod) -> [HTTPHeader] {
        var commonHeaders: [HTTPHeader] = [HTTPHeader]()

        switch httpMethod {
        case .post,
             .put,
             .delete:
            commonHeaders.append(HTTPHeader.accept(MediaType.json.value))
            commonHeaders.append(HTTPHeader.contentType(MediaType.urlEncoded.value))
        case .get:
            commonHeaders.append(HTTPHeader.accept(MediaType.urlEncoded.value))
            commonHeaders.append(HTTPHeader.contentType(MediaType.urlEncoded.value))
        }

        return commonHeaders
    }
}

private extension URLRequestBuilder {

    struct Constants {
        static let queryPrefix = "?"
    }

    func transformParameters(httpHeaders: [String: String]?, params: Parameters) throws -> Data? {
        do {
            if let headers = httpHeaders, headers.contains(where: { $0.key == HTTPHeader.Constant.contentType && $0.value == MediaType.urlEncoded.value }) {
                print(params.asString())
                return params.asString().data(using: .utf8)
            } else {
                return try params.asData()
            }
        } catch {
            throw error
        }
    }

    func addQueryParameters(params: Parameters) -> String {
        let parameters = params.asString()

        guard !parameters.isEmpty else {
            return String()
        }

        return Constants.queryPrefix.appending(parameters)
    }
}

public extension CharacterSet {
    static let customURLQueryAllowed: CharacterSet = {
        let forbiddenCharacters = CharacterSet(charactersIn: "+")
        return CharacterSet.urlQueryAllowed.subtracting(forbiddenCharacters)
    }()
}

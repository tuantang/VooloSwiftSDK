//
//  URLRequestBuilder.swift
//  
//
//  Created by Tuan Tang on 01/04/2022.
//

import Foundation
import Alamofire

protocol URLRequestBuilder: URLRequestConvertible {
    var baseURL: URL { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var method: HTTPMethod { get }
    var encoding: ParameterEncoding { get }
}

extension URLRequestBuilder {
    
    var baseURL: URL {
        AppEnvironement.baseURL
    }
    
    var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    var headers: HTTPHeaders {
        [:]
    }
    
    public func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: baseURL.appendingPathComponent(path, isDirectory: false))
        urlRequest.httpMethod = method.rawValue
        if let token = UserDefaultsStorage.getToken() {
            urlRequest.headers.add(.authorization(bearerToken: token))
        }
        headers.forEach {
            urlRequest.addValue($0.value, forHTTPHeaderField: $0.name)
        }
        return try encoding.encode(urlRequest, with: parameters)
    }
}


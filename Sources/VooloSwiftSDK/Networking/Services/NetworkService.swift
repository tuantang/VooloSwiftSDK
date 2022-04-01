//
//  File.swift
//  
//
//  Created by Tuan Tang on 01/04/2022.
//

import Foundation
import Alamofire

protocol NetworkServiceProtocol {
    func request<T: Codable>(_ urlRequest: URLRequestBuilder, model: T.Type, completion: @escaping (Result<T, AFError>) -> ()) -> DataRequest
}

struct NetworkService: NetworkServiceProtocol {

    private var manager = Alamofire.Session.default
    
    public init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        manager = Alamofire.Session(configuration: configuration)
    }
    
    @discardableResult
    public func request<T: Codable>(_ urlRequest: URLRequestBuilder, model: T.Type, completion: @escaping (Result<T, AFError>) -> ()) -> DataRequest {
        let request = self.manager.request(urlRequest)
            .validate(statusCode: 200..<500)
            .responseDecodable { (response: AFDataResponse<T> ) in
                switch response.result {
                case .success(let data):
                    completion(Result.success(data))
                case .failure(let error):
                    completion(Result.failure(error))
                }
            }
        return request
    }
}

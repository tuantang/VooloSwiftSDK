//
//  VCommonEndpoint.swift
//  
//
//  Created by Tuan Tang on 01/04/2022.
//

import Alamofire

enum VCommonEndpoint: URLRequestBuilder {
    case updateStep(VProcess)
    case getAllTenors
    
    var path: String {
        switch self {
        case .updateStep:
            return Path.BNPL.Common.updateStep
        case .getAllTenors:
            return Path.BNPL.Common.getAllTenor
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .updateStep(let step):
            return [
                "current_step": step
            ]
        case .getAllTenors:
            return nil
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .updateStep:
            return .put
        case .getAllTenors:
            return .get
        }
        
    }
}

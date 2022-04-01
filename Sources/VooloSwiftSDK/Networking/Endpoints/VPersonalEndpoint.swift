//
//  PersonalEndpoint.swift
//  
//
//  Created by Tuan Tang on 01/04/2022.
//

import Alamofire

enum PersonalEndpoint: URLRequestBuilder {
    case addInfo(VPersonal)
    case detail(String)
    case updateTenor(String, String)
    
    var path: String {
        switch self {
        case .addInfo:
            return Path.BNPL.Personal.addInfo
        case .detail(let phone):
            return Path.BNPL.Personal.detail.replace(target: "{phone}", withString: phone)
        case .updateTenor:
            return Path.BNPL.Personal.updateTenor
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .addInfo(let personal):
            return personal.toDictionary
        case .detail:
            return nil
        case .updateTenor(let id, let phone):
            return [
                "id": id,
                "phone": phone
            ]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .addInfo:
            return .post
        case .detail:
            return .get
        case .updateTenor:
            return .put
        }
    }
}

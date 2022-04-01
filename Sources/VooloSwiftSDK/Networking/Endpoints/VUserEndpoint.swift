//
//  VUserEndpoint.swift
//  
//
//  Created by Tuan Tang on 01/04/2022.
//

import Alamofire

enum VUserEndpoint: URLRequestBuilder {
    
    case checkPhoneExists(String)
    case register(String, String)
    case login(String, String)
    case verifyOtp(String, String)
    case sendOtp(String)
    
    var path: String {
        switch self {
        case .checkPhoneExists:
            return Path.BNPL.User.checkPhoneExists
        case .register:
            return Path.BNPL.User.register
        case .login:
            return Path.BNPL.User.login
        case .verifyOtp:
            return Path.BNPL.User.verifyOtp
        case .sendOtp:
            return Path.BNPL.User.sendOtp
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .checkPhoneExists(let phone):
            return ["phone": phone]
        case .register(let phone, let pin), .login(let phone, let pin):
            return [
                "phone": phone,
                "pin": pin
            ]
        case .verifyOtp(let otp, let phone):
            return [
                "otp": otp,
                "phone": phone
            ]
        case .sendOtp(let phone):
            return [
                "phone": phone
            ]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .checkPhoneExists,
                .register,
                .login,
                .verifyOtp,
                .sendOtp:
            return .post
        }
    }
}

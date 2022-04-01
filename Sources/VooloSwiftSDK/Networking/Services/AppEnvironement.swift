//
//  AppEnvironement.swift
//  
//
//  Created by Tuan Tang on 01/04/2022.
//

import Foundation

public enum AppEnvironement {
    case production
    case staging
    case development
}

extension AppEnvironement {
    static var currentState: AppEnvironement {
        return .development
    }
}

extension AppEnvironement {
    public static var baseURL: URL {
        switch AppEnvironement.currentState {
        case .production:
            return URL(string: "https://api-wolfconsulting-bnpl.herokuapp.com/v1")!
        case .staging:
            return URL(string: "https://api-wolfconsulting-bnpl.herokuapp.com/v1")!
        case .development:
            return URL(string: "https://api-wolfconsulting-bnpl.herokuapp.com/v1")!
        }
    }
}


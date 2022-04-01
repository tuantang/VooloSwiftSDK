//
//  File.swift
//  
//
//  Created by Tuan Tang on 01/04/2022.
//

import Foundation

public struct VProvider: Codable {
    public let id: String?
    public let provider: String?
    let created, updated: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case provider
        case created = "createdAt"
        case updated = "updatedAt"
    }
    
    public var createdAt: Date? {
        return created?.toDate()
    }
    
    public var updatedAt: Date? {
        return updated?.toDate()
    }
}

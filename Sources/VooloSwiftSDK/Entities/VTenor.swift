//
//  VTenor.swift
//  
//
//  Created by Tuan Tang on 01/04/2022.
//

import Foundation

public struct VTenor: Codable {
    public let id: String?
    public let originPrice: Double?
    public let convertFee, paymentSchedule: Double?
    let created, updated: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case convertFee, paymentSchedule
        case originPrice
        case created = "createdAt"
        case updated = "updatedAt"
    }
    
    public var totalPrice: Double {
        let convertFee = (self.convertFee ?? 0) * 10000
        let paymentSchedule = self.paymentSchedule ?? 0
        return convertFee + paymentSchedule
    }
    
    public var createdAt: Date? {
        return created?.toDate()
    }
    
    public var updatedAt: Date? {
        return updated?.toDate()
    }
}

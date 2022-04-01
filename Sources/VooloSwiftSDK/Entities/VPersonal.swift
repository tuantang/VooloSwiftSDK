//
//  VPersonal.swift
//  
//
//  Created by Tuan Tang on 01/04/2022.
//

import Foundation

public struct VPersonal: Codable {
    public let id: String?
    public var name, sex, phone, birthday: String?
    public var citizenID, issueDate, city, district: String?
    public var ward, street, personalTitleRef, nameRef: String?
    public var phoneRef, user: String?
    public var providers: [VProvider]?
    public var tenor: VTenor?
    public var creditLimit: Double?
    var created, updated: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, sex, phone, birthday
        case citizenID = "citizenId"
        case issueDate, city, district, ward, street
        case personalTitleRef = "personal_title_ref"
        case nameRef = "name_ref"
        case phoneRef = "phone_ref"
        case user
        case providers
        case created = "createdAt"
        case updated = "updatedAt"
        case creditLimit = "credit_limit"
        case tenor
    }
    
    public var createdAt: Date? {
        return created?.toDate()
    }
    
    public var updatedAt: Date? {
        return updated?.toDate()
    }
    
    public var toDictionary: [String: Any] {
        let encoder = JSONEncoder()
        let data = try! encoder.encode(self)
        if let json = String(data: data, encoding: .utf8)?.toJson() {
            return json
        }
        return [:]
    }
    
    public var address: String {
        var address: String = ""
        if let street = street {
            address += "\(street), "
        }
        if let ward = ward {
            address += "\(ward), "
        }
        if let district = district {
            address += "\(district), "
        }
        if let city = city {
            address += "\(city)"
        }
        return address
    }
}

public struct VItem: Codable {
    public let id, name: String
    public let price, shipFee: Int
    public let image, desc: String
    let created, updated: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, price, shipFee, image
        case desc = "description"
        case created = "createdAt"
        case updated = "updatedAt"
    }
}

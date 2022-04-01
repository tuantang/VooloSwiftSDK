//
//  VError.swift
//  
//
//  Created by Tuan Tang on 01/04/2022.
//

public enum VError: Error {
    case faceNotMatch
    case idNotMatch
    case frontCardFailure
    case backCardFailure
    case phoneNotExists
    case phoneNotExistsEAP
    case phoneNotExistsBNPL
    case other(String, Int)
    
    public var errorDescription: String {
        switch self {
        case .faceNotMatch:
            return "Face does not match"
        case .idNotMatch:
            return "ID Card does not match"
        case .frontCardFailure:
            return "Verify front card failure"
        case .backCardFailure:
            return "Verify back card failure"
        case .phoneNotExistsEAP:
            return "This phone number is not exists in EAP !"
        case .phoneNotExistsBNPL:
            return "This phone number is not exists in BNPL !"
        case .phoneNotExists:
            return "This phone number is not exists !"
        case .other(let message, _):
            return message
        }
    }
    
    public var errorCode: Int {
        switch self {
        case .faceNotMatch:
            return 111
        case .idNotMatch:
            return 122
        case .frontCardFailure:
            return 133
        case .backCardFailure:
            return 144
        case .phoneNotExistsEAP:
            return 1001
        case .phoneNotExistsBNPL:
            return 1002
        case .phoneNotExists:
            return 1003
        case .other(_ , let code):
            return code
        }
    }
}

extension Int {
    func toError() -> VError? {
        switch self {
        case 111:
            return .faceNotMatch
        case 122:
            return .frontCardFailure
        case 113:
            return .backCardFailure
        case 1001:
            return .phoneNotExistsEAP
        case 1002:
            return .phoneNotExistsBNPL
        case 1003:
            return .phoneNotExists
        default:
            return nil
        }
    }
}

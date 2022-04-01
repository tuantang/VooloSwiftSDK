//
//  Path.swift
//  
//
//  Created by Tuan Tang on 01/04/2022.
//

enum Path {
    enum BNPL {
        enum User {
            static let checkPhoneExists = "/bnpl/user/checkPhoneExists"
            static let register = "/bnpl/user/register"
            static let login = "/bnpl/user/login"
            static let verifyOtp = "/bnpl/user/verifyOtp"
            static let sendOtp = "/bnpl/user/sendOtp"
        }
        
        enum Personal {
            static let addInfo = "/bnpl/personal/addInfoPersonal"
            static let detail = "/bnpl/personal/{phone}"
            static let updateTenor = "/bnpl/personal/updateTenor"
        }
        
        enum Token {
            static let hvtoken = "/bnpl/hvtoken"
        }
        
        enum Common {
            static let updateStep = "/bnpl/common/updateStep"
            static let getAllTenor = "/bnpl/common/getAllTenor"
        }
    }
}

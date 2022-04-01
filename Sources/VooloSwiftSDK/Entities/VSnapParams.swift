//
//  File.swift
//  
//
//  Created by Tuan Tang on 01/04/2022.
//

import Foundation

public class VSnapParams {
    public enum Document: CaseIterable {
        case VietNamPassport
        
        case VietnamNID
        
        case VietnamDL
    }
    
    public enum DocumentType: CaseIterable {
        ///AspectRatio : 0.625
        case card
        
        ///AspectRatio : 1.4
        case a4
        
        ///AspectRatio : 0.68
        case passport
        
        case other
    }
    
    public enum DocumentSide: CaseIterable {
        case front
        
        case back
        
        case both
    }
    
    public enum Region: CaseIterable {
        case AsiaPacific

        case UnitedStates

        case India

        case Africa
    }
    
    public enum Product: CaseIterable {
        case faceID

        case IAM
    }
    
    public enum LivenessMode: CaseIterable {
        case none

        case textureLiveness
    }
    
    public enum FaceMatchMode: CaseIterable {
        case Face_Id

        case Face_Face

        case Face_IdFaceString

        case Generic
    }
}

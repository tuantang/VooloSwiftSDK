//
//  StringExt.swift
//  
//
//  Created by Tuan Tang on 01/04/2022.
//

import Foundation

extension String {
    func toJson() -> [String: Any]? {
        if let data = self.data(using: String.Encoding.utf8) {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any]
                return json
            } catch {
                return nil
            }
        }
        return nil
    }
    
    func replace(target: String, withString: String) -> String {
        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
    }
    
    func toDate(withFormat format: String = "yyyy-MM-dd'T'HH:mm:ss")-> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)
        return date
        
    }
}


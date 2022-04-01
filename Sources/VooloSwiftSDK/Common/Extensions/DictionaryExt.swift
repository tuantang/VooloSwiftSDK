//
//  File.swift
//  
//
//  Created by Tuan Tang on 01/04/2022.
//

import Foundation

extension Dictionary {
    var isNotEmpty: Bool {
        !isEmpty
    }
}

func += <K, V> (left: inout [K:V], right: [K:V]) {
    for (k, v) in right {
        left[k] = v
    }
}

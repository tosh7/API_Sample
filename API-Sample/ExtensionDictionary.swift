//
//  ExtensionDictionary.swift
//  API-Sample
//
//  Created by dev室 インターン4 on 2018/11/09.
//  Copyright © 2018年 dev室 インターン4. All rights reserved.
//

import Foundation

extension Dictionary where Key: ExpressibleByStringLiteral, Value: ExpressibleByStringLiteral {
    public func urlEncodedStringInSwift() -> String {
        
        var parts: [String] = []
        for (key, value) in self {
            if let strVal: String = value as? String,let strKey: String = key as? String{
                let eValue = strVal.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
                let part:String = (strKey+"="+eValue) as String
                parts.append(part)
                
            }
        }
        return parts.joined(separator: "&")
    }
}

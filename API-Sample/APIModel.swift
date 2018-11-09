//
//  APIModel.swift
//  API-Sample
//
//  Created by dev室 インターン4 on 2018/11/09.
//  Copyright © 2018年 dev室 インターン4. All rights reserved.
//

import Foundation

class APIModel {
    
    func doSearch(_ strPram: String) {
        let test: String = "https://xxxxxxxxx/application/public_work_list.json"
        guard let url = URL(string: test ) else { return  }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = strPram.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request){data, response, error in
            guard let dataResponse = data, error == nil else {
                print(error?.localizedDescription ?? "Response Error")
                return
            }
            
            do {
                
                let json = try JSONSerialization.jsonObject(with: dataResponse, options: JSONSerialization.ReadingOptions.allowFragments)
                print(json)
                let decoder = JSONDecoder()
                let test = try? decoder.decode(job.self, from: json as! Data)
                
            } catch {
                print("Serialize Error")
            }
        }
        task.resume()
    }
}

//
//  DecodeJSON.swift
//  SampleAPIMock
//
//  Created by Tatsuya Moriguchi on 7/17/24.
//

import Foundation

class DecodeJSON {
    // Function to decode JSON data
    func decodeJSONData(jsonData: Data) {
        let decoder = JSONDecoder()
        do {
            let responseBody = try decoder.decode(ResponseBody.self, from: jsonData)
            print(responseBody)
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
    
}


/*
 // Example usage
 if let jsonData = json.data(using: .utf8) {
     decodeJSONData(jsonData: jsonData)
 }
 */

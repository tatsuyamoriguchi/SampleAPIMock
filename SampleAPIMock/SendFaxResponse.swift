//
//  SendFaxResponse.swift
//  SampleAPIMock
//
//  Created by Tatsuya Moriguchi on 7/17/24.
//

import Foundation

struct SendFaxResponse: Codable {
    let faxid: UUID
    let destinationFaxNumber: String
    
    enum CodingKeys: String, CodingKey {
        case faxid = "fax_id"
        case destinationFaxNumber = "destination_fax_number"
    }
}


// Struct to represent the response body containing an array of fax details
struct ResponseBody: Codable {
    let faxes: [SendFaxResponse]
}

let json = """
{
    "faxes": [
        {
            "fax_id": "e8f1e71c-5f9c-4e1e-9651-72f5c1234567",
            "destination_fax_number": "+1234567890"
        },
        {
            "fax_id": "e8f1e71c-5f9c-4e1e-9651-72f5c1234568",
            "destination_fax_number": "+0987654321"
        }
    ]
}
"""



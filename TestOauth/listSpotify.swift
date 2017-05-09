//
//  listSpotify.swift
//  TestOauth
//
//  Created by Deipi.com on 08/05/17.
//
//

import Foundation
import Foundation
import ObjectMapper

class listSpotify: Mappable {
    
    var im: images?
   
    
    required init?(map: Map) {
    }
    
    // Map from JSON
    func mapping(map: Map) {
        im <- map["images"]
    }
}
class images: Mappable {
    
    var url: String?
    var he: Double?
    var wi: Double?
    required init?(map: Map) {
    }
    
    // Map from JSON
    func mapping(map: Map) {
        url <- map["url"]
        wi <- map["width"]
        he <- map["height"]
        
    }
}

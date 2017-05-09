
import Foundation
import ObjectMapper
class SpotifyModel: Mappable  {
    var displayName: String?
    var externalUrls: Ext?
    var followers: Followers?
    var image: Images?
   
    
    required init?(map: Map) {
    }
    
    // Map from JSON
    func mapping(map: Map) {
        displayName <- map["display_name"]
        externalUrls <- map["external_urls"]
        followers <- map["followers"]
          image <- map["images"]
    
    }
}

class Followers: Mappable {
    
    var href: String?
    var total: Double?
    
    required init?(map: Map) {
    }
    
    // Map from JSON
    func mapping(map: Map) {
        href <- map["href"]
        total <- map["total"]
    }
}


class Ext: Mappable {
    
    var url: String?
    
    required init?(map: Map) {
    }
    
    // Map from JSON
    func mapping(map: Map) {
        url <- map["spotify"]
        
    }
}


class Images: Mappable {
    
    var url: URL?
    var heigh:Double?
    var width: Double?
    
    required init?(map: Map) {
    }
    
    // Map from JSON
    func mapping(map: Map) {
        
        heigh <- map["height"]
        url <- map["url"]
        width <- map["width"]
        
    }
}

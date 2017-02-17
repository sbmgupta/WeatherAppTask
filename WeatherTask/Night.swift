import Foundation
import ObjectMapper

class Night: Mappable{
    
    var myicon: Int?
    var myiconPhrase: String?
    
    required init?(map: Map) {
        myicon <- map["Icon"]
        myiconPhrase <- map["IconPhrase"]
    }
    
    func mapping(map: Map) {
        myicon <- map["Icon"]
        myiconPhrase <- map["IconPhrase"]
    }
    
}

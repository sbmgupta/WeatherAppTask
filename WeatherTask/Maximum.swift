
import Foundation
import ObjectMapper

class Maximum: Mappable{
    
    var myvalue: Float?
    var myunit: String?
    var myunitType: Int?
    
    required init?(map: Map) {
        myvalue <- map["Value"]
        myunit <- map["Unit"]
        myunitType <- map["UnitType"]
    }
    
    func mapping(map: Map) {
        myvalue <- map["Value"]
        myunit <- map["Unit"]
        myunitType <- map["UnitType"]
    }
    
}

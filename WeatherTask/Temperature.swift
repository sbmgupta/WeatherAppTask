
import Foundation
import ObjectMapper

class Temperature: Mappable{
    
    var mymaximumTemperature: Maximum?
    var myminimumTemperature: Minimum?
    
    required init?(map: Map) {
        mymaximumTemperature <- map["Maximum"]
        myminimumTemperature <- map["Minimum"]
    }
    
    func mapping(map: Map) {
        mymaximumTemperature <- map["Maximum"]
        myminimumTemperature <- map["Minimum"]
    }
    
}


import Foundation
import ObjectMapper

class Data: Mappable{
    
    var myheadline: Headline?
    var mydailyForecasts: [DailyForecasts]?
    
    required init?(map: Map) {
        myheadline <- map["Headline"]
        mydailyForecasts <- map["DailyForecasts"]
    }
    
    func mapping(map: Map) {
        myheadline <- map["Headline"]
        mydailyForecasts <- map["DailyForecasts"]
    }
}

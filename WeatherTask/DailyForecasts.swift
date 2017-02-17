
import Foundation
import ObjectMapper

class DailyForecasts: Mappable{
    
    var mydate : String?
    var myepochDate : Int?
    
    var mytemperature : Temperature?
    var myday : Day?
    var mynight : Night?
    
    var mysources : [String]?
    var mymobileLink : String?
    var mylink : String?
    
    required init?(map: Map) {
        mydate <- map["Date"]
        myepochDate <- map["EpochDate"]
        mytemperature <- map["Temperature"]
        myday <- map["Day"]
        mynight <- map["Night"]
        mysources <- map["Sources"]
        mymobileLink <- map["MobileLink"]
        mylink <- map["Link"]
    }
    
    func mapping(map: Map) {
        
        
        mydate <- map["Date"]
        myepochDate <- map["EpochDate"]
        mytemperature <- map["Temperature"]
        myday <- map["Day"]
        mynight <- map["Night"]
        mysources <- map["Sources"]
        mymobileLink <- map["MobileLink"]
        mylink <- map["Link"]
    }
    
}

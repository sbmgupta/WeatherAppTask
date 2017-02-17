
import Foundation
import Alamofire
import ObjectMapper

class Headline: Mappable{
    
    var myeffectiveDate : String?
    var myeffectiveEpochDate : Int?
    var myseverity : Int?
    var mytext : String?
    var mycategory : String?
    var myendDate : String?
    var myendEpochDate : Int?
    var mymobileLink : String?
    var mylink : String?
    
    required init?(map: Map) {
        myeffectiveDate <- map["EffectiveDate"]
        myeffectiveEpochDate <- map["EffectiveEpochDate"]
        myseverity <- map["Severity"]
        mytext <- map["Text"]
        mycategory <- map["EffectiveDate"]
        myendDate <- map["EndDate"]
        myendEpochDate <- map["EndEpochDate"]
        mymobileLink <- map["MobileLink"]
        mylink <- map["Link"]
        
    }
    
    func mapping(map: Map) {
        myeffectiveDate <- map["EffectiveDate"]
        myeffectiveEpochDate <- map["EffectiveEpochDate"]
        myseverity <- map["Severity"]
        mytext <- map["Text"]
        mycategory <- map["EffectiveDate"]
        myendDate <- map["EndDate"]
        myendEpochDate <- map["EndEpochDate"]
        mymobileLink <- map["MobileLink"]
        mylink <- map["Link"]
    }
    
}

import UIKit
import AVFoundation
import Alamofire
//import SwiftyJSON
import ObjectMapper

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    var Response : Data?
    var city=["Chandigarh","Delhi","Mumbai"]
    var temp=["20","22","21"]
    
    @IBOutlet weak var collectionViewMain: UICollectionView!
    var Player=AVPlayer()
    var PlayerLayer=AVPlayerLayer()
   // var URL1 : URL?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //background with video
        let URL1=Bundle.main.url(forResource: "TimeLapse", withExtension: "mp4")
        Player=AVPlayer.init(url: URL1!)
        PlayerLayer=AVPlayerLayer(player:Player)
        PlayerLayer.videoGravity=AVLayerVideoGravityResizeAspectFill
        Player.volume=0
        PlayerLayer.frame=view.layer.frame
        Player.actionAtItemEnd=AVPlayerActionAtItemEnd.none
        Player.play()
        view.layer.insertSublayer(PlayerLayer, at: 0)
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemReachEnd(notification:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: Player.currentItem)
        
      Alamofire.request("http://dataservice.accuweather.com/forecasts/v1/daily/5day/202350?apikey=Z7NpVINNJ8xBAGTtrPVSYZPnYAlAAXjJ").responseJSON { response in
            print(response.result)               
            if let JSON = response.result.value {
                 self.Response = Mapper<Data>().map(JSONObject:JSON)
                
                print("JSON: \(JSON)")
                self.collectionViewMain.reloadData()
            }
        }
        
}
    
    //to restart video
    func playerItemReachEnd(notification:NSNotification)
    {
        Player.seek(to: kCMTimeZero)
    }

    //number of sections in main collection view
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //number of collection view cells in collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  self.Response?.mydailyForecasts?.count ?? 0
    }
    
    //setting cell properties and values
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "Cell1", for: indexPath)as! MyCollectionViewCell1
        cell.lblCity.text=city[0]
        cell.lblTemperature.text = "\(self.Response!.mydailyForecasts![indexPath.item].mytemperature!.mymaximumTemperature!.myvalue!)"
        cell.lblVal1.text = self.Response!.mydailyForecasts![indexPath.item].myday!.myiconPhrase!
        cell.lblVal2.text = self.Response!.mydailyForecasts![indexPath.item].mynight!.myiconPhrase!
        print("\(self.Response?.mydailyForecasts?[indexPath.item].mytemperature!.mymaximumTemperature!.myvalue!)")
        
        
        let day1 = getDayOfWeek(today : (self.Response?.mydailyForecasts?[indexPath.item].mydate) ?? "0" )
        cell.lblCondition.text=day1
        let severity = self.Response?.myheadline?.myseverity ?? 0
        //print(self.Response?.myheadline?.myseverity ?? "0")
        cell.lblVal4.text = "\(severity)"
        
       /*
       if(indexPath.item % 2 == 0)
       {
        URL1 = Bundle.main.url(forResource: "TimeLapse", withExtension: "mp4")
        
        }
         
       else {
         
        URL1 = Bundle.main.url(forResource: "bg", withExtension: "mp4")
         
             }
 */

     /*   Player=AVPlayer.init(url: URL1!)
        PlayerLayer=AVPlayerLayer(player:Player)
        PlayerLayer.videoGravity=AVLayerVideoGravityResizeAspectFill
        Player.volume=0
        PlayerLayer.frame=view.layer.frame
        Player.actionAtItemEnd=AVPlayerActionAtItemEnd.none
        Player.play()
        view.layer.insertSublayer(PlayerLayer, at: 0)
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemReachEnd(notification:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: Player.currentItem)*/
        cell.collectionResponse = self.Response
        print("v")
        print(self.Response?.myheadline?.myseverity ?? 0)
        
        
        return cell
    }
    
    //selected cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    //to set size of cell equal to parent view
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let myWidth = self.view.frame.width
        let myHeight = self.view.frame.height
        //let screenWidth = UIScreen.main.bounds.width
        //let screenHeight = UIScreen.main.bounds.height
        //return CGSize(width: collectionViewMain.bounds.width, height: collectionViewMain.bounds.height)
       // return CGSize(width: screenWidth, height: screenHeight)
        return CGSize(width: myWidth, height:myHeight)
        
 
}
    func getDayOfWeek(today:String)->String {
        
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"
        //2017-02-19T07:00:00+05:30
        
        let todayDate = formatter.date(from: today)!
        let myCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        let myComponents = myCalendar.components(.weekday, from: todayDate)
        let weekDay = myComponents.weekday ?? 0
        
        switch weekDay {
        case 1:
            return "Sunday"
        case 2:
            return "Monday"
        case 3:
            return "Tuesday"
        case 4:
            return "Wednesday"
        case 5:
            return "Thursday"
        case 6:
            return "Friday"
        case 7:
            return "Saturday"
        default:
            print("Error fetching days")
            return "Day"
        }
     
    
    
    }


}




import UIKit

class MyCollectionViewCell1: UICollectionViewCell,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource{
    
    @IBOutlet weak var tableViewMain: UITableView!
    
    @IBOutlet weak var tableViewHeader: UIView!
    
    
    @IBOutlet weak var tableViewFooter: UIView!
    
    
    @IBOutlet weak var lblCity: UILabel!
    
    @IBOutlet weak var lblCondition: UILabel!
    
    
    @IBOutlet weak var lblTemperature: UILabel!
    
    
    @IBOutlet weak var collectionViewMid: UICollectionView!
    
    
    @IBOutlet weak var lblKey1: UILabel!
    
    @IBOutlet weak var lblVal1: UILabel!
    
    @IBOutlet weak var lblKey2: UILabel!
    
    @IBOutlet weak var lblVal2: UILabel!
    
    @IBOutlet weak var lblKey3: UILabel!
   
    @IBOutlet weak var lblVal3: UILabel!
    
    
    @IBOutlet weak var lblKey4: UILabel!
    
    @IBOutlet weak var lblVal4: UILabel!
    
    
    var week = ["sunday","monday","tuesday","wednesday","thursday","friday","saturday"]
    var max = ["80","84","82","80","81","83","80"]
    var min = ["60","68","70","66","60","65","68"]
   
    var collectionResponse : Data?{
        didSet{
            print("did set")
            print(collectionResponse?.myheadline?.myseverity ?? 0)
        }
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableViewMain.delegate=self
        tableViewMain.dataSource=self
        collectionViewMid.dataSource=self
        collectionViewMid.delegate=self
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.collectionResponse?.mydailyForecasts?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mycell=tableView.dequeueReusableCell(withIdentifier: "TableCell") as! MyTableViewCell1
        mycell.lblDay.text=week[indexPath.row]
        mycell.lblMaxTemp.text="\(self.collectionResponse!.mydailyForecasts![indexPath.item].mytemperature!.mymaximumTemperature!.myvalue!)"
        mycell.lblMinTemp.text="\(self.collectionResponse!.mydailyForecasts![indexPath.item].mytemperature!.mymaximumTemperature!.myvalue!)"
        mycell.imgCondition.image = #imageLiteral(resourceName: "sunny")
        print(collectionResponse?.myheadline?.myseverity ?? 0)
        print("see above")
        
        return mycell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let Collectcell=collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell2", for: indexPath)as! MiddleCollectionViewCell
        Collectcell.lblTime.text = "18"
         Collectcell.lblTemp.text = "07"
        Collectcell.imgMid.image = #imageLiteral(resourceName: "temp")
        return Collectcell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

import UIKit

class MyTableViewCell1: UITableViewCell {
    
    @IBOutlet weak var lblDay: UILabel!
        
    @IBOutlet weak var lblMinTemp: UILabel!
    
    @IBOutlet weak var lblMaxTemp: UILabel!

    @IBOutlet weak var imgCondition: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 }

//
//  NewsTableViewCell.swift
//  XebiaTest
//
//  Created by mojave on 06/12/19.
//  Copyright © 2019 Narender. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

extension NSObject {
    
    // Name Of class
    class var stringRepresentation: String {
        let name = String(describing: self)
        return name
    }
}

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var authorLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var newsImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    ///Method to configure data table view cell
    func configure(whitViewModel dataItem:NewsDataModel, row: Int) {
        titleLbl.text = dataItem.title
        dateLbl.text = dataItem.published_date
        authorLbl.text = dataItem.byline
        Alamofire.request(dataItem.mediaUrl?[0] ?? "https://www.team8.vc/wp-content/uploads/2017/07/img_avatar.jpg").responseImage { response in
            if let image = response.result.value {
                DispatchQueue.main.async {
                    self.newsImg.image = image
                }
            }
        }
    }

}

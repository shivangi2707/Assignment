//
//  RegularArticleTableViewCell.swift
//  Assignment
//
//  Created by Shivangi on 12/02/22.
//

import UIKit

class RegularArticleTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    
    @IBOutlet weak var mainView: UIView! {
        didSet {
            self.mainView.layer.cornerRadius = 26.0
        }
    }
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    static var name: String {
        return String(describing: self)
    }

    //MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureRegularArticleCell(data: NewsFeedItem?) {
        self.titleLabel.text = data?.title
        self.newsImageView.setImageFromURL(urlString: data?.thumbnail)
        self.dateLabel.text = data?.pubDate?.convertStringDateFormat(formatFrom: DateFormat.yyyyMdHHms, formatTo: DateFormat.mmmdyyyy)
        self.timeLabel.text = data?.pubDate?.convertStringDateFormat(formatFrom: DateFormat.yyyyMdHHms, formatTo: DateFormat.mmmdyyyy)
    }

}

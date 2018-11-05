//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Danny on 11/4/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
class TweetCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView! {
        didSet {
           profileImageView.layer.cornerRadius = 3.0
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var dateCreatedLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var replyCountLabel: UILabel!
    @IBOutlet weak var retweetCountLabel: UILabel!
    @IBOutlet weak var favoriteCountLabel: UILabel!
    @IBOutlet weak var messageCountLabel: UILabel!
    
    @IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    
    var tweet: Tweet! {
        didSet {
            nameLabel.text = tweet.user?.name
            let screenName = tweet.user?.screenName
            screenNameLabel.text = "@\(String(describing: screenName))"
            dateCreatedLabel.text = tweet.createdAtString
            tweetTextLabel.text = tweet.text
            retweetCountLabel.text = String(tweet.retweetCount!)
            favoriteCountLabel.text = String(tweet.favoriteCount!)
            
            profileImageView.af_setImage(withURL: URL(string: (tweet.user?.profileImgURL)!)!)
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

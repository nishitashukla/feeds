//
//  PostCell.swift
//  Feeds
//
//  Created by Nishita Shukla on 27/08/20.
//  Copyright © 2020 Nishita Shukla. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell
{
    
    //MARK: Variables
    @IBOutlet weak var imgOwnerProfile: CustomImageView!
    @IBOutlet weak var lblOwnerTitle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var imgAttachment: CustomImageView!
    @IBOutlet weak var lblLikesCount: UILabel!
    @IBOutlet weak var lblCommentCount: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!

    
    
    //MARK: Default Function
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //MARK: Set data in the cell
    var feedsListCellModel : FeedsListCellModel? {
        didSet {
            
            if let imageURL = feedsListCellModel?.owner_image
            {
                if(imageURL == "")
                {
                    imgOwnerProfile.image = UIImage(named: "placeholder_image")
                }
                else
                {
                    imgOwnerProfile.loadImageUsingUrlString(urlString: imageURL)
                }
            }
            
            if let imageURL = feedsListCellModel?.attachment_image
            {
                if(imageURL == "")
                {
                    imgAttachment.image = UIImage(named: "placeholder_image")
                }
                else
                {
                    imgAttachment.loadImageUsingUrlString(urlString: imageURL)
                }
            }
            
            var likes_count = ""
            if let likes = feedsListCellModel?.likes_count
            {
                likes_count = "\(likes)"
            }
            
            var comments_count = ""
            if let comment = feedsListCellModel?.comment_count
            {
                comments_count = "\(comment)"
            }
            
            
            lblOwnerTitle.text = feedsListCellModel?.owner_title
            lblDate.text = feedsListCellModel?.created_date
            lblLikesCount.text = "\(likes_count) Likes"
            lblCommentCount.text = "\(comments_count) Comments"
            lblTitle.text = feedsListCellModel?.attachment_title
            lblDescription.text = feedsListCellModel?.attachment_body
        }
    }
    
}


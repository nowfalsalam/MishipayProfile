//
//  ProfileTableViewCell.swift
//  MishipayProfile_Example
//
//  Created by Nowfal E Salam on 23/09/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import MishipayProfile

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure( profile : Profile){
        name.text = profile.name
        if let image = profile.image{
            avatar.image = image
        } else {
            avatar.image = #imageLiteral(resourceName: "avatar")
        }
    }

}

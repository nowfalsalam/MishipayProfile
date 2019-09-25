//
//  ImageView.swift
//
//  Created by Nowfal E Salam on 21/09/19.
//  Copyright © 2019 Nowfal E Salam. All rights reserved.
//

import Foundation
import UIKit

class RoundedCornerImageView : UIImageView {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
}

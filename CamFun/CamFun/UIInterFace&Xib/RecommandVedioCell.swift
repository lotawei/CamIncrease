//
//  RecommandVedioCell.swift
//  CamFun
//
//  Created by 伟龙 on 2020/2/22.
//  Copyright © 2020 伟龙. All rights reserved.
//

import UIKit
import RxSwift
import Kingfisher
class RecommandVedioCell: UITableViewCell {
    var  vedioinfo:VedioInfo!
    @IBOutlet weak var bodyView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
            
        // Initialization code
    }
    
    func vedioinfoConfig(_ info:VedioInfo) {
        self.vedioinfo = info
        
        
        self.bodyView.kf.setImage(with: URL.init(string: self.vedioinfo.preimage)!)
        
        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

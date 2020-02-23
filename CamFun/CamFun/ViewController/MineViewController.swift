//
//  MineViewController.swift
//  CamFun
//
//  Created by 伟龙 on 2020/2/22.
//  Copyright © 2020 伟龙. All rights reserved.
//

import Foundation
import UIKit

class MineViewController:BaseViewController{
    
    static func  sharevc() -> MineViewController
    {
        let  instancevc =  UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier:String.init(describing: self.classForCoder())) as! MineViewController
        return instancevc
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        
    }
    
    
}

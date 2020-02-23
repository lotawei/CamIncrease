//
//  MakeVideoViewController.swift
//  CamFun
//
//  Created by 伟龙 on 2020/2/22.
//  Copyright © 2020 伟龙. All rights reserved.
//

import Foundation
import UIKit
class MakeVideoViewController:BaseViewController{
    
    static func  sharevc() -> MakeVideoViewController
    {
        let  instancevc =  UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier:String.init(describing: self.classForCoder())) as! MakeVideoViewController
        return instancevc
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        
    }
    
    
}

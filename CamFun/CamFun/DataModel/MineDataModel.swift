//
//  MineDataModel.swift
//  CamFun
//
//  Created by 伟龙 on 2020/2/23.
//  Copyright © 2020 伟龙. All rights reserved.
//

import Foundation
import RxCocoa

enum MineDataModel {
    case TopData(_ secionname:String , _ datadic:[String:Any] )
    case GradeData(_ secionname:String , _ datadic:[String:Any] )
    
    case MessageData(_ secionname:String , _ datadic:[String:Any] )
}





//
//  MineDataManager.swift
//  CamFun
//
//  Created by 伟龙 on 2020/2/27.
//  Copyright © 2020 伟龙. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources
class MineDataManager:NSObject{
    static  let instance = MineDataManager()
    
    var     minedatas = BehaviorSubject(value: [SectionModel<String,MineDataModel>]())
      
    override init() {
        super.init()
        
        var  enumdatas = [MineDataModel]()
        let  topdata = MineDataModel.TopData("头部", ["title":"头部数据","content":"你好我是芙兰尔做的"])
        let  gradedata = MineDataModel.GradeData("战绩", ["title":"战绩","content":"28战绩完胜"])
           let  dongtaidada = MineDataModel.MessageData("我的动态", ["title":"我的动态","content":"你好我是你爹爹"])
        enumdatas.append(topdata)
        enumdatas.append(gradedata)
        enumdatas.append(dongtaidada)
        let  sectiondata = SectionModel.init(model: "", items: enumdatas)
        
        self.minedatas.onNext([sectiondata])
    }
    
}

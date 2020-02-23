//
//  IndexVedieManager.swift
//  CamFun
//
//  Created by 伟龙 on 2020/2/22.
//  Copyright © 2020 伟龙. All rights reserved.
//

import Foundation

import RxSwift

struct Author {
    var  name:String!
    var  athelate:String!
    var  age:Int!
}
struct VedioInfo {
    var  url:String!
    var  author:Author!
    var  preimage:String!
    
    static func  testdata() -> VedioInfo
    {
        
        
        let  randommp4url = ["http://vfx.mtime.cn/Video/2019/03/21/mp4/190321153853126488.mp4","http://vfx.mtime.cn/Video/2019/03/19/mp4/190319222227698228.mp4","http://vfx.mtime.cn/Video/2019/03/19/mp4/190319212559089721.mp4","http://vfx.mtime.cn/Video/2019/03/18/mp4/190318231014076505.mp4","http://vfx.mtime.cn/Video/2019/03/18/mp4/190318214226685784.mp4","http://vfx.mtime.cn/Video/2019/03/19/mp4/190319125415785691.mp4","http://vfx.mtime.cn/Video/2019/03/17/mp4/190317150237409904.mp4","http://vfx.mtime.cn/Video/2019/03/14/mp4/190314223540373995.mp4","http://vfx.mtime.cn/Video/2019/03/14/mp4/190314102306987969.mp4","http://vfx.mtime.cn/Video/2019/03/13/mp4/190313094901111138.mp4","http://vfx.mtime.cn/Video/2019/03/12/mp4/190312143927981075.mp4",
                             "  http://vfx.mtime.cn/Video/2019/03/12/mp4/190312083533415853.mp4","  http://vfx.mtime.cn/Video/2019/03/09/mp4/190309153658147087.mp4"]
        let randomurl = randommp4url[Int.randomCustom(min: 0, max: randommp4url.count - 1)]
        
        let  auth = Author.init(name: "lotawei", athelate: "http://b-ssl.duitang.com/uploads/item/201703/26/20170326161532_aGteC.jpeg", age: 30)
        let   testinfo = VedioInfo.init(url:randomurl, author: auth, preimage: "http://b-ssl.duitang.com/uploads/item/201707/30/20170730203958_PZidx.jpeg")
        
        return testinfo
    }
    
    
    
}



class IndexVedieManager:NSObject{
    static  var   shareInstance = IndexVedieManager()
    
    var     recommandprevedioes:BehaviorSubject<[VedioInfo]> = BehaviorSubject.init(value: [])
    
    override init() {
        
        var  datas = [VedioInfo]()
        for _ in 0...6 {
            let  vedioinfo = VedioInfo.testdata()
            datas.append(vedioinfo)
        }
        self.recommandprevedioes.onNext(datas)
    }
    
    
}

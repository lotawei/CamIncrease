//
//  IndexVedieManager.swift
//  CamFun
//
//  Created by 伟龙 on 2020/2/22.
//  Copyright © 2020 伟龙. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import RxDataSources
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
        let randompreUrls = ["https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582520338249&di=1d14daa9dcfd7428880752efa748ed01&imgtype=0&src=http%3A%2F%2Fa3.att.hudong.com%2F68%2F61%2F300000839764127060614318218_950.jpg","https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582520338248&di=b8c7706c322c2f77ddbb5ca06f1b14fd&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F78%2F52%2F01200000123847134434529793168.jpg","https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582520338247&di=4c3fc24639618bde39bf8d8b3cf95f57&imgtype=0&src=http%3A%2F%2Fa3.att.hudong.com%2F14%2F75%2F01300000164186121366756803686.jpg","https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582520338247&di=17ee41f82209dc8517c937f040bcc72f&imgtype=0&src=http%3A%2F%2Fa2.att.hudong.com%2F08%2F72%2F01300000165476121273722687045.jpg","https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582520338245&di=b13a29922a4798d86c7cab179000a196&imgtype=0&src=http%3A%2F%2Fa3.att.hudong.com%2F65%2F38%2F16300534049378135355388981738.jpg","https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582520338245&di=9e479f0d69d94b33d8ab8b8e318afbbe&imgtype=0&src=http%3A%2F%2Fa4.att.hudong.com%2F47%2F66%2F01300000337727123266663353910.jpg","https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582520338243&di=34d06a55057a4b1aa732ffc5cef9722b&imgtype=0&src=http%3A%2F%2Fpics4.baidu.com%2Ffeed%2Fe824b899a9014c08545e5585620d360e7bf4f421.jpeg%3Ftoken%3Dda3dd6b6e506335f742d3378e63012e1%26s%3D92397E87D273FBD4441589A503006003"]
        let randomurl = randommp4url[Int.randomCustom(min: 0, max: randommp4url.count - 1)]
        
        let  randompreView = randompreUrls[Int.randomCustom(min: 0, max: randompreUrls.count - 1)]
        
        let  auth = Author.init(name: "lotawei", athelate: "http://b-ssl.duitang.com/uploads/item/201703/26/20170326161532_aGteC.jpeg", age: 30)
        let   testinfo = VedioInfo.init(url:randomurl, author: auth, preimage: randompreView)
        
        return testinfo
    }
    
    
    
}



class IndexVedieManager:NSObject{
    static  var   shareInstance = IndexVedieManager()
    
     var     recommandprevedioes = BehaviorSubject(value: [SectionModel<String,VedioInfo>]())
    
    
    override init() {
        
        var  datas = [VedioInfo]()
        for _ in 0...6 {
            let  vedioinfo = VedioInfo.testdata()
            datas.append(vedioinfo)
        }
        let section = SectionModel.init(model: "", items: datas)
        
        self.recommandprevedioes.onNext([section])
        
        
        
    }
    
    
}

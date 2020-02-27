//
//  MineViewController.swift
//  CamFun
//
//  Created by 伟龙 on 2020/2/22.
//  Copyright © 2020 伟龙. All rights reserved.
//

import Foundation
import UIKit
import AMScrollingNavbar
import pop
import SnapKit
import RxCocoa
import RxDataSources



class MineViewController:BaseViewController,ScrollingNavigationControllerDelegate{
    let  topcellheight:CGFloat = 400.0
    let  gradecellheight:CGFloat = 200.0
    let  messagecellheight:CGFloat = 200.0
    static func  sharevc() -> MineViewController
    {
        let  instancevc =  UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier:String.init(describing: self.classForCoder())) as! MineViewController
        return instancevc
    }
    @IBOutlet  weak  var  tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //自定义导航栏
         self.navigationController?.navigationBar.isHidden = false
        navInital()
        //table init
        tableViewDataInital()
    }
    
    func navInital(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.init(named: "bar_back_nav"), for: .default)
        
        let  righticonsetting = UIBarButtonItem.init(image:UIImage.init(named: "bar_setting"), style: .plain, target: self, action: #selector(settingVc))
        let  righticonmesg = UIBarButtonItem.init(image:UIImage.init(named: "bar_message"), style: .plain, target: self, action: #selector(mesgenter))
        self.navigationItem.rightBarButtonItems = [ righticonsetting, righticonmesg]
        
    }
    @objc func  settingVc(){
        
        
    }
    @objc func  mesgenter(){
        
        
    }
    
    
    
    
    
}

extension    MineViewController:UITableViewDelegate{
    
    func  tableViewDataInital(){
        
        
        
        self.automaticallyAdjustsScrollViewInsets = false
        self.tableView.separatorColor = UIColor.clear
        self.tableView.separatorStyle  = .none
        
        self.tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(statusnavheight)
            make.left.right.equalTo(self.view)
            make.bottom.equalTo(self.view).offset(-tabbarheight)
        }
        
        let rxdatasource = RxTableViewSectionedReloadDataSource<SectionModel<String,MineDataModel>> (
            
            configureCell: { dataSource, tableView, indexPath, item in
                
                
                if indexPath.row == 0 {  let cell = tableView.dequeueReusableCell(withIdentifier: "MineInfoTopCell") as! MineInfoTopCell
                    
                    return  cell
                }
                else  if  indexPath.row == 1 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "MineGradeCell") as! MineGradeCell
                    
                    return  cell
                    
                    
                }
                else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "MineMessageCell") as! MineMessageCell
                    
                    return  cell
                }
                
                
                
                
                
                
        }
        )
        
        MineDataManager.instance.minedatas.asObserver().bind(to: tableView.rx.items(dataSource:rxdatasource)).disposed(by: self.disposebag)
        tableView.rx.setDelegate(self).disposed(by: self.disposebag)
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            
            
            return  topcellheight
            
            
        }
        else if indexPath.row == 1 {
            
            
            return  gradecellheight
            
            
        }
        else {
            
            
            
            return  messagecellheight
        }
    }
    
    
    
}

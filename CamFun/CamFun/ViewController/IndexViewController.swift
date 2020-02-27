//
//  IndexViewController.swift
//  CamFun
//
//  Created by 伟龙 on 2020/2/21.
//  Copyright © 2020 伟龙. All rights reserved.
//

import Foundation
import UIKit
import AMScrollingNavbar
import SnapKit
import RxSwift
import RxCocoa
import RxDataSources
import pop
class IndexViewController: BaseViewController ,ScrollingNavigationControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    static func  sharevc() -> IndexViewController
    {
        let  indexvc =  UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"IndexViewController") as! IndexViewController
        return indexvc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        
        
        //tableview bind
        self.tableViewDataInital()
    
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let navigationController = self.navigationController as? ScrollingNavigationController {
            
            navigationController.followScrollView(self.tableView)
             
               
           }
    }
   
    
}

extension IndexViewController{
    func  layoutScorller(){
        
        
        
    }
    
    
    
}
extension  IndexViewController:UITableViewDelegate{
    func  tableViewDataInital(){
        
        if #available(iOS 11.0, *) {
            self.tableView.contentInsetAdjustmentBehavior = .never
        } else {
            // Fallback on earlier versions
        }
        
        self.automaticallyAdjustsScrollViewInsets = false
        self.tableView.separatorColor = UIColor.clear
        self.tableView.separatorStyle  = .none
        self.tableView.isPagingEnabled = true
      self.tableView.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(self.view)
        make.bottom.equalTo(self.view).offset(tabbarheight)
        }
        
            self.tableView.showsVerticalScrollIndicator = false
        
        let rxdatasource = RxTableViewSectionedReloadDataSource<SectionModel<String,VedioInfo>> (
            
            configureCell: { dataSource, tableView, indexPath, item in
                
                
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "RecommandVedioCell", for: indexPath) as! RecommandVedioCell
                cell.vedioinfoConfig(item)
                return cell
                
        }
        )
        
        IndexVedieManager.shareInstance.recommandprevedioes.asObserver().bind(to: tableView.rx.items(dataSource:rxdatasource)).disposed(by: self.disposebag)
       
        tableView.rx.willDisplayCell.subscribe(onNext: { cell, indexPath in
            let  smallscale = POPBasicAnimation.init(propertyNamed: kPOPLayerPositionX)
            smallscale?.fromValue = NSValue(cgPoint: CGPoint(x:-self.view.center.x, y:0))
            smallscale?.toValue = NSValue(cgPoint: CGPoint(x:self.view.center.x , y:0))
                     
            smallscale?.duration = 0.7

            cell.pop_add(smallscale, forKey:"position.x")

            
         
            
             
        }).disposed(by: self.disposebag)
            
        tableView.rx.setDelegate(self).disposed(by: self.disposebag)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  self.tableView.frame.size.height
    }
    
    
}



        


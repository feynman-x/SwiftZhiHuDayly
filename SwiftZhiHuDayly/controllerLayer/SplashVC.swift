//
//  SplashVC.swift
//  SwiftZhiHuDayly
//
//  Created by 55HaiTao on 2016/11/29.
//
//

import UIKit
import Alamofire
import Kingfisher
import HandyJSON

class SplashVC: UIViewController {

    @IBOutlet weak var contentImagView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(contentImagView == nil)
        self.requestData()
    }
    
    
    //请求扉页页面数据
    func requestData(){
        
        Alamofire.request("https://news-at.zhihu.com/api/4/start-image/1080*1776").responseJSON{reponse in
            
            //data转实体类
            let bean = JSONDeserializer<SplashBean>.deserializeFrom(dict: reponse.result.value as! NSDictionary?)
            
            self.showPicAndText(bean: bean!)
        }
    }
    
    func showPicAndText( bean:SplashBean){
        let url = URL(string: bean.img!)
        contentImagView.kf.setImage(with: url)
        
        weak var weakSelf = self
        
        let thread = Thread(block: {
            sleep(UInt32(3))
            weakSelf?.performSelector(onMainThread: #selector(self.jump), with: nil, waitUntilDone: false)
        })
        thread.start()
    }
    
    func jump(){
        let homeVC = HomeVC()
        self.present(homeVC, animated: true, completion: nil)
    }

}

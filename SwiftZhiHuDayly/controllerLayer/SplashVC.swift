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
        
        self.requestData()
    }
    
    
    //请求扉页页面数据
    func requestData(){
        
        Alamofire.request("https://news-at.zhihu.com/api/4/start-image/1080*1776").responseJSON{reponse in
            
            
            if let bean = JSONDeserializer<SplashBean>.deserializeFrom(json: reponse.result.value as! String?){
                self.contentImagView!.kf.setImage(with: URL(string: bean.img!))
            }
            
        }
    }

}

//
//  File.swift
//  MassMutual_2nd
//
//  Created by Tiancong Gu on 3/29/16.
//  Copyright © 2016 Tiancong Gu. All rights reserved.
//

/*********************
 diffierent methods of parse JSON
 *********************/

import Alamofire
import UIKit

class JSONContent {
    
    
    // MARK: Properties
    
    // MARK: Initialization
    
    init(){
        
    }
    
    
    func DownloadJSON(){
        
        Alamofire.request(.GET, "http://api.nytimes.com/svc/movies/v2/reviews/search?api-key=b05c090ae54bc65d1921373a6717f048:14:74255139").responseJSON() {
            response in
            if let json = response.result.value {
                print("JSON: \(json)")
            }
            
        }
        /*
         var dict = ["id":"002", "name": "abc"]
         
         var jsonDict = try! NSJSONSerialization.dataWithJSONObject(dict, options: NSJSONWritingOptions.PrettyPrinted)
         
         //直接写入文件
         jsonDict.writeToFile("/Users/tianconggu/Documents/MassMutual/MassMutual_newsApp/test.json", atomically: true)
         
         */
        /*
         let path = NSBundle.mainBundle().pathForResource("/Users/tianconggu/Documents/MassMutual/MassMutual_newsApp/test.json", ofType: nil)!
         let data = NSData(contentsOfFile: path)!
         do{
         let dictArr = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)
         for dict in dictArr as! [[String: AnyObject]]
         {
         print(dict)
         }
         }*/
        
        
        /*
         // 获取Url --- 这个是我获取的天气预报接口，时间久了可能就会失效
         let url:NSURL = NSURL(string: "http://api.nytimes.com/svc/movies/v2/reviews/search?api-key=b05c090ae54bc65d1921373a6717f048:14:74255139")!
         // 转换为requset
         let requets:NSURLRequest = NSURLRequest(URL: url)
         //NSURLSession 对象都由一个 NSURLSessionConfiguration 对象来进行初始化，后者指定了刚才提到的那些策略以及一些用来增强移动设备上性能的新选项
         let configuration:NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
         let session:NSURLSession = NSURLSession(configuration: configuration)
         
         //NSURLSessionTask负责处理数据的加载以及文件和数据在客户端与服务端之间的上传和下载，NSURLSessionTask 与 NSURLConnection 最大的相似之处在于它也负责数据的加载，最大的不同之处在于所有的 task 共享其创造者 NSURLSession 这一公共委托者（common delegate）
         let task:NSURLSessionDataTask = session.dataTaskWithRequest(requets, completionHandler: {
         (data:NSData?,response:NSURLResponse?,error:NSError?)->Void in
         if error == nil{
         do{
         let responseData:NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
         print(responseData)
         }catch{
         
         }
         }
         })
         task.resume()*/
    }

}

//
//  ViewController.swift
//  TestJsonObject
//
//  Created by Akekapon Suebprom on 9/17/2560 BE.
//  Copyright © 2560 kratostracking. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string:"https://api.fixer.io/latest")
        let task = URLSession.shared.dataTask(with: url!){(data,request,error) in
            if error != nil {
                print("error!!")
            }else{
            
                if let content = data{
                    do{
                        let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        let base = myJson["base"] as! String
                        if let rates = myJson["rates"] as? NSDictionary {
                            
                            if let currentCy = rates["JPY"]{
                                print("Currency of Yen : \(currentCy)")
                            }
                            print("base : \(String(describing: base))")
                        }
                        
                    }catch{
                    
                    }
                }
            }
            
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


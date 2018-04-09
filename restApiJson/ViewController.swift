//
//  ViewController.swift
//  restApiJson
//
//  Created by Arturo Sanhueza on 02-04-18.
//  Copyright © 2018 Arturo Sanhueza. All rights reserved.
//

import UIKit

import UIKit

class ViewController: UIViewController {
    
    //the json file url
    let URL_HEROES = "http://localhost:3000/db";
    
    var nameArray = [String]()
    
    //the label we create
    @IBOutlet weak var labelTest: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getJsonFromUrl();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getJsonFromUrl(){
        let url = NSURL(string: URL_HEROES)
        
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            
            print(data)

            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                
                print(jsonObj!.value(forKey: "peliculas")!)
                
                if let heroeArray = jsonObj!.value(forKey: "peliculas") as? NSArray {
                    for heroe in heroeArray{
                        
                        if let heroeDict = heroe as? NSDictionary {
                            
                            if let name = heroeDict.value(forKey: "nombre") {
                                
                                self.nameArray.append((name as? String)!)
                            }
                            
                        }
                    }
                }
                
                OperationQueue.main.addOperation({
                    self.showNames()
                })
            }
        }).resume()
    }
    
    func showNames(){
        for name in nameArray{
            
            labelTest.text = labelTest.text! + name + "\n";
        }
    }
    
    
}

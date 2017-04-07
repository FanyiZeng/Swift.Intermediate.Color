//
//  ViewController.swift
//  colortest
//
//  Created by 曾凡怡 on 2017/4/7.
//  Copyright © 2017年 曾凡怡. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        func intermediate(from:UIColor,to:UIColor,distance:CGFloat)->UIColor{
            
            let left = from.cgColor.components
            let right = to.cgColor.components
            
            let leftComponents = left!.count == 4 ? left! : [left![0],left![0],left![0],left![1]]
            
            let rightComponents = right!.count == 4 ? right! : [right![0],right![0],right![0],right![1]]
            
            var newComponents = [CGFloat]()
            for i in 0..<4{
                newComponents.append((rightComponents[i] - leftComponents[i]) * distance + leftComponents[i])
            }
            
            
            return UIColor.init(red: newComponents[0], green: newComponents[1], blue: newComponents[2], alpha: newComponents[3])
        }
        let count = Int(view.bounds.height)
        for i in 0...count{
            let v1 = UIView(frame: CGRect(x: 0, y: CGFloat(i)*view.bounds.height / CGFloat(count), width: view.bounds.width, height: 50))
            view.addSubview(v1)
            v1.backgroundColor = intermediate(from: UIColor.white, to: UIColor.init(red: 0.2, green: 0.3, blue: 0.6, alpha: 0.7), distance: 1.0/CGFloat(count) * CGFloat(i))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


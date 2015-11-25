//
//  ViewController.swift
//  RxSwiftHello
//
//  Created by Pepas Personal on 11/24/15.
//  Copyright © 2015 Pepas Labs. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class OneHundredHelloGenerator
{
    class func generate() -> Observable<String>
    {
        let intsObservable = range(0, 100)
        
        let helloObservable = intsObservable.map({ (_) -> String in
            return "hello"
        })
        
        return helloObservable
    }
}

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        OneHundredHelloGenerator.generate().subscribeNext { (s) -> Void in
            debugPrint(s)
        }.addDisposableTo(disposeBag)
    }
}

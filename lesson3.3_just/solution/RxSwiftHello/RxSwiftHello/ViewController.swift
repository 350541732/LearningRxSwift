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

class SingleHelloGenerator
{
    class func generate() -> Observable<String>
    {
        return just("hello")
    }
}

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SingleHelloGenerator.generate().subscribeNext { (s) -> Void in
            debugPrint(s)
        }.addDisposableTo(disposeBag)
    }
}

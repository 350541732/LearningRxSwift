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

class TripleHelloGenerator
{
    class func generate() -> Observable<String>
    {
        return sequenceOf("hello","hello","hello")
    }
}

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TripleHelloGenerator.generate().subscribeNext { (s) -> Void in
            debugPrint(s)
        }.addDisposableTo(disposeBag)
    }
}

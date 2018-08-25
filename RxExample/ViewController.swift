//
//  ViewController.swift
//  RxExample
//
//  Created by Satoshi Komatsu on 2018/08/23.
//  Copyright © 2018年 Satoshi Komatsu. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var field1: UITextField!

    let aa = ["a","b","c","d","e"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let bb = aa.map { "ホリタク\($0)" }
//        print(bb)
        
//        field1.rx.text
//            .bind(to: label1.rx.text)
//            .disposed(by: disposeBag)
        
//        let _ = ClosureHolder()
        
        field1.rx.text
            .subscribe(onNext: {
                print($0)
            })
            .disposed(by: disposeBag)
        
    }
}

class ClosureHolder {
    private var myClosure: ((_ a: String) -> Void)?
    
    deinit {
        print("ClosureHolder deinit")
    }
    
    init() {
        myClosure = { [weak self] in
            print($0)
            guard let me = self else { return }
            me.innerFunc()
        }
        myClosure?("aaa")
    }
    
    func innerFunc() {
        print("innerFunc")
    }
}


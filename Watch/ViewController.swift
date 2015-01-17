//
//  ViewController.swift
//  Watch
//
//  Created by Yuta on 2015/01/01.
//  Copyright (c) 2015年 Yuta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //1.型推論
    //var name : NSString = "yuta"
    // ↓
      var name = "yuta"
    
    
    //2.nilの代入ができるoptional型
    //var age: Int ←コンパイルエラー
    // ↓
      var age :Int?
    //var age :Int! ←!も使える（コンパイラ補完を無視して実行）
    
    
    //3.ポインタの概念が無い
    //下記のようなのが必要なくなる
    //NSObject *obj = [[NSObject alloc] init];
    //obj = nil;
    //
    //NSObject *obj = [[[NSObject alloc] init] autorelease];
    
    
    //4.関数型言語の特徴を持つ
    //関数を引数に取れる（ファーストクラス関数）
    /*func imageOf(card: ET, callback: (UIImage) -> Void) {
        resourceOf(card, name:SystemConfig.CardImageFilename) { data in
            if let d = data {
                callback(UIImage(data: d))
            }
        }
    }*/
    
    
    //5.ヘッダファイルが必要無い
    //Obj-Cファイルの参照もできる
    //<project名>-Bridging-Header.hというファイルを作り、import文を書く
    //#import "TestViewController.h"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


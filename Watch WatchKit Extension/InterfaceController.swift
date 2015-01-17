//
//  InterfaceController.swift
//  Watch WatchKit Extension
//
//  Created by Yuta on 2015/01/15.
//  Copyright (c) 2015年 Yuta. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var watch: WKInterfaceDate!
    @IBOutlet weak var dynamicImage: WKInterfaceImage!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        watch.setTextColor(UIColor.redColor())
        
        // タイマー（1秒毎）
        var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "update", userInfo: nil, repeats: true)
        
    }
    
    // 1秒毎に行う処理
    func update() {
        let now = NSDate() // 現在日時の取得
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US") // ロケールの設定
        dateFormatter.dateFormat = "ss" // 日付フォーマットの設定
        var sec = dateFormatter.stringFromDate(now) // 現在時刻の取得
        
        // 秒針の設定(詳細を覚える必要は無いです)
        var angle: Double = Double(sec.toInt()!)    // 数値に変換
        var mRad = -90 * M_PI / 180;    // ベースの針の長さ
        var pi:Double = M_PI * 2    // 直径
        var x = 50 + 50.0 * cos(angle * pi / 60.0 + mRad)   // x座標
        var y = 50 + 50.0 * sin(angle * pi / 60.0 + mRad)   // y座標
        var x_float:CGFloat = CGFloat(x)    // 表示用の型に変換
        var y_float:CGFloat = CGFloat(y)    // 表示用の型に変換
        
        // コンテキストを設定
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(100, 100), false, 0)
        let context = UIGraphicsGetCurrentContext()
        
        // 直線
        CGContextSetLineWidth(context, 1.0);   // 線の太さ
        CGContextSetRGBStrokeColor(context, 1, 1, 1, 1) // 線の色(白)
        CGContextMoveToPoint(context, 50, 50);  // 始点
        CGContextAddLineToPoint(context, x_float, y_float);  // 終点
        CGContextStrokePath(context);  // 描画
        
        // 描画した画像をスクリーンショットとして保存
        let secondHandImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // 1秒毎に秒針を更新
        dynamicImage.setImage(secondHandImage)
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

//
//  ViewController.swift
//  OmikujiApp
//
//  Created by YhamIVan on 2020/12/08.
//

import UIKit

class ViewController: UIViewController {
    
    //    スタートボタン
    @IBOutlet weak var startBtn: UIButton!
    //    結果画像表示
    @IBOutlet weak var resultImg: UIImageView!
    
    //    運勢結果を表示するテキストラベル
    @IBOutlet weak var resultLabel: UILabel!
    //    結果の配列の生成
    let array:[String] = ["大吉","中吉","小吉","末吉","凶","大凶"]
    //    let array:[Int] = [0,1,2,3,4,5]
    
    //    タイマーの生成
    var timer = Timer()
    
    //    ボタンを押した回数
    var startBtncount = 0
    
    //    画像配列の定義
    var imageArray = [UIImage]()
    
    //    カウントの定義
    var count = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // スクリーンの横縦幅
        let screenWidth:CGFloat = self.view.frame.width
        let screenHeight:CGFloat = self.view.frame.height
        
        //        画像の名前が入った配列の中身を画像変換して画像の配列に保存する処理
        for i in array{
            //print(i)
            //画像変換
            let image = UIImage(named: "\(i)")
            imageArray.append(image!)
        }
        
        //ボタン装飾-----------------------------------------
        //        let rgba = UIColor(red: 255/255, green: 128/255, blue: 168/255, alpha: 1.0)
        //        startBtn.backgroundColor = rgba
        // ボタン背景色設定
        let rgba = UIColor(red: 0.6, green: 0.4, blue: 0.2, alpha: 1.0)
        startBtn.backgroundColor = rgba
        startBtn.layer.borderWidth = 0.5
        startBtn.layer.borderColor = UIColor.black.cgColor
        // ボタンの位置とサイズを設定
        startBtn.frame = CGRect(x:screenWidth/4, y:screenHeight - screenHeight/4,width:screenWidth/2, height:60)
        // ボタンのテキストカラーを設定
        startBtn.setTitleColor(.white, for: .normal)
        // システムフォントをサイズ36に設定
        //startBtn.font = UIFont.systemFont(ofSize: 36)
        startBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        // フォントサイズを自動調整するか
        self.view.addSubview(startBtn) // ビューに追加する
        //        初めに表示する画像
        resultImg.image = UIImage(named: "おみくじ")
    }
    
    //    おみくじスタートボタン
    @IBAction func startBtnAct(_ sender: Any) {
        startBtncount = startBtncount + 1
        //1回目
        if startBtncount == 1 {
            //           print("1回目です。")
            //        タイマーを開始する
            startTimer()
            //ボタンを押した瞬間にテキストネームを変換する
            startBtn.setTitle("ストップ", for: .normal) // ボタンのタイトル
        }else{
            //2回目
            //        タイマーをストップする
            timer.invalidate()
            //            print("2回目！")
            startBtncount = 0
            resultLabel.text = "今年の運勢は" + array[count] + "です！"
            startBtn.setTitle("もう一回！", for: .normal) // ボタンのタイトル
        }
    }
    
    //    タイマーをスタートさせる関数
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    //    タイマーにより呼ばれる関数
    @objc func timerAction() {
        count = count + 1
        
        if count > 5 {
            count = 0
        }
        //        countが5になった時に7番目の要素には何もないからエラーが発生する
        resultImg.image = imageArray[count]
    }
}


//
//  ViewController.swift
//  Swift5WKWebView1
//
//  Created by 山岡巧 on 2020/08/01.
//  Copyright © 2020 takumi.yamaoka. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var toolBar: UIToolbar!
    
    var webView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 実体になっているか
        
        // 大きさ
        webView.frame = CGRect(x: 0, y:toolBar.frame.size.height , width: view.frame.size.width, height: view.frame.size.height - toolBar.frame.size.height*2)
        view.addSubview(webView)
        
        /*
         
         label.text = String(count)
         
         */
        
        // なにをロードするのか
        webView.navigationDelegate = self
        let url = URL(string: "https://www.yahoo.co.jp/")
        let request = URLRequest(url: url!)
        webView.load(request)
                
        // Do any additional setup after loading the view.
    }
    
    // ロードが開始された時
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
        print("読み込み開始")
        indicator.startAnimating()
    }
    
    // ロードが完了した時
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        print("ロード完了")
        indicator.stopAnimating()
    }

    @IBAction func go(_ sender: Any) {
        webView.goForward()
    }
    
    @IBAction func back(_ sender: Any) {
        webView.goBack()
    }
    
}


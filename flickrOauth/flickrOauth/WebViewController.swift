////
////  WebViewController.swift
////  flickrOauth
////
////  Created by s on 2/10/20.
////  Copyright © 2020 s. All rights reserved.
////
//
//import Foundation
//import OAuthSwift
//import WebKit
//
//class WebViewController: OAuthWebViewController {
//    var targetURL: URL?
//    var webView = WKWebView()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.webView.frame = self.view.bounds
//        self.webView.navigationDelegate = self
//        self.webView.translatesAutoresizingMaskIntoConstraints = false
//        self.view.addSubview(self.webView)
//        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|-0-[view]-0-|", options: [], metrics: nil, views: ["view":self.webView]))
//        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[view]-0-|", options: [], metrics: nil, views: ["view":self.webView]))
//        loadAddressURL()
//    }
//
//    func loadAddressURL() {
//        guard let url = targetURL else {
//            return
//        }
//        let req = URLRequest(url: url)
//        DispatchQueue.main.async {
//            self.webView.load(req)
//        }
//    }
//
//
//    override func handle(_ url: URL) {
//         targetURL = url
//         super.handle(url)
//         self.loadAddressURL()
//     }
//
//
//}
//
//extension WebViewController: WKNavigationDelegate {
//
//    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
//
//        // here we handle internally the callback url and call method that call handleOpenURL (not app scheme used)
//        if let url = navigationAction.request.url , url.scheme == "oauth-swift" {
//            AppDelegate.sharedInstance.applicationHandle(url: url)
////            decisionHandler(.cancel)
//
//            self.dismissWebViewController()
//            return
//        }
//
//        decisionHandler(.allow)
//    }
//
//    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
//        print("\(error)")
//        self.dismissWebViewController()
//        // maybe cancel request...
//    }
//    /* override func webView(webView: WebView!, decidePolicyForNavigationAction actionInformation: [NSObject : AnyObject]!, request: URLRequest!, frame: WebFrame!, decisionListener listener: WebPolicyDecisionListener!) {
//
//     if request.URL?.scheme == "oauth-swift" {
//     self.dismissWebViewController()
//     }
//
//     } */
//}

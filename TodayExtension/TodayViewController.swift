//
//  TodayViewController.swift
//  TodayExtension
//
//  Created by Břetislav Štěpán on 22.04.17.
//  Copyright © 2017 Břetislav Štěpán. All rights reserved.
//

import Cocoa
import NotificationCenter
import WebKit

class TodayViewController: NSViewController, NCWidgetProviding {

    let windyUrl = "https://embed.windy.com/embed2.html?lat=49.894&lon=17.133&zoom=4&level=surface&overlay=rain&menu=&message=&marker=&forecast=12&calendar=now&location=ip&type=map&actualGrid=&metricWind=km%2Fh&metricTemp=%C2%B0C"
    
    @IBOutlet weak var webView: WKWebView!

    override var nibName: String? {
        return "TodayViewController"
    }

    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Update your data and prepare for a snapshot. Call completion handler when you are done
        // with NoData if nothing has changed or NewData if there is new data since the last
        // time we called you
        guard let url = URL.init(string: windyUrl) else {
            completionHandler(.failed)
            return
        }
        
        let request = URLRequest.init(url: url);
        webView.load(request)
        
        completionHandler(.newData)
    }

}

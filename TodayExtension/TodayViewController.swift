//
//  TodayViewController.swift
//  TodayExtension
//
//  Copyright © 2017 Břetislav Štěpán. All rights reserved.
//

import Cocoa
import NotificationCenter
import WebKit
import CoreLocation

class TodayViewController: NSViewController, NCWidgetProviding {

    var locationManager: CLLocationManager!

    @IBOutlet weak var webView: WKWebView!

    //override var nibName: String? {
    //    return "TodayViewController"
    //}

    override func viewDidLoad() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
    }

    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        locationManager.startUpdatingLocation()
        completionHandler(.newData)
    }

}

extension TodayViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()

        if let location = locations.last, let windyUrl = windyUrl(coordinate: location.coordinate) {
            let request = URLRequest(url: windyUrl)
            webView.load(request)
        }
    }

    fileprivate func windyUrl(coordinate: CLLocationCoordinate2D) -> URL? {
        let url = "https://embed.windy.com/embed2.html?lat=\(coordinate.latitude)&lon=\(coordinate.longitude)&zoom=7&level=surface&overlay=rain&menu=&message=&marker=&forecast=12&calendar=now&location=ip&type=map&actualGrid=&metricWind=km%2Fh&metricTemp=%C2%B0C"
        return URL(string: url)
    }

}

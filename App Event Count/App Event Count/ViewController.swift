//
//  ViewController.swift
//  App Event Count
//
//  Created by Colin Erickson on 10/31/23.
//

import UIKit

class ViewController: UIViewController {

    
    var willConnectCount = 0
    var didBecomeCount = 0
    var willResignCount = 0
    var willEnterCount = 0
    var didEnterCount = 0
    var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    @IBOutlet var didFinishLaunching: UILabel!
    
    @IBOutlet var configurationForConnecting: UILabel!
    
    @IBOutlet var didEnterBackground: UILabel!
    @IBOutlet var willEnterForeGround: UILabel!
    @IBOutlet var willResignActive: UILabel!
    @IBOutlet var didBecomeActive: UILabel!
    @IBOutlet var willConnectTo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func updateView(){
        didFinishLaunching.text = "The App has launched \(appDelegate.launchCount) time(s)"
        configurationForConnecting.text = "Configuration for connecting called \(appDelegate.configurationForConnectingCount) time(s)"
        didEnterBackground.text = " The App entered background \(didEnterCount) time(s)"
        willEnterForeGround.text = "The app has entered foreground \(willEnterCount) time(s)"
        willResignActive.text = "The app resigned active\(willResignCount) time(s)"
        didBecomeActive.text = " The app has become active \(didBecomeCount) time(s)"
        willConnectTo.text = " The app will connect \(willConnectCount) time(s)"
        
    }
}


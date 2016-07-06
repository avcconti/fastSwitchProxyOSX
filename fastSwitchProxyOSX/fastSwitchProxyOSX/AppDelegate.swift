//
//  AppDelegate.swift
//  fastSwitchProxyOSX
//
//  Created by Andrés Velasco on 27/05/16.
//  Copyright © 2016 Andrés Velasco. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-2);
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        if let button = statusItem.button {
            button.image = NSImage(named: "mainIcon")
            //button.action = #selector(AppDelegate.printQuote(_:))
        }
        let menu = NSMenu()
        
        menu.addItem(NSMenuItem(title: "Enable proxy", action:Selector("enableProxy:"), keyEquivalent: "e"))
        menu.addItem(NSMenuItem.separatorItem())
        menu.addItem(NSMenuItem(title: "Disable Proxy", action:Selector("disableProxy:"), keyEquivalent: "d"))
        menu.addItem(NSMenuItem.separatorItem())
        menu.addItem(NSMenuItem(title: "Quit app", action:Selector("terminate:"), keyEquivalent: "q"))
        
        statusItem.menu = menu
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    func enableProxy(sender: AnyObject){
        print("enabled")
        print(CFNetworkCopySystemProxySettings());
        print(kCFNetworkProxiesHTTPEnable);
        print(kCFNetworkProxiesHTTPPort);
        print(kCFNetworkProxiesHTTPProxy);
        kCFNetworkProxiesHTTPEnable=1;
        print(CFNetworkCopySystemProxySettings());
        
    }
    func disableProxy(sender: AnyObject){
        print("disabled")
    }

}


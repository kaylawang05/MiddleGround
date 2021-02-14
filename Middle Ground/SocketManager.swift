//
//  DataManager.swift
//  Middle Ground
//
//  Created by alden lamp on 2/14/21.
//

import Foundation
import CocoaAsyncSocket


protocol SocketManagerDelegate: class {
    func socketManagerDidUpdate(with image: UIImage?)
}

class SocketManager: NSObject, GCDAsyncUdpSocketDelegate{
    
    static var shared: SocketManager?
    
    private var addr = "72.79.55.174"
    private var port: UInt16 = 61990
    private var socket: GCDAsyncUdpSocket!
    private var concurrentQueue: DispatchQueue!
    private var error : NSError?
    
    var delegate: SocketManagerDelegate?
    
    init(userID: Int = -1) {
        super.init()
        
        
        guard userID != -1 else {
            return
        }
        
        concurrentQueue = DispatchQueue(label: "dataProcessing", attributes: .concurrent)
        socket = GCDAsyncUdpSocket(delegate: self, delegateQueue: concurrentQueue)
        
        do {
            try socket.bind(toPort: port + UInt16(userID))
            try socket.beginReceiving()
            try socket.enableBroadcast(true)
        } catch {

            // Handle any errors here
            print(error)
        }
        
        send("Add   \(userID)")
    }
    

    func udpSocket(_ sock: GCDAsyncUdpSocket, didReceive data: Data, fromAddress address: Data, withFilterContext filterContext: Any?) {
        print("Got Data")
        DispatchQueue.main.sync {
            delegate?.socketManagerDidUpdate(with: UIImage(data: data))
        }
        
    }
    
    func send(_ text: String) {
        socket.send(text.data(using: .utf8)!, toHost: addr, port: UInt16(port), withTimeout: 1000, tag: 0)
    }
    
    func send(_ data: Data) {
        socket.send(data, toHost: addr, port: UInt16(port), withTimeout: 1000, tag: 0)
    }
    
}


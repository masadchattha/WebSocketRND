//
//  ViewController.swift
//  WebSocketRND
//
//  Created by o9tech on 04/07/2024.
//

import UIKit

class ViewController: UIViewController {

    let webSocketClient = WebSocketClient(url: URL(string: "wss://echo.websocket.org")!)

    override func viewDidLoad() {
        super.viewDidLoad()
        webSocketClient.connect()
    }

    @IBAction func sendMessage(_ sender: UIButton) {
        webSocketClient.sendMessage("Hello, WebSocket!")
    }
}


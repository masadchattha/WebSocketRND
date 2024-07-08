//
//  ViewController.swift
//  WebSocketRND
//
//  Created by o9tech on 04/07/2024.
//

import UIKit

class ViewController: UIViewController {

    let webSocketClient = WebSocketClient(url: URL(string: "ws://localhost:8080")!)
    var messages: [(String, Bool)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        webSocketClient.connect()
    }

    @IBAction func sendMessage(_ sender: UIButton) {
        webSocketClient.sendMessage("Hello, I'm iOS app!")
    }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return messages.count
        return messages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

//
//  ViewController.swift
//  WebSocketRND
//
//  Created by o9tech on 04/07/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!

    let webSocketClient = WebSocketClient(url: URL(string: "ws://localhost:8080")!)
    var messages: [(String, Bool)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        webSocketClient.delegate = self
        webSocketClient.connect()
    }

    @IBAction func sendMessage(_ sender: UIButton) {
        guard let message = messageTextField.text, !message.isEmpty else { return }
        webSocketClient.sendMessage(message)
        messages.append((message, true))
        messageTextField.text = ""
        tableView.reloadData()
        let indexPath = IndexPath(row: messages.count - 1, section: 0)
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
}

// MARK: - WebSocketClientDelegate

extension ViewController: WebSocketClientDelegate {

    func didReceiveMessage(_ message: String, isSender: Bool) {
        DispatchQueue.main.async {
            self.messages.append((message, isSender))
            self.tableView.reloadData()
            let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
            self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cell = UITableViewCell()
        let message = messages[indexPath.row]
        cell.textLabel?.text = message.0
        cell.textLabel?.textAlignment = message.1 ? .right : .left
        return cell
    }
}

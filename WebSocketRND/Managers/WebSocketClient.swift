//
//  WebSocketClient.swift
//  WebSocketRND
//
//  Created by o9tech on 05/07/2024.
//

import Foundation

// MARK: - WebSocketClientDelegate

protocol WebSocketClientDelegate: AnyObject {
    func didReceiveMessage(_ message: String, isSender: Bool)
}

// MARK: - WebSocketClient

class WebSocketClient {
    private var webSocketTask: URLSessionWebSocketTask?
    weak var delegate: WebSocketClientDelegate?
 
    init(url: URL) {
        let urlSession = URLSession(configuration: .default)
        webSocketTask = urlSession.webSocketTask(with: url)
    }

    func connect() {
        webSocketTask?.resume()
        receiveMessage()
    }

    func sendMessage(_ message: String) {
        let message = URLSessionWebSocketTask.Message.string(message)
        webSocketTask?.send(message) { error in
            if let error = error {
                print("Error sending message: \(error)")
            }
        }
    }

    private func receiveMessage() {
        webSocketTask?.receive { [weak self] result in
            switch result {
            case .success(let message):
                switch message {
                case .string(let text):
                    print("Received string: \(text)")
                    self?.delegate?.didReceiveMessage(text, isSender: false)
                case .data(let data):
                    let text = String(data: data, encoding: .utf8) ?? "Unable to decode message..."
                    self?.delegate?.didReceiveMessage(text, isSender: false)
                    print("Received data: \(text)")
                    
                @unknown default:
                    fatalError()
                }
                self?.receiveMessage() // Keep receiving messages
            case .failure(let error):
                print("Error receiving message: \(error)")
            }
        }
    }

    func disconnect() {
        webSocketTask?.cancel(with: .goingAway, reason: nil)
    }
}

//
//  WebSocketClient.swift
//  WebSocketRND
//
//  Created by o9tech on 05/07/2024.
//

import Foundation

class WebSocketClient {
    private var webSocketTask: URLSessionWebSocketTask?

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
                case .data(let data):
                    print("Received data: \(data)")
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

    @discardableResult func returningFunc() -> Int  {
        print("Number: 1")
        print(1, 2, 3, 3)
        return 1
    }

    func callingMethod() {
        returningFunc()
    }
}

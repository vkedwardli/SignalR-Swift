//
//  ProtoBufHubProxyProtocol.swift
//  SignalR-Swift
//
//  
//  Copyright © 2017 Jordan Camara. All rights reserved.
//

import Foundation

protocol ProtoBufHubProxyProtocol {
    func on(eventName: String?, handler: @escaping ((_ args: [String: Any]) -> ())) -> ProtoBufSubscription?
}

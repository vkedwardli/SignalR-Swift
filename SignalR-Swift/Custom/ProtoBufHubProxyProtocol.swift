//
//  ProtoBufHubProxyProtocol.swift
//  SignalR-Swift
//
//  
//  Copyright © 2017 Jordan Camara. All rights reserved.
//

import Foundation

public typealias ProtoBufSubscription = ([String: Any]) -> ()

protocol ProtoBufHubProxyProtocol {
    func on(eventName: String, handler: @escaping ProtoBufSubscription) -> ProtoBufSubscription?
    
    func invoke(method: String, withArgs args: [String: Any])

    func invoke(method: String, withArgs args: [String: Any], completionHandler: ((_ response: Any?, _ error: Error?) -> ())?)
}

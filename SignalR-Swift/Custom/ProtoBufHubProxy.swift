//
//  ProtoBufHubProxy.swift
//  SignalR-Swift
//
//  
//  Copyright © 2017 Jordan Camara. All rights reserved.
//

import Foundation

public class ProtoBufHubProxy: ProtoBufHubProxyProtocol {
    
    public var state = [String: Any]()

    private weak var connection: HubConnectionProtocol?
    private var hubName: String?
    private var subscriptions = [String: ProtoBufSubscription]()

    // MARK: - Init

    public init(connection: HubConnectionProtocol, hubName: String) {
        print("🐣 \(String(describing: type(of:self)))")
        self.connection = connection
        self.hubName = hubName
    }

    // MARK: - Subscribe
    
    public func on(eventName: String, handler: @escaping ProtoBufSubscription) -> ProtoBufSubscription? {
        guard !eventName.isEmpty else {
            NSException.raise(.invalidArgumentException, format: NSLocalizedString("Argument eventName is null", comment: "null event name exception"), arguments: getVaList(["nil"]))
            return nil
        }
        
        return self.subscriptions[eventName] ?? self.subscriptions.updateValue(handler, forKey: eventName) ?? handler
    }
    
    public func invokeEvent(eventName: String, withArgs args: [String: Any]) {
        if let subscription = self.subscriptions[eventName] {
            subscription(args)
        }
    }
    
    // MARK: - Publish
    
    public func invoke(method: String, withArgs args: [String : Any]) {}
    
    public func invoke(method: String, withArgs args: [String : Any], completionHandler: ((Any?, Error?) -> ())?) {}
    
    deinit {
        print("💀 \(String(describing: type(of:self)))")
    }
}

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

    private var connection: HubConnectionProtocol!
    private var hubName: String?
    private var subscriptions = [String: ProtoBufSubscription]()

    // MARK: - Init

    public init(connection: HubConnectionProtocol, hubName: String) {
        self.connection = connection
        self.hubName = hubName
    }

    // MARK: - Subscribe

    public func on(eventName: String?, handler: @escaping ((_ args: [String: Any]) -> ())) -> ProtoBufSubscription? {
        guard eventName != nil && !eventName!.isEmpty else {
            NSException.raise(.invalidArgumentException, format: NSLocalizedString("Argument eventName is null", comment: "null event name exception"), arguments: getVaList(["nil"]))
            return nil
        }

        var subscription = self.subscriptions[eventName!]
        if subscription == nil {
            subscription = ProtoBufSubscription()
            subscription?.handler = handler
            self.subscriptions[eventName!] = subscription
        }

        return subscription!
    }

    public func invokeEvent(eventName: String, withArgs args: [String: Any]) {
        if let subscription = self.subscriptions[eventName], let handler = subscription.handler {
            handler(args)
        }
    }
}

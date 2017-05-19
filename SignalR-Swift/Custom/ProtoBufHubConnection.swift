//
//  HubConnection.swift
//  SignalR-Swift
//
//  
//  Copyright © 2017 Jordan Camara. All rights reserved.
//

import Foundation
import SwiftyJSON

public class ProtoBufHubConnection: Connection, HubConnectionProtocol {

    private var hubs = [String: ProtoBufHubProxy]()
    private var callbacks = [String: HubConnectionHubResultClosure]()
    private var callbackId = 0

    override public convenience init(withUrl url: String) {
        self.init(withUrl: url, useDefault: true)
    }

    public init(withUrl url: String, useDefault: Bool) {
        super.init(withUrl: HubConnection.getUrl(url: url, useDefault: useDefault))
    }

    override public convenience init(withUrl url: String, queryString: [String: String]?) {
        self.init(withUrl: url, queryString: queryString, useDefault: true)
    }

    public init(withUrl url: String, queryString: [String: String]?, useDefault: Bool) {
        super.init(withUrl: HubConnection.getUrl(url: url, useDefault: useDefault), queryString: queryString)
    }

    public func createHubProxy(hubName: String) -> ProtoBufHubProxy? {
        if self.state != .disconnected {
            NSException.raise(.internalInconsistencyException, format: NSLocalizedString("Proxies cannot be added after the connection has been started.", comment: "proxy added after connection starts exception"), arguments: getVaList(["nil"]))
        }

        var proxy: ProtoBufHubProxy? = nil

        if self.hubs[hubName.lowercased()] == nil {
            proxy = ProtoBufHubProxy(connection: self, hubName: hubName.lowercased())
            self.hubs[hubName.lowercased()] = proxy
        }

        return proxy
    }

    public func registerCallback(callback: @escaping HubConnectionHubResultClosure) -> String {
        let newId = String(self.callbackId)
        self.callbacks[newId] = callback
        self.callbackId += 1

        return newId
    }

    public func removeCallback(callbackId: String) {
        self.callbacks.removeValue(forKey: callbackId)
    }

    func clearInvocationCallbacks(error: String?) {
        let result = HubResult()
        result.error = error

        for callback in self.callbacks.values {
            callback(result)
        }

        self.callbacks.removeAll()
    }

    // MARK: - Private

    static func getUrl(url: String, useDefault: Bool) -> String {
        var urlResult = url
        urlResult = url.hasSuffix("/") ? url : url.appending("/")

        if useDefault {
            return urlResult.appending("signalr")
        }

        return urlResult
    }

    // MARK - Sending Data

    override public func onSending() -> String {
        var data = [HubRegistrationData]()
        for key in self.hubs.keys {
            let registration = HubRegistrationData()
            registration.name = key
            data.append(registration)
        }

        return data.toJSONString()!
    }

    // MARK: - Received Data

    override public func didReceiveData(data: Any) {
        if let base64String = data as? String {
            if let encodedData = Data(base64Encoded: base64String),
                let message = try? SignalRMessage.parseFrom(data: encodedData),
                let method = message.m,
                let argsString = message.d,
                let argsDict = JSON(parseJSON: argsString).dictionaryObject {
                for hub in self.hubs {
                    hub.value.invokeEvent(eventName: method, withArgs: argsDict)
                }
                super.didReceiveData(data: data)
            }
        }
    }

    override public func willReconnect() {
        self.clearInvocationCallbacks(error: "Connection started reconnecting before invocation result was received.")
        super.willReconnect()
    }

    override func didClose() {
        self.clearInvocationCallbacks(error: "Connection was disconnected before invocation result was received.")
        super.didClose()
    }
}

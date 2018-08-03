/// Generated by the Protocol Buffers 3.6.0 compiler.  DO NOT EDIT!
/// Protobuf-swift version: 4.0.0
/// Source file "SignalRMessage.proto"
/// Syntax "Proto2"

import Foundation
import ProtocolBuffers


public struct SignalRMessageRoot {
    public static let `default` = SignalRMessageRoot()
    public var extensionRegistry:ExtensionRegistry
    
    init() {
        extensionRegistry = ExtensionRegistry()
        registerAllExtensions(registry: extensionRegistry)
    }
    public func registerAllExtensions(registry: ExtensionRegistry) {
    }
}

final public class SignalRMessage : GeneratedMessage {
    public typealias BuilderType = SignalRMessage.Builder
    
    public static func == (lhs: SignalRMessage, rhs: SignalRMessage) -> Bool {
        if lhs === rhs {
            return true
        }
        var fieldCheck:Bool = (lhs.hashValue == rhs.hashValue)
        fieldCheck = fieldCheck && (lhs.hasM == rhs.hasM) && (!lhs.hasM || lhs.m == rhs.m)
        fieldCheck = fieldCheck && (lhs.hasD == rhs.hasD) && (!lhs.hasD || lhs.d == rhs.d)
        fieldCheck = (fieldCheck && (lhs.unknownFields == rhs.unknownFields))
        return fieldCheck
    }
    
    public fileprivate(set) var m:String! = nil
    public fileprivate(set) var hasM:Bool = false
    
    public fileprivate(set) var d:String! = nil
    public fileprivate(set) var hasD:Bool = false
    
    required public init() {
        super.init()
    }
    override public func isInitialized() throws {
        if !hasM {
            throw ProtocolBuffersError.invalidProtocolBuffer("Uninitialized Message \(SignalRMessage.self): field \"m\" mark required")
        }
        if !hasD {
            throw ProtocolBuffersError.invalidProtocolBuffer("Uninitialized Message \(SignalRMessage.self): field \"d\" mark required")
        }
    }
    override public func writeTo(codedOutputStream: CodedOutputStream) throws {
        if hasM {
            try codedOutputStream.writeString(fieldNumber: 1, value:m)
        }
        if hasD {
            try codedOutputStream.writeString(fieldNumber: 2, value:d)
        }
        try unknownFields.writeTo(codedOutputStream: codedOutputStream)
    }
    override public func serializedSize() -> Int32 {
        var serialize_size:Int32 = memoizedSerializedSize
        if serialize_size != -1 {
            return serialize_size
        }
        
        serialize_size = 0
        if hasM {
            serialize_size += m.computeStringSize(fieldNumber: 1)
        }
        if hasD {
            serialize_size += d.computeStringSize(fieldNumber: 2)
        }
        serialize_size += unknownFields.serializedSize()
        memoizedSerializedSize = serialize_size
        return serialize_size
    }
    public class func getBuilder() -> SignalRMessage.Builder {
        return SignalRMessage.classBuilder() as! SignalRMessage.Builder
    }
    public func getBuilder() -> SignalRMessage.Builder {
        return classBuilder() as! SignalRMessage.Builder
    }
    override public class func classBuilder() -> ProtocolBuffersMessageBuilder {
        return SignalRMessage.Builder()
    }
    override public func classBuilder() -> ProtocolBuffersMessageBuilder {
        return SignalRMessage.Builder()
    }
    public func toBuilder() throws -> SignalRMessage.Builder {
        return try SignalRMessage.builderWithPrototype(prototype:self)
    }
    public class func builderWithPrototype(prototype:SignalRMessage) throws -> SignalRMessage.Builder {
        return try SignalRMessage.Builder().mergeFrom(other:prototype)
    }
    override public func encode() throws -> Dictionary<String,Any> {
        try isInitialized()
        var jsonMap:Dictionary<String,Any> = Dictionary<String,Any>()
        if hasM {
            jsonMap["m"] = m
        }
        if hasD {
            jsonMap["d"] = d
        }
        return jsonMap
    }
    override class public func decode(jsonMap:Dictionary<String,Any>) throws -> SignalRMessage {
        return try SignalRMessage.Builder.decodeToBuilder(jsonMap:jsonMap).build()
    }
    override class public func fromJSON(data:Data, options: JSONSerialization.ReadingOptions = []) throws -> SignalRMessage {
        return try SignalRMessage.Builder.fromJSONToBuilder(data:data, options:options).build()
    }
    override public func getDescription(indent:String) throws -> String {
        var output = ""
        if hasM {
            output += "\(indent) m: \(m) \n"
        }
        if hasD {
            output += "\(indent) d: \(d) \n"
        }
        output += unknownFields.getDescription(indent: indent)
        return output
    }
    override public var hashValue:Int {
        get {
            var hashCode:Int = 7
            if hasM {
                hashCode = (hashCode &* 31) &+ m.hashValue
            }
            if hasD {
                hashCode = (hashCode &* 31) &+ d.hashValue
            }
            hashCode = (hashCode &* 31) &+  unknownFields.hashValue
            return hashCode
        }
    }
    
    
    //Meta information declaration start
    
    override public class func className() -> String {
        return "SignalRmessage"
    }
    override public func className() -> String {
        return "SignalRmessage"
    }
    //Meta information declaration end
    
    final public class Builder : GeneratedMessageBuilder {
        fileprivate var builderResult:SignalRMessage = SignalRMessage()
        public func getMessage() -> SignalRMessage {
            return builderResult
        }
        
        required override public init () {
            super.init()
        }
        public var m:String {
            get {
                return builderResult.m
            }
            set (value) {
                builderResult.hasM = true
                builderResult.m = value
            }
        }
        public var hasM:Bool {
            get {
                return builderResult.hasM
            }
        }
        @discardableResult
        public func setM(_ value:String) -> SignalRMessage.Builder {
            self.m = value
            return self
        }
        @discardableResult
        public func clearM() -> SignalRMessage.Builder{
            builderResult.hasM = false
            builderResult.m = nil
            return self
        }
        public var d:String {
            get {
                return builderResult.d
            }
            set (value) {
                builderResult.hasD = true
                builderResult.d = value
            }
        }
        public var hasD:Bool {
            get {
                return builderResult.hasD
            }
        }
        @discardableResult
        public func setD(_ value:String) -> SignalRMessage.Builder {
            self.d = value
            return self
        }
        @discardableResult
        public func clearD() -> SignalRMessage.Builder{
            builderResult.hasD = false
            builderResult.d = nil
            return self
        }
        override public var internalGetResult:GeneratedMessage {
            get {
                return builderResult
            }
        }
        @discardableResult
        override public func clear() -> SignalRMessage.Builder {
            builderResult = SignalRMessage()
            return self
        }
        override public func clone() throws -> SignalRMessage.Builder {
            return try SignalRMessage.builderWithPrototype(prototype:builderResult)
        }
        override public func build() throws -> SignalRMessage {
            try checkInitialized()
            return buildPartial()
        }
        public func buildPartial() -> SignalRMessage {
            let returnMe:SignalRMessage = builderResult
            return returnMe
        }
        @discardableResult
        public func mergeFrom(other:SignalRMessage) throws -> SignalRMessage.Builder {
            if other == SignalRMessage() {
                return self
            }
            if other.hasM {
                m = other.m
            }
            if other.hasD {
                d = other.d
            }
            try merge(unknownField: other.unknownFields)
            return self
        }
        @discardableResult
        override public func mergeFrom(codedInputStream: CodedInputStream) throws -> SignalRMessage.Builder {
            return try mergeFrom(codedInputStream: codedInputStream, extensionRegistry:ExtensionRegistry())
        }
        @discardableResult
        override public func mergeFrom(codedInputStream: CodedInputStream, extensionRegistry:ExtensionRegistry) throws -> SignalRMessage.Builder {
            let unknownFieldsBuilder:UnknownFieldSet.Builder = try UnknownFieldSet.builderWithUnknownFields(copyFrom:self.unknownFields)
            while (true) {
                let protobufTag = try codedInputStream.readTag()
                switch protobufTag {
                case 0:
                    self.unknownFields = try unknownFieldsBuilder.build()
                    return self
                    
                case 10:
                    m = try codedInputStream.readString()
                    
                case 18:
                    d = try codedInputStream.readString()
                    
                default:
                    if (!(try parse(codedInputStream:codedInputStream, unknownFields:unknownFieldsBuilder, extensionRegistry:extensionRegistry, tag:protobufTag))) {
                        unknownFields = try unknownFieldsBuilder.build()
                        return self
                    }
                }
            }
        }
        class override public func decodeToBuilder(jsonMap:Dictionary<String,Any>) throws -> SignalRMessage.Builder {
            let resultDecodedBuilder = SignalRMessage.Builder()
            if let jsonValueM = jsonMap["m"] as? String {
                resultDecodedBuilder.m = jsonValueM
            }
            if let jsonValueD = jsonMap["d"] as? String {
                resultDecodedBuilder.d = jsonValueD
            }
            return resultDecodedBuilder
        }
        override class public func fromJSONToBuilder(data:Data, options: JSONSerialization.ReadingOptions = []) throws -> SignalRMessage.Builder {
            let jsonData = try JSONSerialization.jsonObject(with:data, options: options)
            guard let jsDataCast = jsonData as? Dictionary<String,Any> else {
                throw ProtocolBuffersError.invalidProtocolBuffer("Invalid JSON data")
            }
            return try SignalRMessage.Builder.decodeToBuilder(jsonMap:jsDataCast)
        }
    }
    
}

extension SignalRMessage: GeneratedMessageProtocol {
    public class func parseArrayDelimitedFrom(inputStream: InputStream) throws -> Array<SignalRMessage> {
        var mergedArray = Array<SignalRMessage>()
        while let value = try parseDelimitedFrom(inputStream: inputStream) {
            mergedArray.append(value)
        }
        return mergedArray
    }
    public class func parseDelimitedFrom(inputStream: InputStream) throws -> SignalRMessage? {
        return try SignalRMessage.Builder().mergeDelimitedFrom(inputStream: inputStream)?.build()
    }
    public class func parseFrom(data: Data) throws -> SignalRMessage {
        return try SignalRMessage.Builder().mergeFrom(data: data, extensionRegistry:SignalRMessageRoot.default.extensionRegistry).build()
    }
    public class func parseFrom(data: Data, extensionRegistry:ExtensionRegistry) throws -> SignalRMessage {
        return try SignalRMessage.Builder().mergeFrom(data: data, extensionRegistry:extensionRegistry).build()
    }
    public class func parseFrom(inputStream: InputStream) throws -> SignalRMessage {
        return try SignalRMessage.Builder().mergeFrom(inputStream: inputStream).build()
    }
    public class func parseFrom(inputStream: InputStream, extensionRegistry:ExtensionRegistry) throws -> SignalRMessage {
        return try SignalRMessage.Builder().mergeFrom(inputStream: inputStream, extensionRegistry:extensionRegistry).build()
    }
    public class func parseFrom(codedInputStream: CodedInputStream) throws -> SignalRMessage {
        return try SignalRMessage.Builder().mergeFrom(codedInputStream: codedInputStream).build()
    }
    public class func parseFrom(codedInputStream: CodedInputStream, extensionRegistry:ExtensionRegistry) throws -> SignalRMessage {
        return try SignalRMessage.Builder().mergeFrom(codedInputStream: codedInputStream, extensionRegistry:extensionRegistry).build()
    }
    public subscript(key: String) -> Any? {
        switch key {
        case "m": return self.m
        case "d": return self.d
        default: return nil
        }
    }
}
extension SignalRMessage.Builder: GeneratedMessageBuilderProtocol {
    public typealias GeneratedMessageType = SignalRMessage
    public subscript(key: String) -> Any? {
        get {
            switch key {
            case "m": return self.m
            case "d": return self.d
            default: return nil
            }
        }
        set (newSubscriptValue) {
            switch key {
            case "m":
                guard let newSubscriptValue = newSubscriptValue as? String else {
                    return
                }
                self.m = newSubscriptValue
            case "d":
                guard let newSubscriptValue = newSubscriptValue as? String else {
                    return
                }
                self.d = newSubscriptValue
            default: return
            }
        }
    }
}

// @@protoc_insertion_point(global_scope)
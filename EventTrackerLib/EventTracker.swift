//
//  EventTracker.swift
//  SimpleEventTracker
//
//  Created by Srivalli Velusamy on 25/12/23.
//

import Foundation

public class EventTracker {
    
    public init() { }
    
    public func logEvent(eventName: String) {
        sendCustomEvents(eventName: eventName)
    }
    
    public func logEventWithCustomData(eventName: String, eventData: [String : Any]) {
        sendCustomEvents(eventName: eventName, eventData: eventData)
    }
    
    // MARK: LOG EVENTS PRIVATE FUNCTIONS
    private func sendCustomEvents(eventName: String, eventData: [String : Any]? = nil) {
        /// Get the current device and app  details.
        /// Form the tracker response from the event name and data.
        /// Convert the tracker response to JSON string and print that response.
        let timestamp = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .short)
        let trackerResponse = TrackerResponse(eventName: eventName,
                                              customData: eventData,
                                              trackerTime: timestamp,
                                              deviceDetails: getDeviceInformationEvents())
        
        var trackerData : [String:Any] {
            let mirror = Mirror(reflecting: trackerResponse)
            let dict = Dictionary(uniqueKeysWithValues: mirror.children.lazy.map({ (label:String?, value:Any) -> (String, Any)? in
              guard let label = label else { return nil }
              let childMirror = Mirror(reflecting: value)
                 if childMirror.displayStyle == .struct || childMirror.displayStyle == .class {
                     let subDict = Dictionary(uniqueKeysWithValues: childMirror.children.lazy.map({ (subLabel:String?, subValue:Any) -> (String, Any)? in
                        guard let subLabel = subLabel else { return nil }
                        return (subLabel, subValue)
                     }).compactMap { $0 })
                     return (label, subDict)
                 } else {
                    return (label, value)
                }
            }).compactMap { $0 })
           return dict
        }
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: trackerData, options: .prettyPrinted)
            if let jsonStr = String(data: jsonData, encoding: .utf8) {
                print(jsonStr)
            }
        } catch {
            print("Error in converting jsonObject")
        }
    }
    
    private func getDeviceInformationEvents() -> TrackerDeviceDetails {
        /// Form device details struct and return it.
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        let appBuildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
        return TrackerDeviceDetails(udid: udid,
                                    iOSVersion: deviceVersion,
                                    model: deviceModel,
                                    screenWidth: screenWidth,
                                    screenHeight: screenWidth,
                                    appVersion: appVersion,
                                    appBuildNumber: appBuildNumber)
    }
}

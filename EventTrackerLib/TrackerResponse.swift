//
//  TrackerResponse.swift
//  SimpleEventTracker
//
//  Created by Srivalli Velusamy on 22/12/23.
//

import Foundation

struct TrackerResponse {
    var eventName: String
    var customData: [String: Any]?
    var trackerTime: String
    var deviceDetails: TrackerDeviceDetails
}

struct TrackerDeviceDetails {
    var udid: String
    var iOSVersion: String
    var model: String
    var screenWidth: CGFloat
    var screenHeight: CGFloat
    var appVersion: String
    var appBuildNumber: String
}

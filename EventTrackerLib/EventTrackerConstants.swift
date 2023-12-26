//
//  EventTrackerConstants.swift
//  
//
//  Created by Srivalli Velusamy on 26/12/23.
//

#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit

let deviceModel = UIDevice.current.model
let deviceVersion = UIDevice.current.systemVersion
let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height
let udid = UIDevice.current.identifierForVendor?.uuidString ?? ""

#else
let deviceModel = ""
let deviceVersion = ""
let screenWidth = 0.0
let screenHeight = 0.0
let udid = ""

#endif

Pod::Spec.new do |spec|
  spec.name         = "EventTrackerLib"
  spec.version      = "1.0"
  spec.summary      = "A CocoaPods library written in Swift"
  spec.description  = <<-DESC
This CocoaPods library helps you to track some simple events.
                   DESC

  spec.homepage     = "https://github.com/SrivalliiOS4/EventTrackerLib"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Srivalli" => "testdevios123@gmail.com" }
  spec.ios.deployment_target = "12.1"
  spec.swift_version = "5.0"
  spec.source       = { :git => "https://github.com/SrivalliiOS4/EventTrackerLib.git", :tag => "#{spec.version}" }
  spec.source_files  = "EventTrackerLib/**/*.{h,m,swift}"
end
# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

def lib
  pod 'NBIoTBleKit', :path => './'
#  pod 'NBIoTBleKit'
end

target 'NBIoTBleKitDemo' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for NBIoTBleKitDemo
  lib
  pod 'IQKeyboardManager'

  target 'NBIoTBleKitDemoTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'NBIoTBleKitDemoUITests' do
    # Pods for testing
  end

end

target 'NBIoTBleKitDemoSwift' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  lib
  # Pods for NBIoTBleKitDemoSwift
  pod 'IQKeyboardManagerSwift'

  target 'NBIoTBleKitDemoSwiftTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'NBIoTBleKitDemoSwiftUITests' do
    # Pods for testing
  end

end

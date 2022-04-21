# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'
install! 'cocoapods', :deterministic_uuids => false

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

require_relative 'node_modules/react-native/scripts/react_native_pods'
require_relative 'node_modules/@react-native-community/cli-platform-ios/native_modules'

target 'NBIoTKitReactNativeDemo' do
  # config = use_native_modules!

  # Flags change depending on the env values.
  flags = get_default_flags()

  use_react_native!(yat
    :path => "node_modules/react-native",
    # to enable hermes on iOS, change `false` to `true` and then install pods
    # :hermes_enabled => flags[:hermes_enabled],
    # :fabric_enabled => flags[:fabric_enabled],
    # # An absolute path to your application root.
    # :app_path => "#{Pod::Config.instance.installation_root}/.."
  )

  lib

  # Enables Flipper.
  #
  # Note that if you have use_frameworks! enabled, Flipper will not work and
  # you should disable the next line.
#  use_flipper!()
pod 'RNScreens', :path => 'node_modules/react-native-screens/'
# pod 'RNGestureHandler', :path => 'node_modules/react-native-gesture-handler/'
pod 'react-native-safe-area-context', :path => 'node_modules/react-native-safe-area-context/'

end

 post_install do |installer|
     react_native_post_install(installer)
     __apply_Xcode_12_5_M1_post_install_workaround(installer)
     installer.pods_project.targets.each do |target|
         target.build_configurations.each do |config|
             # Needed for building for simulator on M1 Macs
             config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
         end
     end
 end

source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '12.0'
install! 'cocoapods',:disable_input_output_paths => true

target 'TFY_RouterMessage' do
  use_frameworks!
  inhibit_all_warnings!
  
  pod 'ReactiveObjC'
  pod 'TFY_LayoutCategoryKit'
  pod 'TFY_AutoLayout'
  pod 'TFY_Navigation'
  pod 'TFY_ProgressHUD'
  pod 'YYModel'
  pod 'TFY_TabBarKit'

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
          config.build_settings['EXCLUDED_ARCHS[sdk=iphonesimulator*]'] = "arm64"
          config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ""
          config.build_settings['CODE_SIGNING_REQUIRED'] = "NO"
          config.build_settings['CODE_SIGNING_ALLOWED'] = "NO"
          config.build_settings['ENABLE_BITCODE'] = "NO"
          config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
        end
    end
end

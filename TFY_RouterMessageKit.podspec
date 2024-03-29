
Pod::Spec.new do |spec|

  spec.name         = "TFY_RouterMessageKit"

  spec.version      = "2.0.6"

  spec.summary      = "组件化路由，消息监听，封装好的工具"

  spec.description  = <<-DESC 
                            组件化路由，消息监听，封装好的工具
                      DESC

  spec.homepage     = "https://github.com/13662049573/TFY_RouterMessage"
 
  spec.license      = "MIT"
  
  spec.author       = { "420144542@qq.com" => "420144542@qq.com" }
  
  spec.platform     = :ios, "12.0"

  spec.source       = { :git => "https://github.com/13662049573/TFY_RouterMessage.git", :tag => spec.version }

  spec.source_files  = "TFY_RouterMessage/TFY_RouterMessageKit/TFY_RouterMessageKit.h"
  
  spec.subspec 'TFY_MessageMKit' do |ss|
    ss.source_files  = "TFY_RouterMessage/TFY_RouterMessageKit/TFY_MessageMKit/**/*.{h,m}"
  end

  spec.subspec 'TFY_RouterMKit' do |ss|
    ss.source_files  = "TFY_RouterMessage/TFY_RouterMessageKit/TFY_RouterMKit/**/*.{h,m}"
  end

  spec.frameworks    = "Foundation","UIKit"

  spec.xcconfig      = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include" }
  
  spec.requires_arc = true


end

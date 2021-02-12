Pod::Spec.new do |s|
  s.name             = 'AppIcons'
  s.version          = '0.6.0'
  s.swift_version    = '5.0'
  s.summary          = 'Provides support for alternate app icons with UI for icon selection'
  s.description      = <<-DESC
Provides support for alternate app icons including UI allowing users to select an app icon dynamically
                       DESC
  s.homepage         = 'https://github.com/rwbutler/AppIcons'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ross Butler' => 'github@rwbutler.com' }
  s.source           = { :git => 'https://github.com/rwbutler/AppIcons.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ross_w_butler'
  s.ios.deployment_target = '8.0'
  s.source_files = 'AppIcons/Classes/**/*'
  s.dependency 'FlexibleRowHeightGridLayout'
end
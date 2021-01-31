# Uncomment the next line to define a global platform for your project
platform :ios, '14.0'

target 'MapWidgetExample' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for MapWidgetExample
  pod 'SwiftFormat/CLI', '~> 0.41'
  pod 'SwiftLint', '~> 0.42'
  pod 'SwiftConfigurationFiles', :git => 'https://github.com/fxm90/SwiftConfigurationFiles.git'

  target 'MapWidgetExampleTests' do
    inherit! :search_paths
    # Pods for testing
  end

  # Fix warning
  # ```
  # The iOS deployment target 'IPHONEOS_DEPLOYMENT_TARGET' is set to 8.0, but the range of
  # supported deployment target versions is 9.0 to 14.0.99.
  # ```
  # Source: https://stackoverflow.com/a/58367269/3532505
  post_install do |pi|
      pi.pods_project.targets.each do |t|
        t.build_configurations.each do |config|
          config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'
        end
      end
  end
end

target 'MapWidgetExtension' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for MapWidgetExtension

end

source 'https://cdn.cocoapods.org/'

platform :ios, '10.0'
inhibit_all_warnings!
use_frameworks!
install! 'cocoapods', generate_multiple_pod_projects: true

workspace 'ShopBack'

project 'ShopBack'

abstract_target 'Base' do
  # Basic
  pod 'IGListKit', '~> 4.0'
  pod 'Nuke', '8.3.1'
  pod 'RxNuke', '0.11.0'
  pod 'SnapKit'
  
  # Networking  
  pod 'Moya', '~> 14.0.0-beta.5'
  pod 'Moya/RxSwift', '~> 14.0.0-beta.5'

  # Recative
  pod 'RxSwift', '~> 5'
  pod 'RxCocoa', '~> 5'
  pod 'RxSwiftExt', '~> 5'

  # Lint
  pod 'SwiftLint'

  target 'ShopBack' do
    target 'ShopBackTests' do
      inherit! :search_paths
    end
  end
end


post_install do |installer|

  installer.pods_project.build_configurations.each do |config|
    if config.name.include?("Debug")
      # Set Apple clang optimization level to "None [-O0]"
      config.build_settings['GCC_OPTIMIZATION_LEVEL'] = '0'
      # Set Swift compiler optimization level to "No Optimization [-Onone]"
      config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Onone'
    end
  end

end

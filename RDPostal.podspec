Pod::Spec.new do |s|
  s.name = 'RDPostal'
  s.version = '0.0.1'
  s.summary = 'A swift framework for working with emails.'
  s.description = 'A Swift framework for working with emails. Simple and quick to use. Built on top of libetpan.'
  s.homepage = 'https://github.com/readdle/Postal'
  s.license = 'MIT'
  s.author = { 'Kevin Lefevre' => 'kevin.lefevre@snips.ai', 'Jeremie Girault' => 'jeremie.girault@gmail.com' }

  s.ios.deployment_target = '10.0'
  s.osx.deployment_target = '10.12'

  s.source = { :git => 'git@github.com:readdle/Postal.git', :tag => 'v' + s.version.to_s }

  s.module_name = 'Postal'
  
  s.source_files  = 'Postal/*.{swift,h}'
  s.preserve_paths = 'dependencies/*'

  s.pod_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) NO_MACROS=1',
    'SWIFT_INCLUDE_PATHS' => '$(inherited) "$SDKROOT/usr/include/libxml2" "$(PODS_TARGET_SRCROOT)/dependencies/build/libetpan"',
    'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_TARGET_SRCROOT)/dependencies/build/libetpan"'
  }

  s.ios.pod_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => '"$(PODS_TARGET_SRCROOT)/dependencies/build/ios/include"'
  }

  s.libraries = 'etpan', 'sasl2', 'z', 'iconv'
  s.ios.vendored_libraries = 'dependencies/build/ios/lib/libetpan.a'
  s.osx.vendored_libraries = 'dependencies/build/macos/lib/libetpan.a'

  s.dependency 'Result', '~> 3.2'

end

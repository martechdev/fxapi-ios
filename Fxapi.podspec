Pod::Spec.new do |s|
  s.name             = 'Fxapi'
  s.version          = '0.1.0'
  s.summary          = 'Swift client for fxapi.com API.'
  s.description      = 'Currency FX rates. See https://fxapi.com/docs/'
  s.homepage         = 'https://fxapi.com'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'EverAPI' => 'support@fxapi.com' }
  s.source           = { :git => 'https://github.com/martechdev/fxapi-ios.git', :tag => s.version.to_s }
  s.swift_version    = '5.9'
  s.ios.deployment_target = '12.0'
  s.macos.deployment_target = '10.15'
  s.source_files     = 'Sources/**/*.{swift}'
  s.frameworks       = 'Foundation'
end

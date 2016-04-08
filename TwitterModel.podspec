Pod::Spec.new do |s|
  s.name = 'TwitterModel'
  s.version = '0.1.2'
  s.summary = 'Twitter API1.1 Models.'
  s.homepage = 'https://github.com/yusuga/TwitterModel'
  s.license = 'MIT'
  s.author = 'Yu Sugawara'
  s.source = { :git => 'https://github.com/yusuga/TwitterModel.git', :tag => s.version.to_s }
  s.platform = :ios, '7.0'
  s.ios.deployment_target = '7.0'
  s.source_files = 'Classes/TwitterModel/*.{h,m}'
  s.requires_arc = true
  s.compiler_flags = '-fmodules'
end
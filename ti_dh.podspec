Pod::Spec.new do |s|
s.name                  = 'ti_dh'
s.version               = '1.0'
s.summary               = 'Diffie Hellman密钥交换算法  '
s.homepage              = 'https://github.com/ti-dh/ti-dh-swift'
s.license               = { :type => 'MIT', :file => 'README.md' }
s.author                = { 'heroims' => 'heroims@163.com' }
s.source                = { :git => 'https://github.com/ti-dh/ti-dh-swift.git', :tag => "#{s.version}" }
s.ios.deployment_target = '8.0'
s.osx.deployment_target = '10.9'
s.tvos.deployment_target = "9.0"
s.watchos.deployment_target = "2.0"

s.requires_arc          = true
s.default_subspec = 'All'
s.subspec 'All' do |ss|
  ss.source_files          = 'dh/*.{swift}'
  ss.dependency 'BigInt'
end
s.subspec 'Lite' do |ss|
  ss.source_files          = 'dh/ti_dh_lite.{swift}'
  ss.dependency 'BigInt'
end
end


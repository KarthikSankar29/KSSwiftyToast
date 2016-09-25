Pod::Spec.new do |s|
  s.name             = 'KSSwiftyToast'
  s.version          = '0.0.1'
  s.summary          = 'KSSwiftyToast gives you a toast UI, similar to that of Android.'
  s.homepage         = 'https://github.com/KarthikSankar29/KSSwiftyToast.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Karthik Sankar' => 'karthiksbootup@gmail.com' }
  s.source           = { :git => 'https://github.com/KarthikSankar29/KSSwiftyToast.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.requires_arc = true
  s.source_files = 'KSSwiftyToast/**/*.{h,m,swift}'
end

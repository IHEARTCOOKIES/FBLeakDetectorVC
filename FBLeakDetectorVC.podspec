#
# Be sure to run `pod lib lint FBLeakDetectorVC.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.name             = 'FBLeakDetectorVC'
  s.version          = '1.0.0'
  s.summary          = 'A basic leak detector for finding lingering view controllers.'
  s.description      = 'FBLeakDetector is a straightforward and effective leak detector used for finding lingering view controllers that appeared to be released out of memory.'

  # ―――  Author/License data  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.homepage         = 'https://github.com/IHEARTCOOKIES/FBLeakDetectorVC'
  s.author           = { 'Filip Busic' => 'filip@appcoders.io' }
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  
  # ―――  Source data  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.public_header_files = 'FBLeakDetectorVC/Classes/Public/**/*.h'
  s.source_files = 'FBLeakDetectorVC/Classes/**/*'
  s.source       = { :git => 'https://github.com/IHEARTCOOKIES/FBLeakDetectorVC.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.module_name = 'FBLeakDetectorVC'
end

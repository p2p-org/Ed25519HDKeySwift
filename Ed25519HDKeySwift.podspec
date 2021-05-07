#
# Be sure to run `pod lib lint Ed25519HDKeySwift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Ed25519HDKeySwift'
  s.version          = '0.1.0'
  s.summary          = 'Key Derivation for ed25519'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Key Derivation for ed25519 written in pure Swift'

  s.homepage         = 'https://github.com/p2p-org/Ed25519HDKeySwift'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Chung Tran' => 'bigearsenal@gmail.com' }
  s.source           = { :git => 'https://github.com/p2p-org/Ed25519HDKeySwift.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'

  s.source_files = 'Ed25519HDKeySwift/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Ed25519HDKeySwift' => ['Ed25519HDKeySwift/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'TweetNacl'
  s.dependency 'IDZSwiftCommonCrypto'
end

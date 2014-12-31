Pod::Spec.new do |s|

  s.name         = "ODMSwipeSelector"
  s.version      = "0.0.1"
  s.summary      = "A value selector with a swipe gesture."
  s.homepage     = "https://github.com/oscart/ODMSwipeSelector"
  s.screenshots  = "http://bit.ly/1xgcTYg"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = "Oscar De Moya"
  s.social_media_url   = "http://twitter.com/odm"
  s.source       = { :git => "https://github.com/oscart/ODMSwipeSelector.git", :tag => "0.0.1" }
  s.source_files  = "ODMSwipeSelector", "ODMSwipeSelector/*.{h,m}"
  s.frameworks   = 'UIKit'
  s.ios.deployment_target = '8.1'
  s.platform = :ios, '8.1'
  s.requires_arc = true

end

Pod::Spec.new do |s|

  s.name         = "ODMSwipeSelector"
  s.version      = "0.6"
  s.summary      = "A value selector for iOS with swipe gestures."
  s.homepage     = "https://github.com/oscart/ODMSwipeSelector"
  s.screenshots  = "https://s3.amazonaws.com/f.cl.ly/items/3b2v2V2j0y2E2z1l3V3a/Screen%20Recording%202014-12-31%20at%2010.55%20AM.gif"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = "Oscar De Moya"
  s.social_media_url   = "http://twitter.com/odm"
  s.source       = { :git => "https://github.com/oscart/ODMSwipeSelector.git", :tag => "0.6" }
  s.source_files  = "ODMSwipeSelector", "ODMSwipeSelector/*.{h,m}"
  s.frameworks   = 'UIKit'
  s.ios.deployment_target = '8.0'
  s.platform = :ios, '8.0'
  s.requires_arc = true

end

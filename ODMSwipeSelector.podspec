Pod::Spec.new do |s|

  s.name         = "ODMSwipeSelector"
  s.version      = "0.7.5"
  s.summary      = "A value selector for iOS with swipe gestures."
  s.homepage     = "https://github.com/oscart/ODMSwipeSelector"
  s.screenshots  = "http://f.cl.ly/items/0o3D3V2D3J2z1A3k0H3D/Screen%20Recording%202015-03-04%20at%2001.48%20PM.gif"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = "Oscar De Moya"
  s.social_media_url   = "http://twitter.com/odm"
  s.source       = { :git => "https://github.com/oscart/ODMSwipeSelector.git", :tag => "0.7.5" }
  s.source_files  = "ODMSwipeSelector", "ODMSwipeSelector/*.{h,m}"
  s.frameworks   = 'UIKit'
  s.ios.deployment_target = '8.0'
  s.platform = :ios, '8.0'
  s.requires_arc = true

end

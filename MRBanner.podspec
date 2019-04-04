
Pod::Spec.new do |s|
  s.name             = 'MRBanner'
  s.version          = '0.2.1'
  s.summary          = '轮播图,支持背景色跟随变化'
  s.description      = <<-DESC
                        轮播图,支持背景色跟随变化
                       DESC
  s.homepage         = 'https://github.com/MQL9011/MRBanner.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '301063915@qq.com' => '301063915@qq.com' }
  s.source           = { :git => 'https://github.com/MQL9011/MRBanner.git', :tag => s.version.to_s }
  s.social_media_url = 'http://www.mccree.info:9000/'

  s.ios.deployment_target = '8.0'
  s.source_files = 'MRBanner/Classes/**/*'
  s.public_header_files = 'MRBanner/Classes/*.h'
  s.dependency 'SDWebImage'
end

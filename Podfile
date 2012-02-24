platform :ios

dependency 'SBJson', '2.2.3'
dependency 'MBProgressHUD', '0.41'
dependency 'CocoaLumberjack', '1.3.2'

# Restkit
dependency 'RestKit/Network', '0.9.3'
dependency 'RestKit/ObjectMapping', '0.9.3'
dependency 'RestKit/ObjectMapping/JSONKit', '0.9.3'

dependency do |s|
  s.name = 'MRCEnumerable'
  s.version = '0.1'
  s.platform = :ios
  s.source = { :git => 'https://github.com/crafterm/MRCEnumerable.git', :commit => '15db6f3e48c5483d9635257511366864072ea016' }
  s.source_files = '*.{h,m}'
  #s.frameworks = 'QuartzCore', 'CoreGraphics'
end

# TODO: Compiler problems with LLVM 3.0
dependency do |s|
  s.name = 'NUSurveyor'
  s.version = '0.0.0'
  s.platform = :ios
  s.requires_arc = true
  # s.source = { :git => 'https://github.com/NUBIC/nu_surveyor.git', :commit => '3a2e1f5cf0f7e8e650ce860e6ad1bafefcd36cbe' }  
  s.source = { :git => 'https://github.com/NUBIC/nu_surveyor.git', :commit => 'd854e354e1f9a4c58621f75eb8bd04ece4d4ee10' }
  # s.resources = 'Resources/SSToolkit.bundle'
  s.source_files = 'NUSurveyor/*.{h,m}', 'NUSurveyor/**/*.{h,m}'
  s.frameworks = 'QuartzCore'
  def s.post_install(target)
    prefix_header = config.project_pods_root + target.prefix_header_filename
    prefix_header.open('a') do |file|
      file.puts(%{#ifdef __OBJC__\n#import "NUConstants.h"\n#endif})
    end
  end
end
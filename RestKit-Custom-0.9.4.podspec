Pod::Spec.new do |s|
  s.name     = 'RestKit'
  s.version  = '0.9.4'
  s.summary  = 'RestKit is a framework for consuming and modeling RESTful web resources on iOS and OS X.'
  s.homepage = 'http://www.restkit.org'
  s.author   = { 'Blake Watters' => 'blakewatters@gmail.com' }
  s.source   = { :git => 'https://github.com/RestKit/RestKit.git', :commit => '8d0d9fcd59412b160ea22297e988b16b7e8bc0a3' }

  # It has no source_files itself, so the resolver should not allow dependencies on this spec unless it’s a `part_of' type dependency

  def s.copy_header_mapping(from)
    from.relative_path_from(Pathname.new('Code'))
  end

  # This creates a new Pod::Specification instance, which has the the following attributes:
  # * part_of:  'RestKit', '0.9.3'
  # * name:    'RestKit/Network'
  # Other attributes are delegated to the `part_of' spec, so the version, summary etc will by default be the same
  s.subspec 'Network' do |ns|
    ns.description = 'The network layer provides a request/response abstraction on top of NSURLConnection.'
    ns.dependency 'LibComponentLogging-NSLog'
    ns.source_files = 'Code/RestKit.h', 'Code/{Network,Support}/*.{h,m}', 'Vendor/cocoa-oauth/*.{h,m}', 'Vendor/FileMD5Hash/*.{c,h}', 'Vendor/SOCKit/*.{h,m}'
    if config.ios?
        ns.frameworks = 'CFNetwork', 'Security', 'MobileCoreServices', 'SystemConfiguration'
    else
        ns.frameworks = 'CoreServices', 'Security', 'SystemConfiguration'
    end
  end

  # Like before, this creates a new spec with the name: RestKit/ObjectMapping and is a part of RestKit
  s.subspec 'ObjectMapping' do |os|
    os.description = %{The object mapping layer provides a simple API for turning remote JSON/XML responses into objects.}
    os.dependency 'RestKit/Network'
    os.source_files = 'Code/ObjectMapping/*.{h,m}'

    # This spec will have the name: RestKit/ObjectMapping/JSON.
    # Since it’s nested under another sub spec, it automatically depends on the parent: RestKit/ObjectMapping
    os.subspec 'JSONKit' do |jos|
      jos.description = 'The RestKit JSON parser which wraps JSONKit.'
      jos.source_files = 'Code/Support/Parsers/JSON/RKJSONParserJSONKit.{h,m}'
      jos.dependency 'JSONKit'
    end

    # This spec will have the name: RestKit/ObjectMapping/XML.
    # Since it’s nested under another sub spec, it automatically depends on the parent: RestKit/ObjectMapping
    os.subspec 'XML' do |xos|
      xos.description = 'The RestKit XML parser which wraps libxml2.'
      xos.source_files = 'Code/Support/Parsers/XML/RKXMLParserLibXML.{h,m}'
      xos.library = 'xml2'
      xos.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2' }
    end
  end
  
  s.subspec 'CoreData' do |ds|
      ds.description = %{The Core Data layer provides additional support on top of the object mapper for mapping from remote resources to persist local objects.}
      ds.source_files = 'Code/CoreData/*.{h,m}'
      ds.frameworks = 'CoreData'

      #if we copy headers to default location
      ##import <CoreData/CoreData.h> will use RestKit header instead of
      #system
      def ds.copy_header_mapping(from)
        "RKCoreData/#{from.basename}"
      end
  end
end

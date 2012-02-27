NCS Navigator Field
===================

This is an ios application which assists field workers in data collection for the National Children's Study. 

Configuration
-------------

1. Copy NUCas.plist-sample to NUCas.plist
2. Update cas.base.url, cas.retrieve.url, and cas.receive.url in NUCas.plist
3. Copy NCSNavigatorField.plist-sample to NCSNavigatorField.plist
4. Update cas.base.url, cas.retrieve.url, and cas.receive.url in NCSNavigatorField.plist
5. `gem install bundler cocoapods`
6. `bundle exec pods install` 
7. Change deploy target in the NCSMobile project->Build Settings to 5.0

Testing
-------

NCS Navigator Field currently only supports pulling data from the ncs core services stub service located in the ncs-core-stub subdirectory.

To run this you need to:

1. Have a working ruby and rubygems installation
2. Change directory to ncs-core-stub
<pre>cd ncs-core-stub</pre>
3. Install the bundler rubygem
<pre>gem install bundler</pre>
4. Install dependent gems
<pre>bundle install</pre>
5. Start the NCS Core Services Stub
<pre>ruby ncs_core_stub.rb</pre>


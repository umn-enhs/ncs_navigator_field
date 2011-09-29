NCS Navigator Field
===================

This is an ios application to assist field workers in data collection for the National Childrens Study. 

Testing
-------

NCS Navigator Field currently only supports pulling data from a ncs core stub service which is located in the ncs-cores-stub subdirectory.

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


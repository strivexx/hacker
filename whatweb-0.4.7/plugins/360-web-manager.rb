##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Updated regex and version detection
##
Plugin.define "360-Web-Manager" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-12
version "0.2"
description "360-Web-Manager - homepage: http://www.360webmanager.com"

# About 36,800 results for "powered by 360 Web Manager" @ 2010-06-12
examples %w|
www.360webmanager.com/index.php
www.360web.com.ar/index.php
www.360webnews.com/index.php
www.360webmarketing.com.ar/index.php
www.360webmastertools.net/index.php
www.excedoboats.com/index1.php
www.flybynet.net/index.php
www.ecs.com.ar/index.php
www.fucoreyes.com/index1.php
www.lu.net.ar/index.php
www.clanmacfarlane.com.ar/index1.php
www.materiaurbana.com/index.php
www.jornadasalicaceas.com/index.php
www.flybynet.net/index.php
www.afcp.org.ar/index.php
www.sacryc.com.ar/index.php
wasargentina2011.com/index1.php
www.cultoasanlamuerte.com/index.php
www.kalmada.com.ar/index1.php
|

matches [

# Powered by text
{ :ghdb=>'"powered by 360 Web Manager"', :certainty=>75 },

# Redirect page
{ :regexp=>/360WebManager Software :: administrador contenidos web/, :certainty=>75 },

# Version detection # Powered by text
{ :version=>/<div align="center"><span class="copyr">Powered by <a href="http:\/\/www.360webmanager.com" target="_blank" class="copyrlink">360 Web Manager<\/a> ([\d\.]+)/ },

]

end


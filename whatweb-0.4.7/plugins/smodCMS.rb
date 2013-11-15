##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SmodCMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-16
version "0.1"
description "SmodCMS - homepage: http://www.smod.pl/"

# 13 results for "powered by SmodCMS" @ 2010-08-16
examples %w|
www.szkolakorlino.pl
jaroslawiec24.com
nowy.poznan.kph.org.pl
www.mariuszgorczynski.pl
www.travelneo.pl
poznan.kph.org.pl
|

matches [

{ :text=>'<meta name="Generator" content="SmodCMS" />' },
{ :text=>'<meta name="Authoring_Tool" content="SmodCMS // www.smod.pl" />' },

{ :regexp=>/[P|p]+owered by <a href="http:\/\/www.smod.pl[\/]+"[^>]+>SmodCMS[\s]*<\/a>/ },

]


end


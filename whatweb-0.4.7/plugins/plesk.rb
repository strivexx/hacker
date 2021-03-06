##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

#Version 0.2
# convert :regexp to :text, remove :certainty=>100
#Version 0.3
# added more matches for 1999- 2007 version, improved existing matches

Plugin.define "Plesk" do
author "Andrew Horton"
version "0.3"
description "Plesk is a web control panel Homepage: http://www.parallels.com/products/plesk/"
examples %w| 119.47.117.109 119.47.116.250 124.198.191.234 |

# 2006
# <img src='def_plesk_logo.gif' alt="Plesk logo">
# <h1>This is the Plesk&#153; default page</h1>
# <p>For more information please contact <!--@adminemail@-->

# newer
# img/common/def_plesk_logo.gif
# <p>For more information please contact <!--@adminemail@-->

# 192.47.116.250
# <a target="_blank" href="http://www.parallels.com"><img src="img/common/parallels_powered.gif" title="Powered by Parallels&trade;"></a>


# http://202.89.57.34
# 1999-2006 version
# <title>Default PLESK Page</title>
# <img src='def_plesk_logo.gif' alt="Plesk logo" width="161" height="41">
#  <h1>This is the Plesk&#153; default page</h1>


# http://119.47.118.185/
# -2009 version
# <title>Default Parallels Plesk Panel Page</title>
# <h1><a class="product-logo" href="http://www.parallels.com/plesk/" title="Parallels Plesk Panel">Parallels Plesk Panel</a></h1>
# &copy; Copyright 1999-2009, Parallels<br />
# <p><strong>This page is generated by <a href="http://www.parallels.com/plesk/">Parallels Plesk Panel</a>
# This page was generated by <a href="http://www.parallels.com/en/products/plesk/">Parallels Plesk Panel</a>

# 1999- 2007 version
# This page is autogenerated by <a target="_blank" href="http://www.swsoft.com/en/products/plesk/">Plesk
# <div class="poweredBy"><a target="_blank" href="http://www.swsoft.com/en/products/plesk/"><img src="img/common/pb_plesk.gif"
# if (window.plesk_promo.virtuozzo) {

matches [
{:name=>"logo gif",  :text=>"<img src='def_plesk_logo.gif' alt=\"Plesk logo\"" },
{:text=>'<p>For more information please contact <!--@adminemail@-->' },

{:name=>"poweredBy parallels", 
:regexp=>/<a target="_blank" href="http:\/\/www.parallels.com"><img src="[^"]+\/parallels_powered.gif" title="Powered by Parallels&trade;"><\/a>/ }, #"

{:text=>'<div class="poweredBy"><a target="_blank" href="http://www.swsoft.com/en/products/plesk/'},

{:text=>'<title>Default PLESK Page</title>' },
{:text=>'<h1>This is the Plesk&#153; default page</h1>' }, 
{:text=>'<title>Default Parallels Plesk Panel Page</title>' },

{:name=>"h1 plesk link", 
:text=>'<h1><a class="product-logo" href="http://www.parallels.com/plesk/" title="Parallels Plesk Panel">Parallels Plesk Panel</a></h1>' },

{:name=>"copyright parallels",  :certainty=>25, :regexp=>/&copy; Copyright [\d]{4}\-[\d]{4}, Parallels</ },

{:text=>'This page is generated by <a href="http://www.parallels.com/plesk/">Parallels Plesk Panel</a>' },
{:text=>'This page was generated by <a href="http://www.parallels.com/en/products/plesk/">Parallels Plesk Panel</a>' },
{:text=>'This page is autogenerated by <a target="_blank" href="http://www.swsoft.com/en/products/plesk/">Plesk'},
{:text=>'if (window.plesk_promo.virtuozzo) {'}

#

]

end


##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# v1.0
# not so foolproof if the site uses its own custom 404 and custom cookie name
# v2.0 by Andrew Horton
# new random string

Plugin.define "CodeIgniter-PHP-Framework" do
author "Aung Khant <YGN Ethical Hacker Group, Myanmar, http://yehg.net>"
version "0.2"
description "CodeIgniter PHP Framework - http://codeigniter.com/ "

# more http://codeigniter.com/projects/

examples=%w| 
dearie6.com  
www.foodrunner.nl
www.kunststofoveral.nl
www.iwasblownaway.com
www.neoreader.com.br
www.wissamjoubran.com
www.horadecomer.com
climatechange.pacificpeoplespartnership.org
www.creatieve-cursussen.nl
www.councillcontract.com
bambooinvoice.org
nuherbs.com
kennedyhahn.com
www.enerdata.com
|	

def randstr
 (0..8).map { (('a'..'z').to_a + (0..9).to_a).choice }.join
end 

matches [
{:string=>'404 Signature',:url=>randstr(),:md5=>'e087ab5729efdfa939ba620e4593bd99'},
{:string=>'404 Signature',:url=>'index.php/'+randstr(),:md5=>'e087ab5729efdfa939ba620e4593bd99'},
{:string=>'Database Error Signature',:url=>'index.php/'+randstr(),:md5=>'951c845488483135e52252609a1d99b2'},
{:string=>'Database Error Signature',:md5=>'951c845488483135e52252609a1d99b2'},
{:string=>'Invalid Character Filter',:url=>randstr()+'!!!',:md5=>'c9b724012ab64481a034f9a453143ece'},
{:string=>'Invalid Character Filter',:url=>randstr()+'!!!',:text=>'The URI you submitted has disallowed characters.'}
]

def passive
        m=[]
        m << {:string=>"ci_session Cookie" } if @meta["set-cookie"] =~ /ci_session=/
	m
end

end




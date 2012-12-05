

#Module cowboy_rest#
* [Description](#description)
* [Function Index](#index)
* [Function Details](#functions)


Experimental REST protocol implementation.

<a name="description"></a>

##Description##


Based on the Webmachine Diagram from Alan Dean and Justin Sheehy, which
can be found in the Webmachine source tree, and on the Webmachine
documentation available at http://wiki.basho.com/Webmachine.html
at the time of writing.<a name="index"></a>

##Function Index##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#upgrade-4">upgrade/4</a></td><td>Upgrade a HTTP request to the REST protocol.</td></tr></table>


<a name="functions"></a>

##Function Details##

<a name="upgrade-4"></a>

###upgrade/4##


<pre>upgrade(ListenerPid::pid(), Handler::module(), Opts::any(), Req) -&gt; {ok, Req} | close</pre>
<ul class="definitions"><li><pre>Req = <a href="cowboy_req.md#type-req">cowboy_req:req()</a></pre></li></ul>



Upgrade a HTTP request to the REST protocol.

You do not need to call this function manually. To upgrade to the REST
protocol, you simply need to return _{upgrade, protocol, cowboy_rest}_
in your _cowboy_http_handler:init/3_ handler function.
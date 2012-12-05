

#Module cowboy_websocket#
* [Description](#description)
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)


WebSocket protocol implementation.


<a name="types"></a>

##Data Types##




###<a name="type-frame">frame()</a>##



<pre>frame() = close | ping | pong | {text | binary | close | ping | pong, binary()}</pre>
<a name="index"></a>

##Function Index##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#upgrade-4">upgrade/4</a></td><td>Upgrade a HTTP request to the WebSocket protocol.</td></tr></table>


<a name="functions"></a>

##Function Details##

<a name="upgrade-4"></a>

###upgrade/4##


<pre>upgrade(ListenerPid::pid(), Handler::module(), Opts::any(), Req::<a href="cowboy_req.md#type-req">cowboy_req:req()</a>) -> closed</pre>
<br></br>




Upgrade a HTTP request to the WebSocket protocol.

You do not need to call this function manually. To upgrade to the WebSocket
protocol, you simply need to return _{upgrade, protocol, cowboy_websocket}_
in your _cowboy_http_handler:init/3_ handler function.
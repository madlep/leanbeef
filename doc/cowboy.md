

#Module cowboy#
* [Description](#description)
* [Function Index](#index)
* [Function Details](#functions)


Convenience API to start and stop HTTP/HTTPS listeners.

<a name="index"></a>

##Function Index##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#start_http-4">start_http/4</a></td><td>Start an HTTP listener.</td></tr><tr><td valign="top"><a href="#start_https-4">start_https/4</a></td><td>Start an HTTPS listener.</td></tr><tr><td valign="top"><a href="#stop_listener-1">stop_listener/1</a></td><td>Stop a listener.</td></tr></table>


<a name="functions"></a>

##Function Details##

<a name="start_http-4"></a>

###start_http/4##


<pre>start_http(Ref::any(), NbAcceptors::non_neg_integer(), TransOpts::any(), ProtoOpts::any()) -&gt; {ok, pid()}</pre>
<br></br>


Start an HTTP listener.<a name="start_https-4"></a>

###start_https/4##


<pre>start_https(Ref::any(), NbAcceptors::non_neg_integer(), TransOpts::any(), ProtoOpts::any()) -&gt; {ok, pid()}</pre>
<br></br>


Start an HTTPS listener.<a name="stop_listener-1"></a>

###stop_listener/1##


<pre>stop_listener(Ref::any()) -&gt; ok</pre>
<br></br>


Stop a listener.
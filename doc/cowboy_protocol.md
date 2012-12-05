

#Module cowboy_protocol#
* [Description](#description)
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)


HTTP protocol handler.

__See also:__ [cowboy_dispatcher](cowboy_dispatcher.md), [cowboy_http_handler](cowboy_http_handler.md).<a name="description"></a>

##Description##


The available options are:



<dt>dispatch</dt>



<dd>The dispatch list for this protocol.</dd>




<dt>max_empty_lines</dt>



<dd>Max number of empty lines before a request.
Defaults to 5.</dd>




<dt>max_header_name_length</dt>



<dd>Max length allowed for header names.
Defaults to 64.</dd>




<dt>max_header_value_length</dt>



<dd>Max length allowed for header values.
Defaults to 4096.</dd>




<dt>max_headers</dt>



<dd>Max number of headers allowed.
Defaults to 100.</dd>




<dt>max_keepalive</dt>



<dd>Max number of requests allowed in a single
keep-alive session. Defaults to infinity.</dd>




<dt>max_request_line_length</dt>



<dd>Max length allowed for the request
line. Defaults to 4096.</dd>




<dt>onrequest</dt>



<dd>Optional fun that allows Req interaction before
any dispatching is done. Host info, path info and bindings are thus
not available at this point.</dd>




<dt>onresponse</dt>



<dd>Optional fun that allows replacing a response
sent by the application.</dd>




<dt>timeout</dt>



<dd>Time in milliseconds before an idle
connection is closed. Defaults to 5000 milliseconds.</dd>




Note that there is no need to monitor these processes when using Cowboy as
an application as it already supervises them under the listener supervisor.

<a name="types"></a>

##Data Types##




###<a name="type-onrequest_fun">onrequest_fun()</a>##



<pre>onrequest_fun() = fun((Req) -&gt; Req)</pre>



###<a name="type-onresponse_fun">onresponse_fun()</a>##



<pre>onresponse_fun() = fun((<a href="cowboy_http.md#type-status">cowboy_http:status()</a>, <a href="cowboy_http.md#type-headers">cowboy_http:headers()</a>, iodata(), Req) -> Req)</pre>
<a name="index"></a>

##Function Index##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#start_link-4">start_link/4</a></td><td>Start an HTTP protocol process.</td></tr></table>


<a name="functions"></a>

##Function Details##

<a name="start_link-4"></a>

###start_link/4##


<pre>start_link(ListenerPid::pid(), Socket::<a href="inet.md#type-socket">inet:socket()</a>, Transport::module(), Opts::any()) -> {ok, pid()}</pre>
<br></br>


Start an HTTP protocol process.
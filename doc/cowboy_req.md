

#Module cowboy_req#
* [Description](#description)
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)


HTTP request manipulation API.

<a name="description"></a>

##Description##


The functions in this module try to follow this pattern for their
return types:



<dt>access:</dt>




<dd><em>{Value, Req}</em></dd>




<dt>action:</dt>




<dd><em>{Result, Req} | {Result, Value, Req} | {error, atom()}</em></dd>




<dt>modification:</dt>




<dd><em>Req</em></dd>




<dt>question (<em>has_*</em> or <em>is_*</em>):</dt>




<dd><em>boolean()</em></dd>






Exceptions include _chunk/2_ which always returns _'ok'_,
_to_list/1_ which returns a list of key/values,
and _transport/1_ which returns _{ok, Transport, Socket}_.



Also note that all body reading functions perform actions, as Cowboy
doesn't read the request body until they are called.

Whenever _Req_ is returned, it should always be kept in place of
the one given as argument in your function call, because it keeps
track of the request and response state. Doing so allows Cowboy to do
some lazy evaluation and cache results when possible.
<a name="types"></a>

##Data Types##




###<a name="type-req">req()</a>##



__abstract datatype__: `req()`



###<a name="type-resp_body_fun">resp_body_fun()</a>##



<pre>resp_body_fun() = fun(() -&gt; {sent, non_neg_integer()})</pre>
<a name="index"></a>

##Function Index##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#binding-2">binding/2</a></td><td>Equivalent to <a href="#binding-3"><tt>binding(Name, Req, undefined)</tt></a>.</td></tr><tr><td valign="top"><a href="#binding-3">binding/3</a></td><td>Return the binding value for the given key obtained when matching
the host and path against the dispatch list, or a default if missing.</td></tr><tr><td valign="top"><a href="#bindings-1">bindings/1</a></td><td>Return the full list of binding values.</td></tr><tr><td valign="top"><a href="#body-1">body/1</a></td><td>Return the full body sent with the request.</td></tr><tr><td valign="top"><a href="#body-2">body/2</a></td><td>Return the full body sent with the request as long as the body
length doesn't go over MaxLength.</td></tr><tr><td valign="top"><a href="#body_length-1">body_length/1</a></td><td>Return the request message body length, if known.</td></tr><tr><td valign="top"><a href="#body_qs-1">body_qs/1</a></td><td>Return the full body sent with the request, parsed as an
application/x-www-form-urlencoded string.</td></tr><tr><td valign="top"><a href="#chunk-2">chunk/2</a></td><td>Send a chunk of data.</td></tr><tr><td valign="top"><a href="#chunked_reply-2">chunked_reply/2</a></td><td>Equivalent to <a href="#chunked_reply-3"><tt>chunked_reply(Status, [], Req)</tt></a>.</td></tr><tr><td valign="top"><a href="#chunked_reply-3">chunked_reply/3</a></td><td>Initiate the sending of a chunked reply to the client.</td></tr><tr><td valign="top"><a href="#compact-1">compact/1</a></td><td>Compact the request data by removing all non-system information.</td></tr><tr><td valign="top"><a href="#cookie-2">cookie/2</a></td><td>Equivalent to <a href="#cookie-3"><tt>cookie(Name, Req, undefined)</tt></a>.</td></tr><tr><td valign="top"><a href="#cookie-3">cookie/3</a></td><td>Return the cookie value for the given key, or a default if
missing.</td></tr><tr><td valign="top"><a href="#cookies-1">cookies/1</a></td><td>Return the full list of cookie values.</td></tr><tr><td valign="top"><a href="#delete_resp_header-2">delete_resp_header/2</a></td><td></td></tr><tr><td valign="top"><a href="#fragment-1">fragment/1</a></td><td>Return the raw fragment directly taken from the request.</td></tr><tr><td valign="top"><a href="#has_body-1">has_body/1</a></td><td>Return whether the request message has a body.</td></tr><tr><td valign="top"><a href="#has_resp_body-1">has_resp_body/1</a></td><td>Return whether a body has been set for the response.</td></tr><tr><td valign="top"><a href="#has_resp_header-2">has_resp_header/2</a></td><td>Return whether the given header has been set for the response.</td></tr><tr><td valign="top"><a href="#header-2">header/2</a></td><td>Equivalent to <a href="#header-3"><tt>header(Name, Req, undefined)</tt></a>.</td></tr><tr><td valign="top"><a href="#header-3">header/3</a></td><td>Return the header value for the given key, or a default if missing.</td></tr><tr><td valign="top"><a href="#headers-1">headers/1</a></td><td>Return the full list of headers.</td></tr><tr><td valign="top"><a href="#host-1">host/1</a></td><td>Return the host binary string.</td></tr><tr><td valign="top"><a href="#host_info-1">host_info/1</a></td><td>Return the extra host information obtained from partially matching
the hostname using <em>'...'</em>.</td></tr><tr><td valign="top"><a href="#host_url-1">host_url/1</a></td><td>Return the request URL as a binary without the path and query string.</td></tr><tr><td valign="top"><a href="#init_stream-4">init_stream/4</a></td><td>Initialize body streaming and set custom decoding functions.</td></tr><tr><td valign="top"><a href="#meta-2">meta/2</a></td><td>Equivalent to <a href="#meta-3"><tt>meta(Name, Req, undefined)</tt></a>.</td></tr><tr><td valign="top"><a href="#meta-3">meta/3</a></td><td>Return metadata information about the request.</td></tr><tr><td valign="top"><a href="#method-1">method/1</a></td><td>Return the HTTP method of the request.</td></tr><tr><td valign="top"><a href="#multipart_data-1">multipart_data/1</a></td><td>Return data from the multipart parser.</td></tr><tr><td valign="top"><a href="#multipart_skip-1">multipart_skip/1</a></td><td>Skip a part returned by the multipart parser.</td></tr><tr><td valign="top"><a href="#parse_header-2">parse_header/2</a></td><td>Semantically parse headers.</td></tr><tr><td valign="top"><a href="#parse_header-3">parse_header/3</a></td><td>Semantically parse headers.</td></tr><tr><td valign="top"><a href="#path-1">path/1</a></td><td>Return the path binary string.</td></tr><tr><td valign="top"><a href="#path_info-1">path_info/1</a></td><td>Return the extra path information obtained from partially matching
the patch using <em>'...'</em>.</td></tr><tr><td valign="top"><a href="#peer-1">peer/1</a></td><td>Return the peer address and port number of the remote host.</td></tr><tr><td valign="top"><a href="#peer_addr-1">peer_addr/1</a></td><td>Returns the peer address calculated from headers.</td></tr><tr><td valign="top"><a href="#port-1">port/1</a></td><td>Return the port used for this request.</td></tr><tr><td valign="top"><a href="#qs-1">qs/1</a></td><td>Return the raw query string directly taken from the request.</td></tr><tr><td valign="top"><a href="#qs_val-2">qs_val/2</a></td><td>Equivalent to <a href="#qs_val-3"><tt>qs_val(Name, Req, undefined)</tt></a>.</td></tr><tr><td valign="top"><a href="#qs_val-3">qs_val/3</a></td><td>Return the query string value for the given key, or a default if
missing.</td></tr><tr><td valign="top"><a href="#qs_vals-1">qs_vals/1</a></td><td>Return the full list of query string values.</td></tr><tr><td valign="top"><a href="#reply-2">reply/2</a></td><td>Equivalent to <a href="#reply-4"><tt>reply(Status, [], [], Req)</tt></a>.</td></tr><tr><td valign="top"><a href="#reply-3">reply/3</a></td><td>Equivalent to <a href="#reply-4"><tt>reply(Status, Headers, [], Req)</tt></a>.</td></tr><tr><td valign="top"><a href="#reply-4">reply/4</a></td><td>Send a reply to the client.</td></tr><tr><td valign="top"><a href="#set_meta-3">set_meta/3</a></td><td>Set metadata information.</td></tr><tr><td valign="top"><a href="#set_resp_body-2">set_resp_body/2</a></td><td>Add a body to the response.</td></tr><tr><td valign="top"><a href="#set_resp_body_fun-3">set_resp_body_fun/3</a></td><td>Add a body function to the response.</td></tr><tr><td valign="top"><a href="#set_resp_cookie-4">set_resp_cookie/4</a></td><td>Add a cookie header to the response.</td></tr><tr><td valign="top"><a href="#set_resp_header-3">set_resp_header/3</a></td><td>Add a header to the response.</td></tr><tr><td valign="top"><a href="#skip_body-1">skip_body/1</a></td><td></td></tr><tr><td valign="top"><a href="#stream_body-1">stream_body/1</a></td><td>Stream the request's body.</td></tr><tr><td valign="top"><a href="#to_list-1">to_list/1</a></td><td>Convert the Req object to a list of key/values.</td></tr><tr><td valign="top"><a href="#transport-1">transport/1</a></td><td>Return the transport module and socket associated with a request.</td></tr><tr><td valign="top"><a href="#url-1">url/1</a></td><td>Return the full request URL as a binary.</td></tr><tr><td valign="top"><a href="#version-1">version/1</a></td><td>Return the HTTP version used for the request.</td></tr></table>


<a name="functions"></a>

##Function Details##

<a name="binding-2"></a>

###binding/2##


<pre>binding(Name::atom(), Req) -&gt; {binary() | undefined, Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>

Equivalent to [`binding(Name, Req, undefined)`](#binding-3).<a name="binding-3"></a>

###binding/3##


<pre>binding(Name::atom(), Req, Default) -&gt; {binary() | Default, Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li><li><pre>Default = any()</pre></li></ul>

Return the binding value for the given key obtained when matching
the host and path against the dispatch list, or a default if missing.<a name="bindings-1"></a>

###bindings/1##


<pre>bindings(Req) -&gt; {[{atom(), binary()}], Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>

Return the full list of binding values.<a name="body-1"></a>

###body/1##


<pre>body(Req) -&gt; {ok, binary(), Req} | {error, atom()}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>

Return the full body sent with the request.<a name="body-2"></a>

###body/2##


<pre>body(MaxLength::non_neg_integer() | infinity, Req) -&gt; {ok, binary(), Req} | {error, atom()}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>



Return the full body sent with the request as long as the body
length doesn't go over MaxLength.

This is most useful to quickly be able to get the full body while
avoiding filling your memory with huge request bodies when you're
not expecting it.<a name="body_length-1"></a>

###body_length/1##


<pre>body_length(Req) -&gt; {undefined | non_neg_integer(), Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>



Return the request message body length, if known.

The length may not be known if Transfer-Encoding is not identity,
and the body hasn't been read at the time of the call.<a name="body_qs-1"></a>

###body_qs/1##


<pre>body_qs(Req) -&gt; {ok, [{binary(), binary() | true}], Req} | {error, atom()}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>

Return the full body sent with the request, parsed as an
application/x-www-form-urlencoded string. Essentially a POST query string.<a name="chunk-2"></a>

###chunk/2##


<pre>chunk(Data::iodata(), Http_req::<a href="#type-req">req()</a>) -> ok | {error, atom()}</pre>
<br></br>




Send a chunk of data.

A chunked reply must have been initiated before calling this function.<a name="chunked_reply-2"></a>

###chunked_reply/2##


<pre>chunked_reply(Status::<a href="cowboy_http.md#type-status">cowboy_http:status()</a>, Req) -> {ok, Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>

Equivalent to [`chunked_reply(Status, [], Req)`](#chunked_reply-3).<a name="chunked_reply-3"></a>

###chunked_reply/3##


<pre>chunked_reply(Status::<a href="cowboy_http.md#type-status">cowboy_http:status()</a>, Headers::<a href="cowboy_http.md#type-headers">cowboy_http:headers()</a>, Req) -> {ok, Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>

Initiate the sending of a chunked reply to the client.

__See also:__ [cowboy_req:chunk/2](cowboy_req.md#chunk-2).<a name="compact-1"></a>

###compact/1##


<pre>compact(Req) -&gt; Req</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>



Compact the request data by removing all non-system information.



This essentially removes the host and path info, query string, bindings,
headers and cookies.

Use it when you really need to save up memory, for example when having
many concurrent long-running connections.<a name="cookie-2"></a>

###cookie/2##


<pre>cookie(Name::binary(), Req) -&gt; {binary() | true | undefined, Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>

Equivalent to [`cookie(Name, Req, undefined)`](#cookie-3).<a name="cookie-3"></a>

###cookie/3##


<pre>cookie(Name::binary(), Req, Default) -&gt; {binary() | true | Default, Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li><li><pre>Default = any()</pre></li></ul>

Return the cookie value for the given key, or a default if
missing.<a name="cookies-1"></a>

###cookies/1##


<pre>cookies(Req) -&gt; {[{binary(), binary() | true}], Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>

Return the full list of cookie values.<a name="delete_resp_header-2"></a>

###delete_resp_header/2##


<pre>delete_resp_header(Name::binary(), Req) -&gt; Req</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>

<a name="fragment-1"></a>

###fragment/1##


<pre>fragment(Req) -&gt; {binary(), Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>

Return the raw fragment directly taken from the request.<a name="has_body-1"></a>

###has_body/1##


<pre>has_body(Req) -&gt; {boolean(), Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>

Return whether the request message has a body.<a name="has_resp_body-1"></a>

###has_resp_body/1##


<pre>has_resp_body(Http_req::<a href="#type-req">req()</a>) -> boolean()</pre>
<br></br>


Return whether a body has been set for the response.<a name="has_resp_header-2"></a>

###has_resp_header/2##


<pre>has_resp_header(Name::binary(), Http_req::<a href="#type-req">req()</a>) -> boolean()</pre>
<br></br>


Return whether the given header has been set for the response.<a name="header-2"></a>

###header/2##


<pre>header(Name::binary(), Req) -&gt; {binary() | undefined, Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>

Equivalent to [`header(Name, Req, undefined)`](#header-3).<a name="header-3"></a>

###header/3##


<pre>header(Name::binary(), Req, Default) -&gt; {binary() | Default, Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li><li><pre>Default = any()</pre></li></ul>

Return the header value for the given key, or a default if missing.<a name="headers-1"></a>

###headers/1##


<pre>headers(Req) -> {<a href="cowboy_http.md#type-headers">cowboy_http:headers()</a>, Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>

Return the full list of headers.<a name="host-1"></a>

###host/1##


<pre>host(Req) -&gt; {binary(), Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>

Return the host binary string.<a name="host_info-1"></a>

###host_info/1##


<pre>host_info(Req) -> {<a href="cowboy_dispatcher.md#type-tokens">cowboy_dispatcher:tokens()</a> | undefined, Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>

Return the extra host information obtained from partially matching
the hostname using _'...'_.<a name="host_url-1"></a>

###host_url/1##


<pre>host_url(Req) -&gt; {binary(), Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>



Return the request URL as a binary without the path and query string.

The URL includes the scheme, host and port only.

__See also:__ [cowboy_req:url/1](cowboy_req.md#url-1).<a name="init_stream-4"></a>

###init_stream/4##


<pre>init_stream(TransferDecode::function(), TransferState::any(), ContentDecode::function(), Req) -&gt; {ok, Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>



Initialize body streaming and set custom decoding functions.



Calling this function is optional. It should only be used if you
need to override the default behavior of Cowboy. Otherwise you
should call stream_body/1 directly.



Two decodings happen. First a decoding function is applied to the
transferred data, and then another is applied to the actual content.



Transfer encoding is generally used for chunked bodies. The decoding
function uses a state to keep track of how much it has read, which is
also initialized through this function.



Content encoding is generally used for compression.

Standard encodings can be found in cowboy_http.<a name="meta-2"></a>

###meta/2##


<pre>meta(Name::atom(), Req) -&gt; {any() | undefined, Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>

Equivalent to [`meta(Name, Req, undefined)`](#meta-3).<a name="meta-3"></a>

###meta/3##


<pre>meta(Name::atom(), Req, Default::any()) -&gt; {any(), Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>



Return metadata information about the request.

Metadata information varies from one protocol to another. Websockets
would define the protocol version here, while REST would use it to
indicate which media type, language and charset were retained.<a name="method-1"></a>

###method/1##


<pre>method(Req) -&gt; {binary(), Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>

Return the HTTP method of the request.<a name="multipart_data-1"></a>

###multipart_data/1##


<pre>multipart_data(Req) -> {headers, <a href="cowboy_http.md#type-headers">cowboy_http:headers()</a>, Req} | {body, binary(), Req} | {end_of_part | eof, Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>



Return data from the multipart parser.



Use this function for multipart streaming. For each part in the request,
this function returns _{headers, Headers}_ followed by a sequence of
_{body, Data}_ tuples and finally _end_of_part_. When there
is no part to parse anymore, _eof_ is returned.

If the request Content-Type is not a multipart one, _{error, badarg}_
is returned.<a name="multipart_skip-1"></a>

###multipart_skip/1##


<pre>multipart_skip(Req) -&gt; {ok, Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>



Skip a part returned by the multipart parser.

This function repeatedly calls _multipart_data/1_ until
_end_of_part_ or _eof_ is parsed.<a name="parse_header-2"></a>

###parse_header/2##


<pre>parse_header(Name::binary(), Req) -&gt; {ok, any(), Req} | {undefined, binary(), Req} | {error, badarg}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>



Semantically parse headers.

When the value isn't found, a proper default value for the type
returned is used as a return value.

__See also:__ [parse_header/3](#parse_header-3).<a name="parse_header-3"></a>

###parse_header/3##


<pre>parse_header(Name::binary(), Req, Default::any()) -&gt; {ok, any(), Req} | {undefined, binary(), Req} | {error, badarg}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>



Semantically parse headers.

When the header is unknown, the value is returned directly without parsing.<a name="path-1"></a>

###path/1##


<pre>path(Req) -&gt; {binary(), Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>

Return the path binary string.<a name="path_info-1"></a>

###path_info/1##


<pre>path_info(Req) -> {<a href="cowboy_dispatcher.md#type-tokens">cowboy_dispatcher:tokens()</a> | undefined, Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>

Return the extra path information obtained from partially matching
the patch using _'...'_.<a name="peer-1"></a>

###peer/1##


<pre>peer(Req) -> {{<a href="inet.md#type-ip_address">inet:ip_address()</a>, <a href="inet.md#type-port_number">inet:port_number()</a>}, Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>

Return the peer address and port number of the remote host.<a name="peer_addr-1"></a>

###peer_addr/1##


<pre>peer_addr(Req) -> {<a href="inet.md#type-ip_address">inet:ip_address()</a>, Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>

Returns the peer address calculated from headers.<a name="port-1"></a>

###port/1##


<pre>port(Req) -> {<a href="inet.md#type-port_number">inet:port_number()</a>, Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>

Return the port used for this request.<a name="qs-1"></a>

###qs/1##


<pre>qs(Req) -&gt; {binary(), Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>

Return the raw query string directly taken from the request.<a name="qs_val-2"></a>

###qs_val/2##


<pre>qs_val(Name::binary(), Req) -&gt; {binary() | true | undefined, Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>

Equivalent to [`qs_val(Name, Req, undefined)`](#qs_val-3).<a name="qs_val-3"></a>

###qs_val/3##


<pre>qs_val(Name::binary(), Req, Default) -&gt; {binary() | true | Default, Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li><li><pre>Default = any()</pre></li></ul>

Return the query string value for the given key, or a default if
missing.<a name="qs_vals-1"></a>

###qs_vals/1##


<pre>qs_vals(Req) -&gt; {[{binary(), binary() | true}], Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>

Return the full list of query string values.<a name="reply-2"></a>

###reply/2##


<pre>reply(Status::<a href="cowboy_http.md#type-status">cowboy_http:status()</a>, Req) -> {ok, Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>

Equivalent to [`reply(Status, [], [], Req)`](#reply-4).<a name="reply-3"></a>

###reply/3##


<pre>reply(Status::<a href="cowboy_http.md#type-status">cowboy_http:status()</a>, Headers::<a href="cowboy_http.md#type-headers">cowboy_http:headers()</a>, Req) -> {ok, Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>

Equivalent to [`reply(Status, Headers, [], Req)`](#reply-4).<a name="reply-4"></a>

###reply/4##


<pre>reply(Status::<a href="cowboy_http.md#type-status">cowboy_http:status()</a>, Headers::<a href="cowboy_http.md#type-headers">cowboy_http:headers()</a>, Body::iodata() | {non_neg_integer() | <a href="#type-resp_body_fun">resp_body_fun()</a>}, Req) -> {ok, Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>

Send a reply to the client.<a name="set_meta-3"></a>

###set_meta/3##


<pre>set_meta(Name::atom(), Value::any(), Req) -&gt; Req</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>



Set metadata information.



You can use this function to attach information about the request.

If the value already exists it will be overwritten.<a name="set_resp_body-2"></a>

###set_resp_body/2##


<pre>set_resp_body(Body::iodata(), Req) -&gt; Req</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>



Add a body to the response.

The body set here is ignored if the response is later sent using
anything other than reply/2 or reply/3. The response body is expected
to be a binary or an iolist.<a name="set_resp_body_fun-3"></a>

###set_resp_body_fun/3##


<pre>set_resp_body_fun(StreamLen::non_neg_integer(), StreamFun::<a href="#type-resp_body_fun">resp_body_fun()</a>, Req) -> Req</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>



Add a body function to the response.



The response body may also be set to a content-length - stream-function pair.
If the response body is of this type normal response headers will be sent.
After the response headers has been sent the body function is applied.
The body function is expected to write the response body directly to the
socket using the transport module.

If the body function crashes while writing the response body or writes fewer
bytes than declared the behaviour is undefined. The body set here is ignored
if the response is later sent using anything other than `reply/2` or
`reply/3`.


__See also:__ [cowboy_req:transport/1](cowboy_req.md#transport-1).<a name="set_resp_cookie-4"></a>

###set_resp_cookie/4##


<pre>set_resp_cookie(Name::binary(), Value::binary(), Options::[<a href="cowboy_cookies.md#type-cookie_option">cowboy_cookies:cookie_option()</a>], Req) -> Req</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>

Add a cookie header to the response.<a name="set_resp_header-3"></a>

###set_resp_header/3##


<pre>set_resp_header(Name::binary(), Value::iodata(), Req) -&gt; Req</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>

Add a header to the response.<a name="skip_body-1"></a>

###skip_body/1##


<pre>skip_body(Req) -&gt; {ok, Req} | {error, atom()}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>

<a name="stream_body-1"></a>

###stream_body/1##


<pre>stream_body(Req) -&gt; {ok, binary(), Req} | {done, Req} | {error, atom()}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>



Stream the request's body.



This is the most low level function to read the request body.



In most cases, if they weren't defined before using stream_body/4,
this function will guess which transfer and content encodings were
used for building the request body, and configure the decoding
functions that will be used when streaming.

It then starts streaming the body, returning {ok, Data, Req}
for each streamed part, and {done, Req} when it's finished streaming.<a name="to_list-1"></a>

###to_list/1##


<pre>to_list(Req::<a href="#type-req">req()</a>) -> [{atom(), any()}]</pre>
<br></br>


Convert the Req object to a list of key/values.<a name="transport-1"></a>

###transport/1##


<pre>transport(Http_req::<a href="#type-req">req()</a>) -> {ok, module(), <a href="inet.md#type-socket">inet:socket()</a>}</pre>
<br></br>




Return the transport module and socket associated with a request.



This exposes the same socket interface used internally by the HTTP protocol
implementation to developers that needs low level access to the socket.

It is preferred to use this in conjuction with the stream function support
in `set_resp_body_fun/3` if this is used to write a response body directly
to the socket. This ensures that the response headers are set correctly.<a name="url-1"></a>

###url/1##


<pre>url(Req) -&gt; {binary(), Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>



Return the full request URL as a binary.

The URL includes the scheme, host, port, path, query string and fragment.<a name="version-1"></a>

###version/1##


<pre>version(Req) -> {<a href="cowboy_http.md#type-version">cowboy_http:version()</a>, Req}</pre>
<ul class="definitions"><li><pre>Req = <a href="#type-req">req()</a></pre></li></ul>

Return the HTTP version used for the request.
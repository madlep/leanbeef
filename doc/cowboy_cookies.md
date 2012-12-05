

#Module cowboy_cookies#
* [Description](#description)
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)


HTTP Cookie parsing and generating (RFC 2965).


<a name="types"></a>

##Data Types##




###<a name="type-cookie_option">cookie_option()</a>##



<pre>cookie_option() = {max_age, integer()} | {local_time, <a href="calendar.md#type-datetime">calendar:datetime()</a>} | {domain, binary()} | {path, binary()} | {secure, true | false} | {http_only, true | false}</pre>



###<a name="type-kv">kv()</a>##



<pre>kv() = {Name::binary(), Value::binary()}</pre>



###<a name="type-kvlist">kvlist()</a>##



<pre>kvlist() = [<a href="#type-kv">kv()</a>]</pre>
<a name="index"></a>

##Function Index##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#cookie-2">cookie/2</a></td><td>Equivalent to <a href="#cookie-3"><tt>cookie(Key, Value, [])</tt></a>.</td></tr><tr><td valign="top"><a href="#cookie-3">cookie/3</a></td><td>Generate a Set-Cookie header field tuple.</td></tr><tr><td valign="top"><a href="#parse_cookie-1">parse_cookie/1</a></td><td>Parse the contents of a Cookie header field, ignoring cookie
attributes, and return a simple property list.</td></tr></table>


<a name="functions"></a>

##Function Details##

<a name="cookie-2"></a>

###cookie/2##


<pre>cookie(Key::binary(), Value::binary()) -> <a href="#type-kv">kv()</a></pre>
<br></br>


Equivalent to [`cookie(Key, Value, [])`](#cookie-3).<a name="cookie-3"></a>

###cookie/3##


<pre>cookie(Key::binary(), Value::binary(), Options::[<a href="#type-cookie_option">cookie_option()</a>]) -> <a href="#type-kv">kv()</a></pre>
<br></br>


Generate a Set-Cookie header field tuple.<a name="parse_cookie-1"></a>

###parse_cookie/1##


<pre>parse_cookie(Cookie::binary()) -> <a href="#type-kvlist">kvlist()</a></pre>
<br></br>


Parse the contents of a Cookie header field, ignoring cookie
attributes, and return a simple property list.
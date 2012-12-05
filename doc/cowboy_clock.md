

#Module cowboy_clock#
* [Description](#description)
* [Function Index](#index)
* [Function Details](#functions)


Date and time related functions.

__Behaviours:__ [`gen_server`](gen_server.md).<a name="description"></a>

##Description##


While a gen_server process runs in the background to update
the cache of formatted dates every second, all API calls are
local and directly read from the ETS cache table, providing
fast time and date computations.<a name="index"></a>

##Function Index##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#rfc1123-0">rfc1123/0</a></td><td>Return the current date and time formatted according to RFC-1123.</td></tr><tr><td valign="top"><a href="#rfc1123-1">rfc1123/1</a></td><td>Return the given date and time formatted according to RFC-1123.</td></tr><tr><td valign="top"><a href="#rfc2109-1">rfc2109/1</a></td><td>Return the current date and time formatted according to RFC-2109.</td></tr></table>


<a name="functions"></a>

##Function Details##

<a name="rfc1123-0"></a>

###rfc1123/0##


<pre>rfc1123() -&gt; binary()</pre>
<br></br>


Return the current date and time formatted according to RFC-1123.<a name="rfc1123-1"></a>

###rfc1123/1##


<pre>rfc1123(DateTime::<a href="calendar.md#type-datetime">calendar:datetime()</a>) -> binary()</pre>
<br></br>


Return the given date and time formatted according to RFC-1123.<a name="rfc2109-1"></a>

###rfc2109/1##


<pre>rfc2109(LocalTime::<a href="calendar.md#type-datetime">calendar:datetime()</a>) -> binary()</pre>
<br></br>




Return the current date and time formatted according to RFC-2109.

This format is used in the _set-cookie_ header sent with
HTTP responses.
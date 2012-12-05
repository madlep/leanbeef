

#Module cowboy_http#
* [Description](#description)
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)


Core HTTP parsing API.


<a name="types"></a>

##Data Types##




###<a name="type-headers">headers()</a>##



<pre>headers() = [{binary(), iodata()}]</pre>



###<a name="type-status">status()</a>##



<pre>status() = non_neg_integer() | binary()</pre>



###<a name="type-version">version()</a>##



<pre>version() = {Major::non_neg_integer(), Minor::non_neg_integer()}</pre>
<a name="index"></a>

##Function Index##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#asctime_date-1">asctime_date/1</a></td><td>Parse an asctime date.</td></tr><tr><td valign="top"><a href="#ce_identity-1">ce_identity/1</a></td><td>Decode an identity content.</td></tr><tr><td valign="top"><a href="#conneg-2">conneg/2</a></td><td>Parse a conneg header (Accept-Charset, Accept-Encoding),
followed by an optional quality value.</td></tr><tr><td valign="top"><a href="#content_type-1">content_type/1</a></td><td>Parse a content type.</td></tr><tr><td valign="top"><a href="#digits-1">digits/1</a></td><td>Parse a list of digits as a non negative integer.</td></tr><tr><td valign="top"><a href="#entity_tag_match-1">entity_tag_match/1</a></td><td>Parse either a list of entity tags or a "*".</td></tr><tr><td valign="top"><a href="#expectation-2">expectation/2</a></td><td>Parse an expectation.</td></tr><tr><td valign="top"><a href="#http_date-1">http_date/1</a></td><td>Parse an HTTP date (RFC1123, RFC850 or asctime date).</td></tr><tr><td valign="top"><a href="#language_range-2">language_range/2</a></td><td>Parse a language range, followed by an optional quality value.</td></tr><tr><td valign="top"><a href="#list-2">list/2</a></td><td>Parse a list of the given type.</td></tr><tr><td valign="top"><a href="#media_range-2">media_range/2</a></td><td>Parse a media range.</td></tr><tr><td valign="top"><a href="#nonempty_list-2">nonempty_list/2</a></td><td>Parse a non-empty list of the given type.</td></tr><tr><td valign="top"><a href="#params-2">params/2</a></td><td>Parse a list of parameters (a=b;c=d).</td></tr><tr><td valign="top"><a href="#quoted_string-2">quoted_string/2</a></td><td>Parse a quoted string.</td></tr><tr><td valign="top"><a href="#rfc1123_date-1">rfc1123_date/1</a></td><td>Parse an RFC1123 date.</td></tr><tr><td valign="top"><a href="#rfc850_date-1">rfc850_date/1</a></td><td>Parse an RFC850 date.</td></tr><tr><td valign="top"><a href="#te_chunked-2">te_chunked/2</a></td><td>Decode a stream of chunks.</td></tr><tr><td valign="top"><a href="#te_identity-2">te_identity/2</a></td><td>Decode an identity stream.</td></tr><tr><td valign="top"><a href="#token-2">token/2</a></td><td>Parse a token.</td></tr><tr><td valign="top"><a href="#token_ci-2">token_ci/2</a></td><td>Parse a case-insensitive token.</td></tr><tr><td valign="top"><a href="#urldecode-1">urldecode/1</a></td><td>Decode a URL encoded binary.</td></tr><tr><td valign="top"><a href="#urldecode-2">urldecode/2</a></td><td>Decode a URL encoded binary.</td></tr><tr><td valign="top"><a href="#urlencode-1">urlencode/1</a></td><td>URL encode a string binary.</td></tr><tr><td valign="top"><a href="#urlencode-2">urlencode/2</a></td><td>URL encode a string binary.</td></tr><tr><td valign="top"><a href="#version_to_binary-1">version_to_binary/1</a></td><td>Convert an HTTP version tuple to its binary form.</td></tr><tr><td valign="top"><a href="#whitespace-2">whitespace/2</a></td><td>Skip whitespace.</td></tr><tr><td valign="top"><a href="#x_www_form_urlencoded-1">x_www_form_urlencoded/1</a></td><td></td></tr></table>


<a name="functions"></a>

##Function Details##

<a name="asctime_date-1"></a>

###asctime_date/1##


<pre>asctime_date(Data::binary()) -&gt; any()</pre>
<br></br>


Parse an asctime date.<a name="ce_identity-1"></a>

###ce_identity/1##


<pre>ce_identity(Data::binary()) -&gt; {ok, binary()}</pre>
<br></br>


Decode an identity content.<a name="conneg-2"></a>

###conneg/2##


<pre>conneg(Data::binary(), Fun::function()) -&gt; any()</pre>
<br></br>


Parse a conneg header (Accept-Charset, Accept-Encoding),
followed by an optional quality value.<a name="content_type-1"></a>

###content_type/1##


<pre>content_type(Data::binary()) -&gt; any()</pre>
<br></br>


Parse a content type.<a name="digits-1"></a>

###digits/1##


<pre>digits(Data::binary()) -&gt; non_neg_integer() | {error, badarg}</pre>
<br></br>


Parse a list of digits as a non negative integer.<a name="entity_tag_match-1"></a>

###entity_tag_match/1##


<pre>entity_tag_match(Data::binary()) -&gt; any()</pre>
<br></br>


Parse either a list of entity tags or a "*".<a name="expectation-2"></a>

###expectation/2##


<pre>expectation(Data::binary(), Fun::function()) -&gt; any()</pre>
<br></br>


Parse an expectation.<a name="http_date-1"></a>

###http_date/1##


<pre>http_date(Data::binary()) -&gt; any()</pre>
<br></br>


Parse an HTTP date (RFC1123, RFC850 or asctime date).<a name="language_range-2"></a>

###language_range/2##


<pre>language_range(Data::binary(), Fun::function()) -&gt; any()</pre>
<br></br>


Parse a language range, followed by an optional quality value.<a name="list-2"></a>

###list/2##


<pre>list(Data::binary(), Fun::function()) -&gt; list() | {error, badarg}</pre>
<br></br>


Parse a list of the given type.<a name="media_range-2"></a>

###media_range/2##


<pre>media_range(Data::binary(), Fun::function()) -&gt; any()</pre>
<br></br>


Parse a media range.<a name="nonempty_list-2"></a>

###nonempty_list/2##


<pre>nonempty_list(Data::binary(), Fun::function()) -&gt; [any(), ...] | {error, badarg}</pre>
<br></br>


Parse a non-empty list of the given type.<a name="params-2"></a>

###params/2##


<pre>params(Data::binary(), Fun::function()) -&gt; any()</pre>
<br></br>


Parse a list of parameters (a=b;c=d).<a name="quoted_string-2"></a>

###quoted_string/2##


<pre>quoted_string(X1::binary(), Fun::function()) -&gt; any()</pre>
<br></br>


Parse a quoted string.<a name="rfc1123_date-1"></a>

###rfc1123_date/1##


<pre>rfc1123_date(Data::binary()) -&gt; any()</pre>
<br></br>


Parse an RFC1123 date.<a name="rfc850_date-1"></a>

###rfc850_date/1##


<pre>rfc850_date(Data::binary()) -&gt; any()</pre>
<br></br>


Parse an RFC850 date.<a name="te_chunked-2"></a>

###te_chunked/2##


<pre>te_chunked(Data::binary(), X2::{non_neg_integer(), non_neg_integer()}) -&gt; more | {ok, binary(), {non_neg_integer(), non_neg_integer()}} | {ok, binary(), binary(), {non_neg_integer(), non_neg_integer()}} | {done, non_neg_integer(), binary()} | {error, badarg}</pre>
<br></br>


Decode a stream of chunks.<a name="te_identity-2"></a>

###te_identity/2##


<pre>te_identity(Data::binary(), X2::{non_neg_integer(), non_neg_integer()}) -&gt; {ok, binary(), {non_neg_integer(), non_neg_integer()}} | {done, binary(), non_neg_integer(), binary()}</pre>
<br></br>


Decode an identity stream.<a name="token-2"></a>

###token/2##


<pre>token(Data::binary(), Fun::function()) -&gt; any()</pre>
<br></br>


Parse a token.<a name="token_ci-2"></a>

###token_ci/2##


<pre>token_ci(Data::binary(), Fun::function()) -&gt; any()</pre>
<br></br>




Parse a case-insensitive token.

Changes all characters to lowercase.<a name="urldecode-1"></a>

###urldecode/1##


<pre>urldecode(Bin::binary()) -&gt; binary()</pre>
<br></br>


Equivalent to [`urldecode(Bin, crash)`](#urldecode-2).

Decode a URL encoded binary.<a name="urldecode-2"></a>

###urldecode/2##


<pre>urldecode(Bin::binary(), OnError::crash | skip) -&gt; binary()</pre>
<br></br>


Decode a URL encoded binary.
The second argument specifies how to handle percent characters that are not
followed by two valid hex characters. Use `skip` to ignore such errors,
if `crash` is used the function will fail with the reason `badarg`.<a name="urlencode-1"></a>

###urlencode/1##


<pre>urlencode(Bin::binary()) -&gt; binary()</pre>
<br></br>


Equivalent to [`urlencode(Bin, [])`](#urlencode-2).

URL encode a string binary.<a name="urlencode-2"></a>

###urlencode/2##


<pre>urlencode(Bin::binary(), Opts::[noplus | upper]) -&gt; binary()</pre>
<br></br>


URL encode a string binary.
The `noplus` option disables the default behaviour of quoting space
characters, `\s`, as `+`. The `upper` option overrides the default behaviour
of writing hex numbers using lowecase letters to using uppercase letters
instead.<a name="version_to_binary-1"></a>

###version_to_binary/1##


<pre>version_to_binary(X1::<a href="#type-version">version()</a>) -> binary()</pre>
<br></br>


Convert an HTTP version tuple to its binary form.<a name="whitespace-2"></a>

###whitespace/2##


<pre>whitespace(Data::binary(), Fun::function()) -&gt; any()</pre>
<br></br>


Skip whitespace.<a name="x_www_form_urlencoded-1"></a>

###x_www_form_urlencoded/1##


<pre>x_www_form_urlencoded(Qs::binary()) -&gt; [{binary(), binary() | true}]</pre>
<br></br>



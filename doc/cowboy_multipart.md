

#Module cowboy_multipart#
* [Description](#description)
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)


Multipart parser.


<a name="types"></a>

##Data Types##




###<a name="type-body_cont">body_cont()</a>##



<pre>body_cont() = <a href="#type-cont">cont</a>(<a href="#type-more">more</a>(<a href="#type-body_result">body_result()</a>))</pre>



###<a name="type-body_result">body_result()</a>##



<pre>body_result() = {body, binary(), <a href="#type-body_cont">body_cont()</a>} | <a href="#type-end_of_part">end_of_part()</a></pre>



###<a name="type-cont">cont()</a>##



<pre>cont(T) = fun(() -&gt; T)</pre>



###<a name="type-disposition">disposition()</a>##



<pre>disposition() = {binary(), [{binary(), binary()}]}</pre>



###<a name="type-end_of_part">end_of_part()</a>##



<pre>end_of_part() = {end_of_part, <a href="#type-cont">cont</a>(<a href="#type-more">more</a>(<a href="#type-part_result">part_result()</a>))}</pre>



###<a name="type-headers">headers()</a>##



<pre>headers() = {headers, <a href="#type-http_headers">http_headers()</a>, <a href="#type-body_cont">body_cont()</a>}</pre>



###<a name="type-http_headers">http_headers()</a>##



<pre>http_headers() = [{binary(), binary()}]</pre>



###<a name="type-more">more()</a>##



<pre>more(T) = T | {more, <a href="#type-parser">parser</a>(T)}</pre>



###<a name="type-parser">parser()</a>##



<pre>parser(T) = fun((binary()) -&gt; T)</pre>



###<a name="type-part_parser">part_parser()</a>##



<pre>part_parser() = <a href="#type-parser">parser</a>(<a href="#type-more">more</a>(<a href="#type-part_result">part_result()</a>))</pre>



###<a name="type-part_result">part_result()</a>##



<pre>part_result() = <a href="#type-headers">headers()</a> | eof</pre>
<a name="index"></a>

##Function Index##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#content_disposition-1">content_disposition/1</a></td><td>Parse a content disposition.</td></tr><tr><td valign="top"><a href="#parser-1">parser/1</a></td><td>Return a multipart parser for the given boundary.</td></tr></table>


<a name="functions"></a>

##Function Details##

<a name="content_disposition-1"></a>

###content_disposition/1##


<pre>content_disposition(Data::binary()) -> <a href="#type-disposition">disposition()</a></pre>
<br></br>


Parse a content disposition.<a name="parser-1"></a>

###parser/1##


<pre>parser(Boundary::binary()) -> <a href="#type-part_parser">part_parser()</a></pre>
<br></br>


Return a multipart parser for the given boundary.
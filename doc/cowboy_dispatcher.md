

#Module cowboy_dispatcher#
* [Description](#description)
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)


Dispatch requests according to a hostname and path.


<a name="types"></a>

##Data Types##




###<a name="type-bindings">bindings()</a>##



<pre>bindings() = [{atom(), binary()}]</pre>



###<a name="type-dispatch_path">dispatch_path()</a>##



<pre>dispatch_path() = [{<a href="#type-match_rule">match_rule()</a>, module(), any()}]</pre>



###<a name="type-dispatch_rule">dispatch_rule()</a>##



<pre>dispatch_rule() = {Host::<a href="#type-match_rule">match_rule()</a>, Path::<a href="#type-dispatch_path">dispatch_path()</a>}</pre>



###<a name="type-dispatch_rules">dispatch_rules()</a>##



<pre>dispatch_rules() = [<a href="#type-dispatch_rule">dispatch_rule()</a>]</pre>



###<a name="type-match_rule">match_rule()</a>##



<pre>match_rule() = '_' | &lt;&lt;_:8&gt;&gt; | [binary() | '_' | '...' | atom()]</pre>



###<a name="type-tokens">tokens()</a>##



<pre>tokens() = [binary()]</pre>
<a name="index"></a>

##Function Index##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#match-3">match/3</a></td><td>Match hostname tokens and path tokens against dispatch rules.</td></tr></table>


<a name="functions"></a>

##Function Details##

<a name="match-3"></a>

###match/3##


<pre>match(Tail::<a href="#type-dispatch_rules">dispatch_rules()</a>, Host::binary() | <a href="#type-tokens">tokens()</a>, Path::binary()) -> {ok, module(), any(), <a href="#type-bindings">bindings()</a>, HostInfo::undefined | <a href="#type-tokens">tokens()</a>, PathInfo::undefined | <a href="#type-tokens">tokens()</a>} | {error, notfound, host} | {error, notfound, path} | {error, badrequest, path}</pre>
<br></br>




Match hostname tokens and path tokens against dispatch rules.



It is typically used for matching tokens for the hostname and path of
the request against a global dispatch rule for your listener.



Dispatch rules are a list of _{Hostname, PathRules}_ tuples, with
_PathRules_ being a list of _{Path, HandlerMod, HandlerOpts}_.



_Hostname_ and _Path_ are match rules and can be either the
atom _'_'_, which matches everything, `<<"*">>`, which match the
wildcard path, or a list of tokens.



Each token can be either a binary, the atom _'_'_,
the atom '...' or a named atom. A binary token must match exactly,
_'_'_ matches everything for a single token, _'...'_ matches
everything for the rest of the tokens and a named atom will bind the
corresponding token value and return it.



The list of hostname tokens is reversed before matching. For example, if
we were to match "www.ninenines.eu", we would first match "eu", then
"ninenines", then "www". This means that in the context of hostnames,
the _'...'_ atom matches properly the lower levels of the domain
as would be expected.

When a result is found, this function will return the handler module and
options found in the dispatch list, a key-value list of bindings and
the tokens that were matched by the _'...'_ atom for both the
hostname and path.
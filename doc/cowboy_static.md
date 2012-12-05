

#Module cowboy_static#
* [Description](#description)


Static resource handler.

<a name="description"></a>

##Description##




This built in HTTP handler provides a simple file serving capability for
cowboy applications. It should be considered an experimental feature because
of it's dependency on the experimental REST handler. It's recommended to be
used for small or temporary environments where it is not preferrable to set
up a second server just to serve files.



If this handler is used the Erlang node running the cowboy application must
be configured to use an async thread pool. This is configured by adding the
`+A $POOL_SIZE` argument to the `erl` command used to start the node. See
[
this reply](http://erlang.org/pipermail/erlang-bugs/2012-January/002720.md) from the OTP team to erlang-bugs



###<a name="Base_configuration">Base configuration</a>##




The handler must be configured with a request path prefix to serve files
under and the path to a directory to read files from. The request path prefix
is defined in the path pattern of the cowboy dispatch rule for the handler.
The request path pattern must end with a `...` token.
The directory path can be set to either an absolute or relative path in the
form of a list or binary string representation of a file system path. A list
of binary path segments, as is used throughout cowboy, is also a valid
directory path.



The directory path can also be set to a relative path within the `priv/`
directory of an application. This is configured by setting the value of the
directory option to a tuple of the form `{priv_dir, Application, Relpath}`.


<h5><a name="Examples">Examples</a></h5>

<pre>  %% Serve files from /var/www/ under http://example.com/static/
  {[<<"static">>, '...'], cowboy_static,
      [{directory, "/var/www"}]}
  %% Serve files from the current working directory under http://example.com/static/
  {[<<"static">>, '...'], cowboy_static,
      [{directory, <<"./">>}]}
  %% Serve files from cowboy/priv/www under http://example.com/
  {['...'], cowboy_static,
      [{directory, {priv_dir, cowboy, [<<"www">>]}}]}</pre>



###<a name="Content_type_configuration">Content type configuration</a>##




By default the content type of all static resources will be set to
`application/octet-stream`. This can be overriden by supplying a list
of filename extension to mimetypes pairs in the `mimetypes` option.
The filename extension should be a binary string including the leading dot.
The mimetypes must be of a type that the `cowboy_rest` protocol can
handle.



The [spawngrid/mimetypes](https://github.com/spawngrid/mimetypes)
application, or an arbitrary function accepting the path to the file being
served, can also be used to generate the list of content types for a static
file resource. The function used must accept an additional argument after
the file path argument.


<h5><a name="Example">Example</a></h5>

<pre>  %% Use a static list of content types.
  {[<<"static">>, '...'], cowboy_static,
      [{directory, {priv_dir, cowboy, []}},
       {mimetypes, [
           {<<".css">>, [<<"text/css">>]},
           {<<".js">>, [<<"application/javascript">>]}]}]}
  %% Use the default database in the mimetypes application.
  {[<<"static">>, '...'], cowboy_static,
      [{directory, {priv_dir, cowboy, []}},
       {mimetypes, {fun mimetypes:path_to_mimes/2, default}}]}</pre>



###<a name="ETag_Header_Function">ETag Header Function</a>##




The default behaviour of the static file handler is to not generate ETag
headers. This is because generating ETag headers based on file metadata
causes different servers in a cluster to generate different ETag values for
the same file unless the metadata is also synced. Generating strong ETags
based on the contents of a file is currently out of scope for this module.



The default behaviour can be overridden to generate an ETag header based on
a combination of the file path, file size, inode and mtime values. If the
option value is a non-empty list of attribute names tagged with `attributes`
a hex encoded checksum of each attribute specified is included in the value
of the the ETag header. If the list of attribute names is empty no ETag
header is generated.



If a strong ETag is required a user defined function for generating the
header value can be supplied. The function must accept a proplist of the
file attributes as the first argument and a second argument containing any
additional data that the function requires. The function must return a term
of the type `{weak | strong, binary()}` or `undefined`.


<h5><a name="Examples">Examples</a></h5>

<pre>  %% A value of default is equal to not specifying the option.
  {[<<"static">>, '...'], cowboy_static,
      [{directory, {priv_dir, cowboy, []}},
       {etag, default}]}
  %% Use all avaliable ETag function arguments to generate a header value.
  {[<<"static">>, '...'], cowboy_static,
      [{directory, {priv_dir, cowboy, []}},
       {etag, {attributes, [filepath, filesize, inode, mtime]}}]}
  %% Use a user defined function to generate a strong ETag header value.
  {[<<"static">>, '...'], cowboy_static,
      [{directory, {priv_dir, cowboy, []}},
       {etag, {fun generate_strong_etag/2, strong_etag_extra}}]}
  generate_strong_etag(Arguments, strong_etag_extra) ->
      {_, Filepath} = lists:keyfind(filepath, 1, Arguments),
      {_, _Filesize} = lists:keyfind(filesize, 1, Arguments),
      {_, _INode} = lists:keyfind(inode, 1, Arguments),
      {_, _Modified} = lists:keyfind(mtime, 1, Arguments),
      ChecksumCommand = lists:flatten(io_lib:format("sha1sum ~s", [Filepath])),
      [Checksum|_] = string:tokens(os:cmd(ChecksumCommand), " "),
      {strong, iolist_to_binary(Checksum)}.</pre>



###<a name="File_configuration">File configuration</a>##




If the file system path being served does not share a common suffix with
the request path it is possible to override the file path using the `file`
option. The value of this option is expected to be a relative path within
the static file directory specified using the `directory` option.
The path must be in the form of a list or binary string representation of a
file system path. A list of binary path segments, as is used throughout
cowboy, is also a valid.



When the `file` option is used the same file will be served for all requests
matching the cowboy dispatch fule for the handler. It is not necessary to
end the request path pattern with a `...` token because the request path
will not be used to determine which file to serve from the static directory.



####<a name="Examples">Examples</a>##


<pre>  %% Serve cowboy/priv/www/index.html as http://example.com/
  {[], cowboy_static,
      [{directory, {priv_dir, cowboy, [<<"www">>]}}
       {file, <<"index.html">>}]}
  %% Serve cowboy/priv/www/page.html under http://example.com/*/page
  {['_', <<"page">>], cowboy_static,
      [{directory, {priv_dir, cowboy, [<<"www">>]}}
       {file, <<"page.html">>}]}.
  %% Always serve cowboy/priv/www/other.html under http://example.com/other
  {[<<"other">>, '...'], cowboy_static,
      [{directory, {priv_dir, cowboy, [<<"www">>]}}
       {file, "other.html"}]}</pre>
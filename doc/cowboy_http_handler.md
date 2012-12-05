

#Module cowboy_http_handler#
* [Description](#description)


Behaviour for short-lived HTTP handlers.

__This module defines the `cowboy_http_handler` behaviour.__
<br></br>
 Required callback functions: `init/3`, `handle/2`, `terminate/2`.<a name="description"></a>

##Description##




_init/3_ allows you to initialize a state for all subsequent
callbacks, and indicate to Cowboy whether you accept to handle the
request or want to shutdown without handling it, in which case the
_handle/2_ call will simply be skipped.



_handle/2_ allows you to handle the request. It receives the
state previously defined.



_terminate/2_ allows you to clean up. It receives the state
previously defined.

There is no required operation to perform in any of these callbacks
other than returning the proper values. Make sure you always return
the last modified Req so that Cowboy has the up to date information
about the request.
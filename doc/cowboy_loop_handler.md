

#Module cowboy_loop_handler#
* [Description](#description)


Behaviour for long-lived HTTP handlers.

__This module defines the `cowboy_loop_handler` behaviour.__
<br></br>
 Required callback functions: `init/3`, `info/3`, `terminate/2`.<a name="description"></a>

##Description##




_init/3_ allows you to initialize a state for all subsequent
callbacks, and indicate to Cowboy whether you accept to handle the
request or want to shutdown without handling it, in which case the
receive loop and _info/3_ calls will simply be skipped.



_info/3_ allows you to handle the messages this process will
receive. It receives the message and the state previously defined.
It can decide to stop the receive loop or continue receiving.



_terminate/2_ allows you to clean up. It receives the state
previously defined.



There is no required operation to perform in any of these callbacks
other than returning the proper values. Make sure you always return
the last modified Req so that Cowboy has the up to date information
about the request.

It is recommended to use hibernate if this process is not going to
receive a lot of messages. It is also recommended to use a timeout
value so that the connection gets closed after a long period of
inactivity.
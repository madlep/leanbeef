

#Module cowboy_websocket_handler#
* [Description](#description)


Handler for HTTP WebSocket requests.

__This module defines the `cowboy_websocket_handler` behaviour.__
<br></br>
 Required callback functions: `websocket_init/3`, `websocket_handle/3`, `websocket_info/3`, `websocket_terminate/3`.<a name="description"></a>

##Description##




WebSocket handlers must implement five callbacks: _init/3_,
_websocket_init/3_, _websocket_handle/3_,
_websocket_info/3_ and _websocket_terminate/3_.
These callbacks will only be called if the connection is upgraded
to WebSocket in the HTTP handler's _init/3_ callback.
They are then called in that order, although _websocket_handle/3_
will be called for each packet received, and _websocket_info_
for each message received.



_websocket_init/3_ is meant for initialization. It receives
information about the transport and protocol used, along with the handler
options from the dispatch list. You can define a request-wide state here.
If you are going to want to compact the request, you should probably do it
here.



_websocket_handle/3_ receives the data from the socket. It can reply
something, do nothing or close the connection.



_websocket_info/3_ receives messages sent to the process. It has
the same reply format as _websocket_handle/3_ described above. Note
that unlike in a _gen_server_, when _websocket_info/3_
replies something, it is always to the socket, not to the process that
originated the message.



_websocket_terminate/3_ is meant for cleaning up. It also receives
the request and the state previously defined, along with a reason for
termination.

All of _websocket_init/3_, _websocket_handle/3_ and
_websocket_info/3_ can decide to hibernate the process by adding
an extra element to the returned tuple, containing the atom
_hibernate_. Doing so helps save memory and improve CPU usage.
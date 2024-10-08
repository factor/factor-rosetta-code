! Write two programs (or one program with two modes) which run on
! networked computers, and send some messages between them.
! 
! The protocol used may be language-specific or not, and should be
! suitable for general distributed programming; that is, the protocol
! should be generic (not designed just for the particular example
! application), readily capable of handling the independent communications
! of many different components of a single application, and the
! transferring of arbitrary data structures natural for the language.
! 
! This task is intended to demonstrate high-level communication facilities
! beyond just creating sockets.

USING: concurrency.distributed concurrency.messaging threads io.sockets io.servers ;
QUALIFIED: concurrency.messaging
: prettyprint-message ( -- ) concurrency.messaging:receive . flush prettyprint-message ;
[ prettyprint-message ] "logger" spawn dup name>> register-remote-thread
"127.0.0.1" 9000 <inet4> <node-server> start-server

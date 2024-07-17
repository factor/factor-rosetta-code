! The main goal of Aspect Oriented Programming (AOP) is to keep all the
! code relating to a single feature in one module of code.
! 
! There are a variety of ways to achieve this with object-oriented
! programming and functional programming, including inheritance,
! decorators and configuration trees.
! 
! In Aspect Oriented Programming existing code is extended with new
! behaviors invisibly, by means of stealthy instrumentation. There are
! some similarities between this concept and some debugging tools, such as
! Linux Kernel Probes. In fact, one obvious application for AOP is to add
! detailed tracing, with access to data, without touching the instrumented
! code. An aspect could be used to capture the calls to an entire API and
! log the arguments and return values.
! 
! The idea is that when the instrumented function is executes, either
! prior the execution of function, or at its point of return, or both, a
! block of code in instrumenting module is able to gain control. It can
! obtain access to the function arguments almost as if it were its own
! arguments, execute its own logic, and even decide whether or not the
! instrumented function will run at all, and with what argument values,
! and what it shall return.
! 
! Furthermore, there can be additional refinements, such as instrumenting
! calls to some function A, but only when it is directly called by
! function B. Or only when function B is somewhere in the activation
! chain, etc.
! 
! Also part of AOP is the idea of instrumenting data structures such as
! classes. An "aspect" is a hidden extension to some existing set of
! classes, which adds hidden new instance variables to the class. These
! variables are not accessible by the class itself, only by the
! instrumenting Aspect code. An object-oriented Aspect resembles a class,
! except that its instance variables are injected into another class (or
! classes!), and its methods are instrumenting hooks that capture control
! from the methods of other classes.
! 
! An Aspect Oriented Programming System provides the abstractions to make
! this happen: a way to write aspects which specify what classes and
! methods they instrument, and the code, data and activation rules for
! doing it.
! 
! AOP introduces some new terms. A "join point" is a place in the control
! flow where code is instrumented, like a function call or return. A
! "point cut" is a selection of join points according to some query, which
! are tied to a common instrumenting code. (A single instrumenting
! function can handle a large point cut of different join points.)
! 
! AOP allows for a "separation of concerns" because new features are
! introduced as aspects tied to the execution of existing code, but
! without touching any of it, thereby keeping code bases completely
! separate. For instance, a mutex locking discipline can be added to a
! class without touching any of its code. An aspect identifies the methods
! that need locking, introduces the mutex variable into every instance of
! every instrumented class, and gains control around the invocations of
! the targetted methods to manage the mutex. Without AOP, the concern for
! locking is spread everywhere. Mutex lock/unlock calls have to be written
! or at the very least, methods have to be declared as synchronized, and
! this is repeated in every class that requires locking.
! 
! Task
! 
! The task is to describe or show how, or to what extent, a given
! programming language implements, or is able to implement or simulate,
! Aspect Oriented Programming.



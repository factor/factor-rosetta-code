! Task:
! 
! Write a function to send an email.
! 
! The function should have parameters for setting From, To and Cc
! addresses; the Subject, and the message text, and optionally fields for
! the server name and login details.
! 
! -   If appropriate, explain what notifications of problems/success are
!     given.
! -   Solutions using libraries or functions from the language are
!     preferred, but failing that, external programs can be used with an
!     explanation.
! -   Note how portable the solution given is between operating systems
!     when multi-OS languages are used.
! 
! (Remember to obfuscate any sensitive data used in examples)

 
USING: accessors io.sockets locals namespaces smtp ;
IN: scratchpad
:: send-mail ( f t c s b -- )
    default-smtp-config "smtp.gmail.com" 587 <inet> >>server
    t >>tls?
    "my.gmail.address@gmail.com" "qwertyuiasdfghjk" <plain-auth>
    >>auth \ smtp-config set-global <email> f >>from t >>to
    c >>cc s >>subject b >>body send-email ;

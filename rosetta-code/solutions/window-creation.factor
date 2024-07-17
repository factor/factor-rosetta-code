! Display a GUI window. The window need not have any contents, but should
! respond to requests to be closed.

USING: ui ui.gadgets.labels ;

"This is a window..." <label> "Really?" open-window

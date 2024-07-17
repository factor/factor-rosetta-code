! Introduction:
! 
! When formatting a page for display, Mediawiki allows the page to include
! bold and italic text by placing the bold/italic text within paired
! repeated-single quote characters - 3 single quotes for bold and 2 for
! italic, 5 for bold italic.
! 
! E.g.: '''bold-word''' and ''italic-word'' appears as bold-word and
! italic-word.
! 
! This could be used to provide simple syntax-highlighting without the use
! of the relatively more expensive <syntaxhighlight> tags or for languages
! not currently supported by Pygments. A few languages on Rosetta Code are
! currently using schemes like this.
! 
! Task:
! 
! The task is to write a syntax highlighter that given a source in your
! language will output a wiki formatted version of the source with the
! keywords/reserved words in bold and the comments in italics.
! 
! Note that each source line (including blank lines) should be output with
! a leading space, to ensure the source is treated as a single block.
! 
! Additionally, translate the following characters:
! 
! -   single-quote (') to &apos;
! -   ampersand (&) to &amp;
! -   less-than (<) to &lt;
! -   greater-than (>) to &gt;
! 
! If your language doesn't have keywords/reserved words or comments, use
! your judgement on what to highlight in bold or italic : )
! 
! Presenting your source:
! 
! Instead of showing your source within syntaxhighlight tags and having a
! separate output block, just show the source that would be output from
! your program when given its own source to process.
! 
! I.e., don't use syntaxhighlight tags.
! 
! See also:
! 
! https://www.mediawiki.org/wiki/Help:Formatting



! Task
! 
! Optical Character Recognition (OCR) engines excel at converting
! pixel-based documents into editable text strings. However, standard text
! recognition pipelines naturally prioritize visual glyphs and often
! condense or omit structural whitespace layout elements. A common
! programmatic challenge arises when attempting to accurately reconstruct
! the original format of a document—specifically, identifying structural
! line breaks (blank lines or consecutive linefeeds) that separate
! distinct sections, paragraphs, or stanzas.
! 
! The goal of this task is to utilize an OCR engine, a platform-native
! text framework, or localized computer vision geometric tools to process
! an image of printed text, parse its structural layout from top to
! bottom, and explicitly flag or preserve completely empty line intervals
! that contain only a linefeed (\n).
! 
! Task Requirements
! 
! Source image: Use an image containing multi-line text structured into
! paragraph or stanza blocks separated by vertical spaces (such as the
! provided sample text of Robert Frost's poem) which can be downloaded
! here: File:The Road Not Taken Or use this copy:
! 
! []
! 
! 1. Load and process the target text image using your language's
! available OCR libraries, layout parsers, or platform-native frameworks.
! 
! 2. Traverse the text content sequentially from the top of the image to
! the bottom.
! 
! 3. Detect empty lines: Implement logic to identify structural layout
! breaks where no physical characters are present. This must be achieved
! by using one of the following methodologies:
! 
! - - Inspecting native multi-line layout data or linefeed configurations
!     ("\n") natively returned by a layout string aggregator.
!   - Extracting raw bounding boxes or coordinate frames of consecutive
!     lines, measuring the vertical pixel distance between the bottom of
!     one line and the top of the next, and flagging gaps that exceed a
!     threshold proportional to the average font/line height.
! 
! 4. Output the result: Print the recognized text to the standard console.
! You must cleanly preserve the original empty line spaces between text
! blocks, or insert an explicit structural placeholder (e.g.,
! "[Blank Line / Linefeed Detected — Insert linefeed character]") exactly
! where those blank gaps occurred.
! 
! Example Output Case
! 
! Using a standardized image layout, your console stream should mirror
! structural changes similarly to this:
! 
! THE ROAD NOT TAKEN
! 
! Two roads diverged in a yellow wood,
! ...
! To where it bent in the undergrowth;
! [Blank Line / Linefeed Detected]
! Then took the other, as just as fair,
! ...



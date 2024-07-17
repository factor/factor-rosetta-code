! A template for data is an arbitrarily nested tree of integer indices.
! 
! Data payloads are given as a separate mapping, array or other simpler,
! flat, association of indices to individual items of data, and are
! strings.
! 
! The idea is to create a data structure with the templates' nesting, and
! the payload corresponding to each index appearing at the position of
! each index.
! 
! Answers using simple string replacement or regexp are to be avoided. The
! idea is to use the native, or usual implementation of lists/tuples etc
! of the language and to hierarchically traverse the template to generate
! the output.
! 
! Task Detail:
! 
! Given the following input template t and list of payloads p:
! 
!     # Square brackets are used here to denote nesting but may be changed for other,
!     # clear, visual representations of nested data appropriate to ones programming 
!     # language.
!     t = [
!         [[1, 2],
!          [3, 4, 1], 
!          5]]
! 
!     p = 'Payload#0' ... 'Payload#6'
! 
! The correct output should have the following structure, (although
! spacing and linefeeds may differ, the nesting and order should follow):
! 
!     [[['Payload#1', 'Payload#2'],
!       ['Payload#3', 'Payload#4', 'Payload#1'],
!       'Payload#5']]
! 
! 1. Generate the output for the above template, t.
! 
! Optional Extended tasks:
! 
! 2. Show which payloads remain unused.
! 
! 3. Give some indication/handling of indices without a payload.
! 
! Show output on this page.

USING: formatting kernel literals math sequences sequences.deep ;
IN: rosetta-code.nested-template-data

CONSTANT: payloads $[ 7 <iota> [ "Payload#%d" sprintf ] map ]

: insert-payloads ( template -- data-structure )
    [ dup fixnum? [ payloads ?nth ] when ] deep-map ;
    
{ { { 1 2 }
    { 3 4 1 }
    5 } }
    
{ { { 1 2 }
    { 10 4 1 }
    5 } }
    
[ dup insert-payloads "Template: %u\nData Structure: %u\n"
printf ] bi@

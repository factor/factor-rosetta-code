! Task:
! 
! Provide code that produces a list of numbers which is the n^(th) order
! forward difference, given a non-negative integer (specifying the order)
! and a list of numbers.
! 
! The first-order forward difference of a list of numbers A is a new list
! B, where B_(n) = A_(n+1) - A_(n).
! 
! List B should have one fewer element as a result.
! 
! The second-order forward difference of A will be:
! 
!     tdefmodule Diff do
!         def forward(arr,i\\1) do
!             forward(arr,[],i)
!         end
! 
!         def forward([_|[]],diffs,i) do
!             if i == 1 do
!                 IO.inspect diffs
!             else 
!                 forward(diffs,[],i-1)
!             end
!         end
! 
!         def forward([val1|[val2|vals]],diffs,i) do
!             forward([val2|vals],diffs++[val2-val1],i) 
!         end
!     end 
! 
! The same as the first-order forward difference of B.
! 
! That new list will have two fewer elements than A and one less than B.
! 
! The goal of this task is to repeat this process up to the desired order.
! 
! For a more formal description, see the related Mathworld article.
! 
! Algorithmic options:
! 
! -   Iterate through all previous forward differences and re-calculate a
!     new array each time.
! -   Use this formula (from Wikipedia):
! 
!     
! 
!         $\Delta^n [f](x)= \sum_{k=0}^n {n \choose k} (-1)^{n-k} f(x+k)$
! 
!     
! 
!         (Pascal's Triangle may be useful for this option.)

USING: kernel math math.vectors sequences ;
IN: rosetacode

: 1-order ( seq -- seq' )
    [ rest-slice ] keep v- ;

: n-order ( seq n -- seq' )
    dup 0 <=
    [ drop ] [ [ 1-order ] times ] if ;


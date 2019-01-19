module prn

implicit none

!rp: real precision ip:integer precision
integer,parameter :: rp=kind(1.0)
integer,parameter :: ip=kind(1)
!a, c and m can be arbitrarily adjusted
integer(ip),parameter :: a=1741 ,c=2731,m=12906

contains

!This function receives and returns one integer  
function linear_congr(j)
    
    implicit none
    integer(ip), intent(inout) :: j
    integer(ip) :: linear_congr
    
    linear_congr = mod(a*j+c, m)           
    
end function linear_congr


!Similar to linear_congr but returns numbers in the interval [0, 1)
function cong01(j)
    
implicit none
integer(ip),intent(inout)::j
real(rp)::cong01                            

cong01 = real(mod(a*j+c,m),rp)/real(m,rp)
    
end function cong01
    
end module prn

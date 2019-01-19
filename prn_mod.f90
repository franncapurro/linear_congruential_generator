module prn

implicit none

!rp: real precision ip:integer precision
integer, parameter :: rp=kind(1.0)
integer, parameter :: ip=kind(1)
!a, c and m can be arbitrarily adjusted
integer(ip), parameter :: a = 1741, c = 2731, m = 12906
!m_sch and m_sch are similar variables to m and a, but used in Schrage's algorithm
integer(ip), parameter :: m_sch = 12906, a_sch = 1741, r = 2836, q = int(m_sch/a_sch, ip)

contains

!This function receives and returns one integer  
function linear_congr(j)
    
    implicit none
    integer(ip), intent(inout) :: j
    integer(ip) :: linear_congr
    
    linear_congr = mod(a*j+c, m)           
    
end function linear_congr


!Schrage's algorithm. This function receives and returns one integer.
function gnpa(idum)
    
    implicit none

    integer(ip), intent(inout) :: idum
    integer(ip) :: gnpa
    integer(ip) :: k, d
    
    k = int(idum/q, ip)
    d = a_sch*(idum-k*q) - r*k
    if(d<0)then
        gnpa = d + m_sch
    else
        gnpa = d
    end if
    
end function gnpa
    
end module prn

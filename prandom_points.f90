program prandom_points

use prn

implicit none

!di is an auxiliary variable
integer(ip) :: seed, di
integer(ip)i
!r0 and r1 are auxiliary variables
real(rp) :: r0,r1
!array used to make tuples (x,y)
real(rp),dimension(:),allocatable :: r
!This is about formating
character*10000 :: string=''
character*10000 :: formating
integer(ip) :: aux1, aux2


write(*,*)'Choose the initial seed:'
read(*,*)seed

!to generate "m" prn
open(1, file='raw_prn.dat', status='replace')
!"m" prn will be calculated, that is d0,d1,...,d(m-1)
do i = 0, m-1
    write(1, "(I5)")seed
    seed = linear_congr(seed)
end do
close(1)
write(*, *)'Raw pseudo-random numbers were generated and put into raw_prn.dat'
    

!"m" must be even.
!Each d0, ..., d(m-1) prn will be divided by "m" so that the prn produced will be in [0, 1).
!In the file there will be rows. Each row specifies a (x, y) tuple.
!An amount of "m/2" points (x, y) will be generated.

open(1, file='raw_prn.dat')
open(2, file='points.dat', status='replace')

do i = 0, (m-2)/2
    read(1, *)r0
    r0 = real(r0, rp) / real(m, rp)
    read(1, *)r1
    r1 = real(r1, rp) / real(m, rp)
    write(2, *)r0, r1
end do

close(2)
close(1)
write(*, *)'Pseudo-random points (x, y) were generated and put into points.dat'


end program prandom_points

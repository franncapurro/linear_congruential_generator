program prn_congr

use prn

implicit none

!seed is the number with which the sequence of prn begins
integer(ip)::seed
integer(ip)::i

write(*,*)'Choose the initial seed:'
read(*,*)seed

!An amount of "m" pseudorandom numbers will be calculated, that is d0, ..., d(m-1)
open(1, file='raw_prn.dat', status='replace')
do i = 0, m-1
    write(1, "(I5)")seed
    seed = linear_congr(seed)
end do

close(1)

write(*, *)'Raw pseudo-random numbers were generated and put into raw_prn.dat'

end program prn_congr

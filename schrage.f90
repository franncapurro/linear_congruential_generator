program schrage

use prn

implicit none

integer(ip) :: i, seed

write(*,*)'Choose the initial seed:'
read(*,*)seed

open(1, file = 'prn_sch.dat', status = 'replace')

do i = 0, m-2
    write(1,*)seed
    seed = gnpa(seed)
end do

close(1)

end program

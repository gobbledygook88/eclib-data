#!/usr/local/bin/gnuplot

# ==================================================================
#
#
#
# ==================================================================

# Output settings and format
# --------------------------

# set terminal png size 1024,684 enhanced font '../../plots/Vera.ttf,10'
# set output "tmanin-speedup.png"

set terminal postscript eps size 10.24,6.84 enhanced color font '../../plots/Vera.ttf,20'
set output "tmanin-speedup.eps"


# Labels and Axis
# ---------------

set xlabel 'Number of threads'
set ylabel 'Speedup'
set xrange [0:64]
set yrange [0:15]
set xtics 0,2,64
set key horizontal center bmargin


# Plot graphs
# -----------

plot "56885-speedup/tmanin_runtimes-56885-speedup-new.dat" using 1:3 title "Level 56885",\
     "57600-speedup/tmanin_runtimes-57600-speedup-new.dat" using 1:3 title "Level 57600",\
     "58423-speedup/tmanin_runtimes-58423-speedup-new.dat" using 1:3 title "Level 58423",\
     "59400-speedup/59400-speedup-new.dat" using 1:3 title "Level 59400",\
     "../../lehner/parallel/234446-speedup/tmanin_runtimes-234446-speedup-new.dat" using 1:3 title "Level 234446",\
     "234815-speedup/tmanin_runtimes-234815-speedup-new.dat" using 1:3 title "Level 234815" linecolor rgb "dark-grey"

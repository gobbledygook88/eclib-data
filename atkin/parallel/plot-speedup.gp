#!/usr/local/bin/gnuplot

# ==================================================================
#
#
#
# ==================================================================

# Output settings and format
# --------------------------

set terminal png size 1024,684 enhanced font '../../plots/Vera.ttf,10'
set output "tmanin-speedup.png"


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

plot "57600-speedup/tmanin_runtimes-57600-speedup-new.dat" using 1:3 title "Level 57600", "59400-speedup/59400-speedup-new.dat" using 1:3 title "Level 59400",  "234815-speedup/tmanin_runtimes-234815-speedup-new.dat" using 1:3 title "Level 234815"

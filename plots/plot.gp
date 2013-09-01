#!/usr/local/bin/gnuplot

# =============================================================
#
# plot.gp
#
# gnuplot script to plot graphs of timings.
# Call this script by passing in variable definitions. 
# 
# For example, to plot the file
#
#   tmanin_runtimes-11-30000.dat
#
# which is located in ../atkin/serial/ use the following command
# 
#   gnuplot -e "m='atkin';v='serial';min=11;max=30000;l=3200" plot.gp
#
# If plotting parallel data, the number of threads must be given
#
#   gnuplot -e "m='atkin';v='parallel';n=4;min=11;max=30000;l=3200" plot.gp
#
# That is
#   m      machine
#   v      version {serial|parallel}
#   n      number of threads (parallel only)
#   min    minimum level
#   max    maximum level
#   l      print corresponding level as label if time > l
#
# The file must exist, otherwise an error will be thrown.
#
# The resulting image, in this case, will be named
#
#   plot-atkin-serial-11-30000.png
#
# or in general,
#
#   plot-m-v-min-max.png
#
# with the corresponding values substituted in.
#
# ==============================================================

# Output settings and format
# --------------------------

# PNG
# set terminal png size 1024,684 enhanced font './Vera.ttf,10'
# fileext = ".png"

# EPS
set terminal postscript eps size 10.24,6.84 enhanced color font './Vera.ttf,20'
fileext = ".eps"

fileout = "plot-".m."-".v."-"
if( exists("n") ) fileout = fileout.n."-"
set output fileout.min."-".max.fileext


# Labels and Axis
# ---------------

# set title "tmanin runtimes for levels ".min." to ".max
set xlabel 'Level N'
set ylabel 'Time (seconds)'
# set xrange [min:max]
set yrange [0:4500]
# set logscale y
set key horizontal center bmargin

# Setup file configurations
# -----------------------------

# File location
filedir = "../".m."/".v."/"

if ( exists("n") ) filedir = filedir.n."/"

# File name
filename = "tmanin_runtimes-".min."-".max.".dat"


# Plot graphs
# -----------
# Options for plotting include: points, lines, linespoints, dots

# No-frills plot, with labels if variable l is defined
# plot filedir.filename using 1:2 with points notitle, "" using (exists("l") && $2>l ? $1 : 1/0):2:1 with labels right notitle

# Odd, even
plot filedir.filename using (int($1)%2 ? $1 : 1/0 ):2 with points title "N odd", "" using (int($1)%2 ? 1/0 : $1):2 with points title "N even" 








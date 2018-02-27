'reinit'
'open F:\data\jra55\u\r.ctl'
'open F:\data\jra55\u\test.ctl'
'set annot 1 5'
'set xlopts 1 5 0.1'
'set ylopts 1 5 0.1'
'set grads off'
'set gxout shaded'
'run C:\Users\think\Desktop\define_colors.gs'
'set clevs -0.5 -0.4 -0.3 -0.2 -0.1 -0.01 0.01 0.1 0.2 0.3 0.4 0.5 0.6 0.7'
'set ccols 46 45 44 43 42 41 0 21 22 23 24 25 26 27 28 '
'd r'
'set gxout contour'
'set cmin 0.89'
'set cstyle 1'
'set ccolor 1'
'set cthick 9'
'd t.2'
'run D:\OpenGrADS\Contents\Resources\Scripts\cbar.gs'
'printim F:\data\jra55\u\r_ttest_summer.png x1800 y900 white'


*'set gxout grid'
*'set dignum 2'
*'set gxout fgrid'
*'set fgvals 0.90 1 0.91 2 0.92 3 0.93 4 0.94 5 0.95 6'








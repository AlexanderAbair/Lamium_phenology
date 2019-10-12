# I manually made each shaded month image in powerpoint and MSpaint to fit the width of the other plots
# Each month image was iterated for the corresponding weeks
# Scaling of the images is necessary for merging month scale to density plot

for i in {01..04}
	do cp month_scale/narrow_month_scales/1.png month_scale/narrow_month_scales/month_scale_week_$i.png
	done
for i in {05..08}
	do cp month_scale/narrow_month_scales/2.png month_scale/narrow_month_scales/month_scale_week_$i.png
	done
for i in {09..13}
	do cp month_scale/narrow_month_scales/3.png month_scale/narrow_month_scales/month_scale_week_$i.png
	done
for i in {14..17}
	do cp month_scale/narrow_month_scales/4.png month_scale/narrow_month_scales/month_scale_week_$i.png
	done
for i in {18..21}
	do cp month_scale/narrow_month_scales/5.png month_scale/narrow_month_scales/month_scale_week_$i.png
	done
for i in {22..25}
	do cp month_scale/narrow_month_scales/6.png month_scale/narrow_month_scales/month_scale_week_$i.png
	done
for i in {26..30}
	do cp month_scale/narrow_month_scales/7.png month_scale/narrow_month_scales/month_scale_week_$i.png
	done
for i in {31..34}
	do cp month_scale/narrow_month_scales/8.png month_scale/narrow_month_scales/month_scale_week_$i.png
	done
for i in {35..38}
	do cp month_scale/narrow_month_scales/9.png month_scale/narrow_month_scales/month_scale_week_$i.png
	done
for i in {39..43}
	do cp month_scale/narrow_month_scales/10.png month_scale/narrow_month_scales/month_scale_week_$i.png
	done
for i in {44..47}
	do cp month_scale/narrow_month_scales/11.png month_scale/narrow_month_scales/month_scale_week_$i.png
	done
for i in {48..52}
	do cp month_scale/narrow_month_scales/12.png month_scale/narrow_month_scales/month_scale_week_$i.png
	done

for i in {01..52} ; do montage month_scale/narrow_month_scales/*week_$i* month_scale/blank_1800x100.png month_scale/blank_1800x100.png -tile 1x3 -geometry 1800x100+0+0 month_scale/300_height_scales/month_scale_week_$i.height_300.png ; done
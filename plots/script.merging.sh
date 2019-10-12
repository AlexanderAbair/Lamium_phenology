# Merging density plots with month scale

#for i in {01..52} ; do montage density*/*$i* month*/300*/*$i.height_300.png month*/blank_1800x300.png month*/blank_1800x300.png -tile 1x4 -geometry 1800x300+0+0 merging/merged_density_and_month_scale/density_with_month_scale.week_$i.png ; done

#names=$(ls merging/merged_density_and_month_scale)
#for i in $names ; do convert merging/merged_density_and_month_scale/$i -crop 1800x1134+0+0 merging/merged_density_and_month_scale_cropped/$i.cropped.png; done

for i in {01..52} ; do montage merging/title_1800x1134.png weekly_subplots/*$i.png merging/merged_density_and_month_scale_cropped/*$i.png.cropped.png -tile 1x3 -geometry 1800x1134+0+0 merging/merged_title_map_density_and_month_scale/merged_title_map_density_and_month_scale_$i.png ; done

names=$(ls merging/merged_title_map_density_and_month_scale)
for i in $names ; do convert merging/merged_title_map_density_and_month_scale/$i -crop 1800x1900+0+875 merging/merged_title_map_density_and_month_scale_cropped/$i.cropped.png; done
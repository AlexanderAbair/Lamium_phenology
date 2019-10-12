# Phenology mapping
#convert -delay 5  weekly_subplots/*png LAMAMP_weekly_phenology.delay-5.gif
#convert -delay 10 weekly_subplots/*png LAMAMP_weekly_phenology.delay-10.gif
#convert -delay 15 weekly_subplots/*png LAMAMP_weekly_phenology.delay-15.gif
#convert -delay 20 weekly_subplots/*png LAMAMP_weekly_phenology.delay-20.gif

# Phenology density
#convert -delay 5  density_subplots/*png LAMAMP_density.delay-5.gif
#convert -delay 10 density_subplots/*png LAMAMP_density.delay-10.gif
#convert -delay 15 density_subplots/*png LAMAMP_density.delay-15.gif
#convert -delay 20 density_subplots/*png LAMAMP_density.delay-20.gif

# Month scale
convert -delay 5  month_scale/300*/*png month_scale.delay-5.gif
convert -delay 10 month_scale/300*/*png month_scale.delay-10.gif
convert -delay 15 month_scale/300*/*png month_scale.delay-15.gif
convert -delay 20 month_scale/300*/*png month_scale.delay-20.gif

# Merged map, density, and month scale
#convert -delay 5  merging/merged_title_map_density_and_month_scale_cropped/*png merged.delay-5.gif
#convert -delay 10 merging/merged_title_map_density_and_month_scale_cropped/*png merged.delay-10.gif
#convert -delay 15 merging/merged_title_map_density_and_month_scale_cropped/*png merged.delay-15.gif
#convert -delay 20 merging/merged_title_map_density_and_month_scale_cropped/*png merged.delay-20.gif

for i in {01..52} ; do montage weekly*/*_$i* density*/*_$i* month*/*week*_$i* -tile 1x3 -geometry 1800x1134+0+0 testing/test_$i.png ; done

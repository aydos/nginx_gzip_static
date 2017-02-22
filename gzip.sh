#!/bin/bash
# original script : http://wiki.linuxwall.info/doku.php/en:ressources:dossiers:nginx:nginx_performance_tuning

FILETYPES=( "*.html" "*.woff" "*.css" "*.jpg" "*.jpeg" "*.gif" "*.png" "*.js" "*.ico" "*.xml" )
DIRECTORIES="/var/www/site1/ /var/www/site2/"

for currentdir in $DIRECTORIES
do
	for i in "${FILETYPES[@]}"
	do
		find $currentdir -iname "$i" -exec bash -c 'PLAINFILE={};GZIPPEDFILE={}.gz; \
			if [ `stat --printf=%s $PLAINFILE` -gt 128 ]; \
			then if [ -e $GZIPPEDFILE ]; \
				then if [ `stat --printf=%Y $PLAINFILE` -gt `stat --printf=%Y $GZIPPEDFILE` ]; \
					then echo "$GZIPPEDFILE outdated, regenerating"; \
						gzip -9 -f -c $PLAINFILE > $GZIPPEDFILE; \
					fi; \
				else echo "$GZIPPEDFILE is missing, creating it"; \
					gzip -9 -c $PLAINFILE > $GZIPPEDFILE; \
				fi; \
			fi' \;
	done
done

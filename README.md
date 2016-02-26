# nginx_gzip_static
Shell script generate static gzip files for "gzip_static on" command

I found the original script at
   http://wiki.linuxwall.info/doku.php/en:ressources:dossiers:nginx:nginx_performance_tuning

The script was not check the file size so generate larger gz files for small files. So I added file size control. It dont compress the files less then 120 bytes. 

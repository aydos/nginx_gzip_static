# nginx_gzip_static
Shell script generates static gzip files for nginx's "gzip_static on" directive.

I found the original script at
   http://wiki.linuxwall.info/doku.php/en:ressources:dossiers:nginx:nginx_performance_tuning

The script was not check the file size so generate larger gz files for small files. So I added file size control. It dont compress the files less then 120 bytes. 

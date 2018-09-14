# Script: parser_nagios_cache.sh
# Original Author: EL WAHBI Yasmine
# Created: 2015-05-12
#====================================== 
#!/bin/bash

cat '/var/nagios/objects.cache' | grep "host_name\|address\|service_description\|check_command\|icon_image" |grep -v localhost | perl -ne '$line = $_;
chomp($line);
if ($line =~ /host_name(.*)/) {
$match = $1 ;
$match =~ s/ |\t//g;
print "\n".$match."\t";
};

if ($line =~ /address(.*)/) {
$match = $1 ;
$match =~ s/ |\t//g;
print $match."\t";
}

if ($line =~ /service_description(.*)/) {
$match = $1 ;
$match =~ s/^\s+//;
$match =~ s/\t//g;
print "\t".$match."\t";
}
if ($line =~ /check_command(.*)/) {
$match = $1 ;
$match =~ s/^\s+//;
$match =~ s/\t//g;
print "\t".$match."\t";
}

if ($line =~ /icon_image(.*)/) {
$match = $1 ;
$match =~ s/ |\t//g;
print "\t". $match."\t";
}

'

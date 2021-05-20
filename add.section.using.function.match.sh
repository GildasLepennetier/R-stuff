awk '{ if( $0 ~/function/ ) { print "####" $0 "\n" $0 }else{ print $0} }'

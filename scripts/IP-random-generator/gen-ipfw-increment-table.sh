#!/bin/sh
#####################################
# WARNING: DO NOT USE this script to bench
# Table generated by incremented value are useless to be use for benching i
# because RADIX
######################################
# Generate rules to be loaded by ipfw preprocessor
# ipfw -p /etc/ipfw.preproc.rules
# Input: number of deny rule to add
set -eu

# An usefull function (from: http://code.google.com/p/sh-die/)
die() { echo -n "EXIT: " >&2; echo "$@" >&2; exit 1; }

dec2dot () {
	# converting decimal to hexa, then from 4 groups hexa to pointed decimal
	printf '%d.%d.%d.%d\n' $(printf "%x\n" $1 | sed 's/../0x& /g')
}

# Start addressing at 1.0.0.0 (in decimal to easly increment it)
ipbase=268435466

[ $# -ne 1 ] && die "usage: $0 number-of-rules"

max=$1

case $max in
    ''|*[!0-9]*) die "Not a number";;
    *) ;;
esac

[ "$max" -eq 1 ] && die "Need to be more than 1"

#We add one more allow rule at the end
max=$((max - 1))

#cat <<EOF
##!/bin/sh
#fwcmd="/sbin/ipfw"
#\${fwcmd} -f flush
#\${fwcmd} table 1 create type addr
#EOF

cat <<EOF
-f flush
table 1 create type addr
EOF

for i in $(jot $max); do
	ipdot=$( dec2dot $(( ipbase + i)) )
	#printf "\${fwcmd} table 1 add %s/32\n" $ipdot
	printf "table 1 add %s/32\n" $ipdot
done
#echo "\${fwcmd} add deny ip from table\(1\) to any"
#echo "\${fwcmd} add allow ip from any to any"
echo "add deny ip from table(1) to any"
echo "add allow ip from any to any"

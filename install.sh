#/bin/sh

EXEDIR=/usr/local/bin
MANDIR=/usr/share/man/man1
CONFDIR=/etc/default

if [ "$1" = "-u" ]
then
    # Uninstall

    rm -f $EXEDIR/smsbk $EXEDIR/smsre
    rm -f $MANDIR/smsbk.1.gz $MANDIR/smsre.1.gz
    rm -f $CONFDIR/smsbk.conf
else
    # Install

    cp ./smsbk $EXEDIR
    cp ./smsre $EXEDIR
    gzip -c ./smsbk.1 > $MANDIR/smsbk.1.gz
    gzip -c ./smsre.1 > $MANDIR/smsre.1.gz
    cp -n ./smsbk.conf $CONFDIR

    chown 0.0 $EXEDIR/smsbk $EXEDIR/smsbk $MANDIR/smsbk.1.gz $MANDIR/smsre.1.gz $CONFDIR/smsbk.conf
    chmod 755 $EXEDIR/smsbk $EXEDIR/smsbk
    chmod 644 $MANDIR/smsbk.1.gz $MANDIR/smsre.1.gz $CONFDIR/smsbk.conf
fi

exit 0

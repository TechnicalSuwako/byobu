UNAME_S != uname -s

NAME = byobu
VERSION = 5.3.2
PREFIX = /usr/local
.if ${UNAME_S} == "Linux" || ${UNAME_S} == "Illumos"
PREFIX = /usr
.endif

MANPREFIX=${PREFIX}/share/man
.if ${UNAME_S} == "OpenBSD"
MANPREFIX=${PREFIX}/man
.endif

all:
	mkdir -p ${DESTDIR}${PREFIX}/bin ${DESTDIR}${PREFIX}/lib ${DESTDIR}${PREFIX}/share\
		${DESTDIR}${MANPREFIX}/man1
	cp -rf bin/* ${DESTDIR}${PREFIX}/bin
	cp -rf lib/${NAME} ${DESTDIR}${PREFIX}/lib
	cp -rf share/${NAME} ${DESTDIR}${PREFIX}/share
	chmod 755 ${DESTDIR}${PREFIX}/bin/${NAME}*
	chmod -R 755 ${DESTDIR}${PREFIX}/lib/${NAME}
	cp -rf ${NAME}.1 ${DESTDIR}${MANPREFIX}/man1
	chmod 644 ${DESTDIR}${MANPREFIX}/man1/${NAME}.1

dist:
	mkdir ${NAME}-${VERSION}
	cp -r README.md bin share lib Makefile ${NAME}.1 CHANGELOG.md ${NAME}-${VERSION}
	tar zcfv ${NAME}-${VERSION}.tar.gz ${NAME}-${VERSION}
	rm -rf ${NAME}-${VERSION}

uninstall:
	rm -f ${DESTDIOR}${PREFIX}/bin/${NAME}*\
		${DESTDIR}${PREFIX}/lib/${NAME} \
		${DESTDIR}${PREFIX}/share/${NAME} \
		${DESTDIR}${MANPREFIX}/man1/${NAME}.1

.PHONY: all dist uninstall

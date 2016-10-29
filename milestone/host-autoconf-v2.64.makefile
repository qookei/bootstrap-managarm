
f := host-autoconf-v2.64
$f_up := autoconf-v2.64

$(call milestone_action,configure-$f install-$f)

configure-$f: | $(call upstream_tag,download-$($f_up))
	rm -rf $B/host/$f && mkdir -p $B/host/$f
	cd $B/host/$f && $T/ports/$($f_up)/configure --prefix=$B/prefixes/$f
	touch $(call milestone_tag,configure-$f)

install-$f: | $(call milestone_tag,configure-$f)
	cd $B/host/$f && make && make install
	touch $(call milestone_tag,install-$f)


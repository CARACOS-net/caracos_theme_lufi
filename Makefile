EN=lib/Lufi/I18N/en.po
FR=lib/Lufi/I18N/fr.po
IT=lib/Lufi/I18N/it.po
OC=lib/Lufi/I18N/oc.po
SEDOPTS=-e "s@SOME DESCRIPTIVE TITLE@Lufi language file@" \
		-e "s@YEAR THE PACKAGE'S COPYRIGHT HOLDER@2015 Luc Didry@" \
		-e "s@CHARSET@utf8@" \
		-e "s@the PACKAGE package@the Lufi package@" \
		-e '/^\#\. (/{N;/\n\#\. (/{N;/\n.*\.\.\/default\//{s/\#\..*\n.*\#\./\#. (/g}}}' \
		-e '/^\#\. (/{N;/\n.*\.\.\/default\//{s/\n/ /}}'
SEDOPTS2=-e '/^\#.*\.\.\/default\//,+3d'
XGETTEXT=carton exec ../../local/bin/xgettext.pl
CARTON=carton exec

locales:
		$(XGETTEXT) -D templates -D ../default/templates -o $(EN) 2>/dev/null
		$(XGETTEXT) -D templates -D ../default/templates -o $(FR) 2>/dev/null
		$(XGETTEXT) -D templates -D ../default/templates -o $(IT) 2>/dev/null
		$(XGETTEXT) -D templates -D ../default/templates -o $(OC) 2>/dev/null
		sed $(SEDOPTS) -i $(EN)
		sed $(SEDOPTS2) -i $(EN)
		sed $(SEDOPTS) -i $(FR)
		sed $(SEDOPTS2) -i $(FR)
		sed $(SEDOPTS) -i $(IT)
		sed $(SEDOPTS2) -i $(IT)
		sed $(SEDOPTS) -i $(OC)
		sed $(SEDOPTS2) -i $(OC)

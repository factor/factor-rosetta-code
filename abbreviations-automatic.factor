! The use of abbreviations (also sometimes called synonyms, nicknames,
! AKAs, or aliases) can be an
! 
! easy way to add flexibility when specifying or using commands,
! sub─commands, options, etc.
! 
! It would make a list of words easier to maintain (as words are added,
! changed, and/or deleted) if the minimum abbreviation length of that list
! could be automatically (programmatically) determined.
! 
! For this task, use the list (below) of the days-of-the-week names that
! are expressed in about a hundred languages (note that there is a blank
! line in the list).
! 
!     Sunday Monday Tuesday Wednesday Thursday Friday Saturday
!     Sondag Maandag Dinsdag Woensdag Donderdag Vrydag Saterdag
!     E_djelë E_hënë E_martë E_mërkurë E_enjte E_premte E_shtunë
!     Ehud Segno Maksegno Erob Hamus Arbe Kedame
!     Al_Ahad Al_Ithinin Al_Tholatha'a Al_Arbia'a Al_Kamis Al_Gomia'a Al_Sabit
!     Guiragui Yergou_shapti Yerek_shapti Tchorek_shapti Hink_shapti Ourpat Shapat
!     domingu llunes martes miércoles xueves vienres sábadu
!     Bazar_gÜnÜ Birinci_gÜn Çkinci_gÜn ÜçÜncÜ_gÜn DÖrdÜncÜ_gÜn Bes,inci_gÜn Altòncò_gÜn
!     Igande Astelehen Astearte Asteazken Ostegun Ostiral Larunbat
!     Robi_bar Shom_bar Mongal_bar Budhh_bar BRihashpati_bar Shukro_bar Shoni_bar
!     Nedjelja Ponedeljak Utorak Srijeda Cxetvrtak Petak Subota
!     Disul Dilun Dimeurzh Dimerc'her Diriaou Digwener Disadorn
!     nedelia ponedelnik vtornik sriada chetvartak petak sabota
!     sing_kei_yaht sing_kei_yat sing_kei_yee sing_kei_saam sing_kei_sie sing_kei_ng sing_kei_luk
!     Diumenge Dilluns Dimarts Dimecres Dijous Divendres Dissabte
!     Dzeenkk-eh Dzeehn_kk-ehreh Dzeehn_kk-ehreh_nah_kay_dzeeneh Tah_neesee_dzeehn_neh Deehn_ghee_dzee-neh Tl-oowey_tts-el_dehlee Dzeentt-ahzee
!     dy_Sul dy_Lun dy_Meurth dy_Mergher dy_You dy_Gwener dy_Sadorn
!     Dimanch Lendi Madi Mèkredi Jedi Vandredi Samdi
!     nedjelja ponedjeljak utorak srijeda cxetvrtak petak subota
!     nede^le ponde^lí úterÿ str^eda c^tvrtek pátek sobota
!     Sondee Mondee Tiisiday Walansedee TOOsedee Feraadee Satadee
!     s0ndag mandag tirsdag onsdag torsdag fredag l0rdag
!     zondag maandag dinsdag woensdag donderdag vrijdag zaterdag
!     Diman^co Lundo Mardo Merkredo ^Jaùdo Vendredo Sabato
!     pÜhapäev esmaspäev teisipäev kolmapäev neljapäev reede laupäev
! 
!     Diu_prima Diu_sequima Diu_tritima Diu_quartima Diu_quintima Diu_sextima Diu_sabbata
!     sunnudagur mánadagur tÿsdaguy mikudagur hósdagur friggjadagur leygardagur
!     Yek_Sham'beh Do_Sham'beh Seh_Sham'beh Cha'har_Sham'beh Panj_Sham'beh Jom'eh Sham'beh
!     sunnuntai maanantai tiistai keskiviiko torsktai perjantai lauantai
!     dimanche lundi mardi mercredi jeudi vendredi samedi
!     Snein Moandei Tiisdei Woansdei Tonersdei Freed Sneon
!     Domingo Segunda_feira Martes Mércores Joves Venres Sábado
!     k'vira orshabati samshabati otkhshabati khutshabati p'arask'evi shabati
!     Sonntag Montag Dienstag Mittwoch Donnerstag Freitag Samstag
!     Kiriaki' Defte'ra Tri'ti Teta'rti Pe'mpti Paraskebi' Sa'bato
!     ravivaar somvaar mangalvaar budhvaar guruvaar shukravaar shanivaar
!     pópule pó`akahi pó`alua pó`akolu pó`ahá pó`alima pó`aono
!     Yom_rishon Yom_sheni Yom_shlishi Yom_revi'i Yom_chamishi Yom_shishi Shabat
!     ravivara somavar mangalavar budhavara brahaspativar shukravara shanivar
!     vasárnap hétfö kedd szerda csütörtök péntek szombat
!     Sunnudagur Mánudagur ╞riδjudagur Miδvikudagar Fimmtudagur FÖstudagur Laugardagur
!     sundio lundio mardio merkurdio jovdio venerdio saturdio
!     Minggu Senin Selasa Rabu Kamis Jumat Sabtu
!     Dominica Lunedi Martedi Mercuridi Jovedi Venerdi Sabbato
!     Dé_Domhnaigh Dé_Luain Dé_Máirt Dé_Ceadaoin Dé_ardaoin Dé_hAoine Dé_Sathairn
!     domenica lunedí martedí mercoledí giovedí venerdí sabato
!     Nichiyou_bi Getzuyou_bi Kayou_bi Suiyou_bi Mokuyou_bi Kin'you_bi Doyou_bi
!     Il-yo-il Wol-yo-il Hwa-yo-il Su-yo-il Mok-yo-il Kum-yo-il To-yo-il
!     Dies_Dominica Dies_Lunæ Dies_Martis Dies_Mercurii Dies_Iovis Dies_Veneris Dies_Saturni
!     sve-tdien pirmdien otrdien tresvdien ceturtdien piektdien sestdi

USING: formatting io io.encodings.utf8 io.files kernel math
sequences sets splitting ;
IN: rosetta-code.abbreviations-automatic

: map-head ( seq n -- seq' ) [ short head ] curry map ;

: unique? ( seq n -- ? ) map-head all-unique? ;
    
: (abbr-length) ( seq -- n )
    1 [ 2dup unique? ] [ 1 + ] until nip ;

: abbr-length ( str -- n/str )
    [ "" ] [ " " split (abbr-length) ] if-empty ;

: show ( str -- ) dup abbr-length swap " %2u  %s\n" printf ;

: labels ( -- )
    "Min." "abbr" "Days of the week" "%s\n%s%32s\n" printf ;

: line ( n -- ) [ "=" write ] times ;

: header ( -- ) labels 4 line bl 75 line nl ;

: body ( -- ) [ show ] each-line ;

: abbreviations ( -- )
    header "day-names.txt" utf8 [ body ] with-file-reader ;

MAIN: abbreviations

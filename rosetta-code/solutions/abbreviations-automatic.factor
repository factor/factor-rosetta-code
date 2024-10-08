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
!     sve-tdien pirmdien otrdien tresvdien ceturtdien piektdien sestdien
!     Sekmadienis Pirmadienis Antradienis Trec^iadienis Ketvirtadienis Penktadienis S^es^tadienis
!     Wangu Kazooba Walumbe Mukasa Kiwanuka Nnagawonye Wamunyi
!     xing-_qi-_rì xing-_qi-_yi-. xing-_qi-_èr xing-_qi-_san-. xing-_qi-_sì xing-_qi-_wuv. xing-_qi-_liù
!     Jedoonee Jelune Jemayrt Jecrean Jardaim Jeheiney Jesam
!     Jabot Manre Juje Wonje Taije Balaire Jarere
!     geminrongo minòmishi mártes mièrkoles misheushi bèrnashi mishábaro
!     Ahad Isnin Selasa Rabu Khamis Jumaat Sabtu
!     sφndag mandag tirsdag onsdag torsdag fredag lφrdag
!     lo_dimenge lo_diluns lo_dimarç lo_dimèrcres lo_dijòus lo_divendres lo_dissabte
!     djadomingo djaluna djamars djarason djaweps djabièrna djasabra
!     Niedziela Poniedzial/ek Wtorek S,roda Czwartek Pia,tek Sobota
!     Domingo segunda-feire terça-feire quarta-feire quinta-feire sexta-feira såbado
!     Domingo Lunes martes Miercoles Jueves Viernes Sabado
!     Duminicª Luni Mart'i Miercuri Joi Vineri Sâmbªtª
!     voskresenie ponedelnik vtornik sreda chetverg pyatnitsa subbota
!     Sunday Di-luain Di-màirt Di-ciadain Di-ardaoin Di-haoine Di-sathurne
!     nedjelja ponedjeljak utorak sreda cxetvrtak petak subota
!     Sontaha Mmantaha Labobedi Laboraro Labone Labohlano Moqebelo
!     Iridha- Sandhudha- Anga.haruwa-dha- Badha-dha- Brahaspa.thindha- Sikura-dha- Sena.sura-dha-
!     nedel^a pondelok utorok streda s^tvrtok piatok sobota
!     Nedelja Ponedeljek Torek Sreda Cxetrtek Petek Sobota
!     domingo lunes martes miércoles jueves viernes sábado
!     sonde mundey tude-wroko dride-wroko fode-wroko freyda Saturday
!     Jumapili Jumatatu Jumanne Jumatano Alhamisi Ijumaa Jumamosi
!     söndag måndag tisdag onsdag torsdag fredag lordag
!     Linggo Lunes Martes Miyerkoles Huwebes Biyernes Sabado
!     Lé-pài-jít Pài-it Pài-jï Pài-sañ Pài-sì Pài-gÖ. Pài-lák
!     wan-ar-tit wan-tjan wan-ang-kaan wan-phoet wan-pha-ru-hat-sa-boh-die wan-sook wan-sao
!     Tshipi Mosupologo Labobedi Laboraro Labone Labotlhano Matlhatso
!     Pazar Pazartesi Sali Çar,samba Per,sembe Cuma Cumartesi
!     nedilya ponedilok vivtorok sereda chetver pyatnytsya subota
!     Chu?_Nhâ.t Thú*_Hai Thú*_Ba Thú*_Tu* Thú*_Na'm Thú*_Sáu Thú*_Ba?y
!     dydd_Sul dyds_Llun dydd_Mawrth dyds_Mercher dydd_Iau dydd_Gwener dyds_Sadwrn
!     Dibeer Altine Talaata Allarba Al_xebes Aljuma Gaaw
!     iCawa uMvulo uLwesibini uLwesithathu uLuwesine uLwesihlanu uMgqibelo
!     zuntik montik dinstik mitvokh donershtik fraytik shabes
!     iSonto uMsombuluko uLwesibili uLwesithathu uLwesine uLwesihlanu uMgqibelo
!     Dies_Dominica Dies_Lunæ Dies_Martis Dies_Mercurii Dies_Iovis Dies_Veneris Dies_Saturni
!     Bazar_gÜnÜ Bazar_ærtæsi Çærs,ænbæ_axs,amò Çærs,ænbæ_gÜnÜ CÜmæ_axs,amò CÜmæ_gÜnÜ CÜmæ_Senbæ
!     Sun Moon Mars Mercury Jove Venus Saturn
!     zondag maandag dinsdag woensdag donderdag vrijdag zaterdag
!     KoseEraa GyoOraa BenEraa Kuoraa YOwaaraa FeEraa Memenaa
!     Sonntag Montag Dienstag Mittwoch Donnerstag Freitag Sonnabend
!     Domingo Luns Terza_feira Corta_feira Xoves Venres Sábado
!     Dies_Solis Dies_Lunae Dies_Martis Dies_Mercurii Dies_Iovis Dies_Veneris Dies_Sabbatum
!     xing-_qi-_tiàn xing-_qi-_yi-. xing-_qi-_èr xing-_qi-_san-. xing-_qi-_sì xing-_qi-_wuv. xing-_qi-_liù
!     djadomingu djaluna djamars djarason djaweps djabièrnè djasabra
!     Killachau Atichau Quoyllurchau Illapachau Chaskachau Kuychichau Intichau
! 
! Caveat: The list (above) most surely contains errors (or, at the least,
! differences) of what the actual (or true) names for the
! days-of-the-week.
! 
! To make this Rosetta Code task page as small as possible, if processing
! the complete list, read the days-of-the-week from a file (that is
! created from the above list).
! 
! Notes concerning the above list of words
! 
! -   -   each line has a list of days-of-the-week for a language,
!         separated by at least one blank
!     -   the words on each line happen to be in order, from Sunday ──►
!         Saturday
!     -   most lines have words in mixed case and some have all manner of
!         accented words and other characters
!     -   some words were translated to the nearest character that was
!         available to code page 437
!     -   the characters in the words are not restricted except that they
!         may not have imbedded blanks
!     -   for this example, the use of an underscore (_) was used to
!         indicate a blank in a word
! 
! Task:
! 
! -   -   The list of words (days of the week) needn't be
!         verified/validated.
!     -   Write a function to find the (numeric) minimum length
!         abbreviation for each line that would make abbreviations unique.
!     -   A blank line (or a null line) should return a null string.
!     -   Process and show the output for at least the first five lines of
!         the file.
!     -   Show all output here.

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

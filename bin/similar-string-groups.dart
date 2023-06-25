void main() {
  var values = <List<String>>[
    [
      "vymtkcrovcndgpgcmpyxlinauuhuurqfvvgtitjpzzrnzttwtqdpybwohhrrdqcehkecquoasvitqlburqztmmuqedcnusdrmjkocetylsizltoaaiaxkmqhjbxxqnczgsimszfjdtrdlnvhzwkeyxttbcupwvmbctmhohwazhelwdijtooieqtafunasalsmcmtvpvc",
      "tuxspmuqaculjmdzpqtdbtgomwdntamsbzocvlulcrgqogilhpqnlcdinyqckiuehyiwonxkwchmktwepqtdvnmtcbtjxtkrrmmagnibentldtavffjcocumzhxtvmzswsovtcheahvpcyezuzrjedtqaqvhlkvrwpatzeiqrryzaiuhmfoovushrsbqdctxtisjyzua",
      "hurtialitcczmolsrunptuotmvqhndgttdtrpcfdkphvqfhekbvuteahemdrmuwxkifzqcepvourdzdhmcltiiztywuvlvsrmmcngnrsswltotvnulzhxkaitkgdteuhmmxialpqtabictvaoccswndwoabucgvebsqyzbzyzjyyswpjnamqjjrmqqaocjexqhqoctzx",
      "aamrcrqvqtaxzawlzeiuhqtnamosmxslurchhodrqyqondcprzdjlnjzthqcirgbcvnkbupbqvjvpolncztuitmvhriidouactvztxzlbklycgqswpcsgkteotxnesuhhidqkmtxfmoaaztuhmtjmqtawlwgtjmyetpcdpbrywevtvntfchwsmcsfymezikvediuuoud",
      "ohhoaosaziaisctbjwqrxwucpprtbtjjqmfxcohvltdqtnddszvyyvmomaumpufcatvtnvwvezdoxngrtlumuhzerttwvtblalgdcaqmtrcbulpkitnofutchqgcoyhceakieqzejlvxieccumehmskybzqqwiqznrkjhpxsdwtldyuskstvmrdzqcimiugtrpznmhan",
      "cvlmvoqtnnltdtvmhyauycntspprldptncszcadufmszibzmvhmeuqimbcohmwcvpotjkjnshhtzrdyusgwsandyfjlymrkdmzeuldtsuzvwxhjztraztmaktcegvkwcceqlwetrzqtqxljvoxqoqqrduaubtqgoghotprxhtnembpieqccaxbvairuihwcakofiutii",
      "evxxlisadnhchjatzsvajfehzohcxdpdsaqcmqvqqmypmwgoinpdoklnlzqcrmmvtomobztqzavaxhccrejsdbdttzattkcctgqroihycuqfutimynuitekwgrinkbuvcqyhbstmdltunmjsqwkxrupuzalvdrpizpnzwucittuhslougtwreeltvmjebctayrhowfmv",
      "htjjpscmcsyriuaqttlfqmkzgqfsvvzolwerwtiteuwtojmueuathsqevznccyuhqrmtqwohdndjvwsatboczbzxfbmtsgrmrdltxnozmpnciyicqpdwaaxaolppgekiktepvmiahovaznuvdddutxlvtbgemlhhbyucjizduqcrltyqactmtsixczkrnnmrqhokvuhc",
      "icahsukdqmbdpwmyodwzxiifpbgzvmwgvtevzrwasnwvvhhxlmbpemanouolzokchmtunvqznxxymipqrtiqpaitlhzzmrnqtsasdhctitcyqarveeccabpfstneoufhkgchvcttcazrxwrulmdqjjcgddveytutytjcaktcolhestmmuquoqszudqrtjnlklorijubt",
      "udrymiucnmtttdavnxysvokafpasvlqmnhyiuuzugooztkrcfeqicbdjwrrlkccnuwhnicuxtzsbabuuhdlxcpqogjimmssptowmkhohhtqtitqaqbyvfqpmlpbuwctrhnwdtvazkmeqzqeowtigxtrmzixremaeljzchlssajtzycvvvtoezcdgnlmqpcdvtrdjehta",
      "vcrdhiotouthvttkhfgzsfzmlasfirwmuaobsktgymultteqszzhqjrtzdscitavxdsgcmbwmlzqicyyruhcvatmhevoxomccdtiujoznqtvtzpeeahweqytbcmcerulaxdqvhwcbdarxnosbpqcrntdpmmtiikrkppnwzulyahneaxqnqkmvwinljqoljcdujgpuutv",
      "huitialitcczmolsrunptuotmvqhndgttdtrpcfdkphvqfhekbvuteahemdrmuwxkifzqcepvourdzdhmcltiiztywuvlvsrmmcngnrsswltotvnulzhxkartkgdteuhmmxialpqtabictvaoccswndwoabucgvebsqyzbzyzjyyswpjnamqjjrmqqaocjexqhqoctzx",
      "vymtkcreicndgpgcmpyxlinauuzuurqfvvgtitjpzhrnzttwtqdpybwohhrrdqcehkecquoasvitqlburqztmmuqedcnusdrmjkoceaylsizltotaiaxkmqhjbxxqnczgsimszfjdtrdlnvhzwkoyxntbcupwvmbctmhohwazhelwdijtooveqtafutasalsmcmvtpvc",
      "tuxspmuqaculjmdzpqtdbtgomwdntamsszocvlulcrgqogilhpqnlcdinyqckiuehyiwonxkwchmktwepqtdvnmtcbtjxqkrrmmagnibentldtavffjcocumzhxtvmzswsovtcheahvpcyezuzrjedttaqvhlkvrwpatzeiqrryzaiuhmfoovushrsbqdctxtibjyzua",
      "ltpdcpzuyqhoxhwxarxqntagisqqcwmrmysvlsjyvamnapgpwzltmkyjtqovwlacutqhqerfnuuamewoitdsblotlhctfshbqcsufjzqtdhvjzxachgoumtnvdunetqvekizozurndgcairdttrjbkkbrtmeommucceiuizpctvodtpnrcwaizmtsyvmlbzdhcvekhix",
      "htwfpnrouucbqejqrlmwtxazhcgqswcmsuvmrzumamtlulvizcomuyznpvychkuvgtjkprthxafdkcvcezmwaodrnbtfhydppajshoxzlcvrdwyiotzlaqkeuttytesqtznumqtrknqscxeiqiewiioutlhdzopiamavjbjxtmlcvtibhdgnhmsobcedndtcaqrtgsvq",
      "zeaompmdpnaazraoztroxkrgyqcvyrmtlmdudesasdohhcfnccmvkqwkdxbwntqevturtcmhegzotbzqbodrruilmctyluithguchqmpzawpzxqrvtwjmbjenicwtisqtevwilqtikupycllanymfquiznocvbhdxdjhqjszoectjutxhlsthvgtsvvapuskcmifunta",
      "vymtkcreicndgpgcmpyxlinauuhuurqfvvgtitjpzzrnzttwtqdpybwohhrrdqcehkecquoasvitqlburqztmmuqedcnusdrmjkoceaylsizltotaiaxkmqhjbxxqnczgsimszfjdtrdlnvhzwkoyxntbcupwvmbctmhohwazhelwdijtooveqtafutasalsmcmtvpvc",
      "qcahsxkdqmbdpwmyodwzxiifpbgzvmwgvtevzcwasnwvvhhulmbpemanouolzokchmtunvqznxxymipqrtiqpaitlhzzmrnitsasdhctitcyqarveeccabpfstneoufhkgchvrttcazrxwrulmdqjjcgddveytutytjcaktcolhestmmuquoqszudqrtjnlklorijubt",
      "ohmxnrvttobuzjviaezmzrsqrzrmtcghulzfxtcmmpuyhibsawjncqmtnnmxfhieqaljpagwdkwcbrmteluyaqkleovscrwduxtaqgoiezlznquvhrtdyhtstpuhlbccttckhojuncvvtvalqvktvzpukwzbcoduqoqtifrwsseoqcnxeidmypdtcdmhdaagyijimpst",
      "hkgtzzttrcbcvlslaxctmchemehaohtuvrtytiiagvtevwtxoekoscltntxfjfomonuhpeuswibsnwufzyqdtaruqzmamcuirctqmmdrhdpowzjscuipqvkdrvdiztqimctjyuqbhqdsnbiowlacqmxgluoanucvzvdxanzqhjvlbmakrhgptnwclytyermzkesqdppj",
      "hysqdtvmoprkaqpuercytgqftvvowtmxburuelqwvmipggztqmtuwkveeontqsardmwbjtbidtmudcpachmanmlqqlliyuxsiepvozucnxbdaikecomtrfdhhzahwtwznqvrckcdrcrgoeztauactnhftchjtihzsoictjxaujtslzlonmujizbyvshknmlsxqpdcyvz",
      "vlgcbtaojxnhuyaqtrivalyqythrhmitzxcssqotbleorqscwpemtsnzszkujzpchmiottmcxtpkpaasdjqmedltlzroeiiiamhnnoownqtaqjtfqcbhcmkmnpvtatcvduuvmquhrubzsackrzmqvcmrdukwzbncgdgeuywyxhlwlfdpjodtieighrfdzcxutvuwvevt",
      "ltpdcpzuyqhoxhwxarxqntagisqqcwmrmysvlsjyvamnapgpwzltmkyjtqovwlacutqhqerfnuuamewoitdsblotlhctfshbqcsufjzctdhvjzxachgoumtnvdunetqvekizozurndgcairdttrjbkkbrtmeommucceiuizpctvodtpnrcwaizmtsyvmlbzdhqvekhix",
      "hurtialitcczmolsrunptuotmvqhndgttdtrpcfdkphvqfhekbvuteahemdrmuwxkiozqcepvourdzdhmcltiiztywuvlvsrmmcngnrsswltotvnulzhxkaitkgdteuhmmxialpqtabictvafccswndwoabucgvebsqyzbzyzjyyswpjnamqjjrmqqaocjexqhqoctzx",
      "hkgtzzttrcbcvlslamctmchepehaohtuvrtytviagitevwtxoekoscltntxfjfwmonuhpeuswibsnwufzyqdtaruqzmamcuirctqmmdrhdpoozjscuimqvkdrvdiztqimctjyuqbhqdsnbiowlacqmxgluoanucvzvdxanzqhjvlbxakrhgptnwclytyermzkesqdppj",
      "yomdhmwtqtviedmtlstmfzcatesqweqltjprzzcvnhtjbhvhpucqchnigatylruyswzmqatfobeatvidmtajhvipxuivqhrvuzjiyxalzctxdueickhtxdnwrvnlbwaqunutroaanknpdzgrtsgiwskdsmedqurmoopcmjcqqfmzlbgcxtzolrmhteoukovcpkbucysc",
      "qcahsxkdqmbdpwmyodwzxiifpbgzvmwgvtevzcwasnwvvhhulmbpemanouolznkchmtunvqznxxymipqrtihpaitlszzmrnithasdqctitcyqarveeccabpfstbeoufhkgccvrttcazrxwrulmdqjjcgddveytutytjcaktholhestmmuquoqszudqrtjnlklorijuot",
      "ohmxnrvttobuzjviaezmzrsqrzrmtcghulzfxtcmmpuyhibsawjncqmtnnmxfhieqaljpagwdkwcbrmteluyaqkleovscrwduxtaqgoiezlznquvhrtdyhtsupuhlbccttckhojuncvvtvalqvktvzpukwzbcodtqoqtifrwsseoqcnxeidmypdtcdmhdaagyijimpst",
      "ohhoaosaziaisctbjwqrxwucpprtbtjjqmfxcopvltdqtnddszvyyvmomaumpufcatvtnvwvezdoxngrtlumuhzerttwvtblalgdcaqmtrcbulpkitnofutchqgcoyhceakieqzejlvxieccumehmskybzqqwiqznrkjhhxsdwtldyuskstvmrdzqcimiugtrpznmhan",
      "nncryesnuemsutdgkhwcetttojecqtujiccmudktaxnovhirbobiqvjaqqtwksdofynagtdhgcekhlqerszicgzdzcqpttpxctzovtztmpstnyirxyhrxplkwaecvumtquvtwbucimwsaddqlbamlnuzvbhlvwmohzhdlruifyfampqihsmzmjupxazcrqjoravomvtl",
      "qcahsukdqmbdpwmyodwzxiifpbgzvmwgvtevzrwasnwvvhhxlmbpemanouolzokchmtunvqznxxymipqrtiqpaitlhzzmrnitsasdhctitcyqarveeccabpfstneoufhkgchvcttcazrxwrulmdqjjcgddveytutytjcaktcolhestmmuquoqszudqrtjnlklorijubt",
      "tuxspmuqaculjmdzpqtdbtgomwdntamsbzocvlulcrgqogilhpqnlcdinyqckiuehyiwonxkwchmktwepqtdvnmtcbtjxqkrrmmagnibentldtavffjcocumzhxtvmzswsovtcheahvpcyezuzrjedttaqvhlkvrwpatzeiqrryzaiuhmfoovushrsbqdctxtisjyzua",
      "vyivxeqltulxdkztddqmdaacujvsuifiodasovvjdhzjbtgtuvctbddprqmjtpayeflzzcqtmmhczuwkirazycfwcckrnueeprtkqcezmeucwvisynhonsihmeoarizsmlqthabhcrhtqmtxwoyttlnkrniumstojpaloubhwomxwltqpcxtgmsqbgqnzcanrvuvhpgt",
      "hysqdtvmoprkaqpuercytgqftvvowtmxburuelqwvmipggztqmtuwkveeontqsardmwbotbidtmudcpachmanmlqqlliyuxsiepvozucnxbdaikecjmtrfdhhzahwtwznqvrckcdrcrgoeztauactnhftchjtihzsoictjxaujtslzlonmujizbyvshknmlsxqpdcyvz",
      "htjjpscmcsyriuaqttlfqmkggqfsvvzolwerwtiteuwtojmueuathsqevznccyuhqrmtqwohdndjvwsatboczbzxfbmtsgrmrdltxnozmpnciyicqpdwaaxaolppgekiktepvmiahovaznuvdddutxlvtbzemlhhbyucjizduqcrltyqactmtsixczkrnnmrqhokvuhc",
      "vymtkcrovcndgpgcmpyxlinfuuhuurqfvvgtitjpzzrnzttwtqdpybwohhrrdqcehkecquoasvitqlburqztmmuqedcnusdrmjkocetylsizltoaaiaxkmqhjbxxqnczgsimszajdtrdlhvhzwkeyxttbcupwvmbctmhohwaznelwdijtooieqtafunasalsmcmtvpvc",
      "hurtialitcczmolsrunptuotmvqhndgttdtrpcfdkphvqfhexsvuteahemdrmuwxktozqceuvoprdzdhmcltiiztywuvlvsrmmcngnrsbwliotvnulzhxkaitkgdtemhmmxialpqtabictvafccswndwoabucgvebsqyzbzyzjyyswpjnamqjjruqqaocjexqhqoctzk",
      "ohmxnrvttobuzjviaezmzrsqrzrmtcghulzfxtcmmpuyhibsawjncqmtnnmxfhieqaljqagwdkwcbrmteluyapkleovscrwduxtaqgoiezlznquvhrtdyhtsupuhlbccttckhojuncvvtvalqvktvzpukwzbcodtqoqtifrwsseoqcnxeidmypdtcdmhdaagyijimpst",
      "ohmxnrvttobuzjviaezmzrsqrzrmtcghulzfxtcmmpuyhibsawjncqmtnnmxfwieqaljpagwdkwcbrmteluyaqkleovscrwduxtaqgoiezlznquvhrtdyhtstpuhlbccttckhojuncvvtvalqvktvzpukwzbcoduqoqtifrhsseoqcnxeidmypdtcdmhdaagyijimpst",
      "vyivxeqltulxdkztddqmdaacujvsuifiodasovvkdhzjbtgtuvctbddprqmjtpayeflzzcqtmmhczuwkirazycfwcckrnueeprtjqcezmeucwvisynhozsihmeoarinsmlqthabhcrhtqmtxwoyttlnkrniumstojpaloubhwomxwltqpcxtgmsqbgqnzcanrvuvhpgt",
      "iwzrcevwzqalhatokresvyqmmhnmxgzhrltdxnymdwputobmquwmemtqcpvvrcoctluhzknzoiijfqoedqtctfsxeeahtulilzkiwsortphqqabmmrnkdwuhjtpplxtztzhcgtkjsiuadfcjocdvpmcliermshyrtcaqnbvyunyvsabdsuvvgnttxioutacbjcauqgzd",
      "hurtialitcczmolsrunptuotmvqhndgttdtrpwfdkphvqfhexsvuteahemdrmuwxktozqceuvoprdzdhmcltiiztywuvlvsrmmcngnrsbcliotvnulzhxkaitkgdtemhmmxialpqtabjctvafccswndwoabucgvebsqyzbzyzjyyswpjnamqjjruqqaociexqhqoctzk",
      "tuxnpmuqaculjmdzpqtdbtgomwdntamsszocvlulcrgqogilhpqnlcdinyqckiuehyiwonxkwchmktwepqtdvnmtcbtjxqkrrmmagnibestldtavffjcocumzhxtvmzswsovtcheahvpcyezuzrjedttaqvhlkvrwpatzeiqrryzaiuhmfoovushrsbqdctxtibjyzua",
      "iyktusoqttcquepfoqgkpnatcvaxxtzqvtzwmipbnixqhiagcqydosrcscnmuzrnhimxerbaormvkdywvmdoetjjtccbuucphoudenltamkqemlmtnvfmrwvrckhislhrayahlpqizschwmhdtbdqutubtccaosvfjagzdtetdoqtegizsmtvlurlhxzpzjyuzwwljvn",
      "vlgcbtaojxnhuraqtrivalyqythrhmitzxcssqotbleorqscwpemtsnzszkujzpchmiottmcxtpkpaasdjqmedltlzroeiiiamhnnoownqtaqjtfqcbhcmkmnpvtatcvduuvmquhyubzsackrzmqvcmrdukwzbncgdgeuywyxhlwlfdpjodtieighrfdzcxutvuwvevt",
      "vymtkcroicndgpgcmpyxlinauuhuurqfvvgtitjpzzrnzttwtqdpybwohhrrdqcehkecquoasvitqlburqztmmuqedcnusdrmjkocetylsizltoaaiaxkmqhjbxxqnczgsimszfjdtrdlnvhzwkeyxntbcupwvmbctmhohwazhelwdijtooveqtafutasalsmcmtvpvc",
      "vymtkcroicndgpgcmpyxlinauuhuurqfvvgtitjpzzrnzttwtqdpybwohhrrdqcehkecquoasvitqlburqztmmuqedcnusdrmjkoceaylsizltotaiaxkmqhjbxxqnczgsimszfjdtrdlnvhzwkeyxntbcupwvmbctmhohwazhelwdijtooveqtafutasalsmcmtvpvc",
      "vymtkcrovcndgpgcmpyxlinauuhuurqfvvgtitjpzzrnzttwtqdpybwohhrrdqcehkecquoasvitqlburqztmmuqedcnusdrmjkocetylsizltoaaiaxkmqhjbxxqnczgsimszfjdtrdlhvhzwkeyxttbcupwvmbctmhohwaznelwdijtooieqtafunasalsmcmtvpvc",
      "hurtialitcczmolsrunptuotmvqhndgttdtrpcfdkphvqfhekbvuteahemdrmuwxkiozqcepvourdzdhmcltiiztywuvlvsrmmcngnrsswltotvnulzhxkaitkgdtemhmmxialpqtabictvafccswndwoabucgvebsqyzbzyzjyyswpjnamqjjruqqaocjexqhqoctzx",
      "tuxnpmuqaculjsdzpqtdbtgomwdntamsszocvlulcrgqogilhpqnlcdinyqckiuehyiwonxkwchmktwepqtdvnmtcbtjxqkrrmmagnibestldtavffjcocumzhxtvmzswsovtcheahvpcyezuzrjedttaqvhlkvrwpatzeiqrryzaiuhmfoovumhrsbqdctxtibjyzua",
      "hkgtzzttrcbcvlslamctmchemehaohtuvrtytiiagvtevwtxoekoscltntxfjfomonuhpeuswibsnwufzyqdtaruqzmamcuirctqmmdrhdpowzjscuipqvkdrvdiztqimctjyuqbhqdsnbiowlacqmxgluoanucvzvdxanzqhjvlbxakrhgptnwclytyermzkesqdppj",
      "ohhoaosaziaisctbjwqrxwucpprtvtjjqmfxcohvltdqtnddszvyyvmomaumpufcatvtnvwvezdoxngrtlumuhzerttwbtblalgdcaqmtrcbulpkitnofutchqgcoyhceakieqzejlvxieccumehmskybzqqwiqznrkjhpxsdwtldyuskstvmrdzqcimiugtrpznmhan",
      "hurtialitcczmolsrunptuotmvqhndgttdtrpwfdkphvqfhexsvuteahemdrmuwxktozqceuvoprdzdhmcltiiztywuvlvsrmmcngnrsbcliotvnulzhxkaitkgdtemhmmxialpqtabictvafccswndwoabucgvebsqyzbzyzjyyswpjnamqjjruqqaocjexqhqoctzk",
      "autceiuqzhwrszzoltudimcanklndscvpdyhoddqdimtncutttlqyaqebeehrhbxmslmtcwmbpmwqhzoqaailrfjjikivtcizgbjorttxsdgpmxzyszwvrevowejrtwacyrltngznzgovtpvxhqcpptjtquafhmaldkcmrvbiuamukvuntoquechvkoquynsxhmscctf",
      "vyivxeqltulxdkztdeqmdaacujvsuifiodasovvkdhzjbtgtuvctbddprqmjtpayeflzzcqtmmhczuwkirazycfwcckrnueeprtjqcezmducwvisynhozsihmeoarinsmlqthabhcrhtqmtxwoyttlnkrniumstojpaloubhwomxwltqpcxtgmsqbgqnzcanrvuvhpgt",
      "ltpdcpzuyqhoxhwxarxqntagisqqcwmrmysvlsjyvdmnapgpwzltmkyjtqovwlacutqhqerfnuuamewoitasblotlhctfshbqcsufjzctdhvjzxachgoumtnvdunetqvekizozurndgcairdttrjbkkbrtmeommucceiuizpctvodtpnrcwaizmtsyvmlbzdhqvekhix",
      "qcahsxkdqmbdpwmyodwzxiifpbgzvmwgvtevzcwasnwvvhhulmbpemanouolzokchmtunvqznxxymipqrtiqpaitlhzzmrnitsasdhctitcyqarveeccabpfstbeoufhkgchvrttcazrxwrulmdqjjcgddveytutytjcaktcolhestmmuquoqszudqrtjnlklorijunt",
      "ivvtrtcncjabdturaueejbtsihqizmtqtdlzsutrcklotoweihvhcypvgqoptqatxkjnclkrbzqjussvnphtputrnlcgqiahcawhvyetwdizmzkaxmyqmuccaerydoryucmswjpvlvmfvmefcxnqobbzogwdkhmuniautapdqtxdztxoegismodluthqfwnsmzmzlchr",
      "huitialitcczmolsrunptuotmvqhndgttbtrpcfdkphvqfhekdvumeahemdrmuwxkifzqcepvourdzdhmcltiiztywuvlvsrtmcngnrsswltotvnulzhxkartkgdteuhmmxialpqtabictvaoccswndwoabucgvebsqyzbzyzjyyswpjnamqjjrmqqaocjexqhqoctzx",
      "heqvmfheizhdqknnqlcdqhkqsorhkcjplnoctedxnactmzgutbamutrbqcvidqvawrtrqdxgysozluomarwjzdvpdmptcxcpkalyiqpstmoiusewyudoztztawrlhlniczvcjxtuttmvtcxctbjkhbpmibwwsuhvfasglinetoimeotrzqmvcyaeuhanrfgsztuvjuym",
      "rtageeoueskmmrekvlzykakpdcespasitrdaamqtvwhznyqlmutiqsiigzocrlrxjumvszqrdoazmemucgtzptomxccawouvcmjbwpdiqcbvynzhxomheptwsiwadqhbqnsdlxrydnnuzpfxlulhmchhonuictgntvdutcyctrzbjqhtktfvoajftjvihqutlbwqctvt",
      "qcahsxkdqmbdpwmyodwzxiifpbgzvmwgvtevzcwasnwvvhhulmbpemanouolzokchmtunvqznxxymipqrtiqpaitlhzzmrnitsasdhctitcyqarveeccabpfstbeoufhkgccvrttcazrxwrulmdqjjcgddveytutytjcaktholhestmmuquoqszudqrtjnlklorijunt",
      "hurtialitcczmolsrunptuotmvqhndgttdtrpwfdkphvqfhexsvuteahemdrmuwxktozqceuvoprdzdhmcltiiztywuvlvsrmmcngnrsbcliotvnulzhxkaitkgdtemhmmxialpqtabjctvafccswndwoabucgvemsqyzbzyzjyyswpjnabqjjruqqaociexqhqoctzk",
      "mvaonjocbvtcuslbrugdtqpvkyemsdlcjinjnrtvtqhkazlxsedzeybzvkudhxnetzxuvetuqajzdmrdhfwwmmrltpkatmgwgvvwooroklmbinynifqauqivtmrytupzzhhuatqocmcgucbptdsihechizcicxtqitmhwjmsxpraelqnahqzfocoaluyttrptcqdcssw",
      "autceiuqzhrrszzoltudumcanklndscvpdyhoddqdimtncitttlqyaqebeehrhbxmslmtcwmbpmwqhzoqaailrfjjikivtcizgbjorttxsdgpmxzyszwvwevowejrtwacyrltngznzgovtpvxhqcpptjtquafhmaldkcmrvbiuamukvuntoquechvkoquynsxhmscctf",
      "qcahsxkdqmbdpwmyodwzxiifpbgzvmwgvtevzcwasnwvvhhulmbpemanouolznkchmtunvqznxxymqpqrtihpaitlszzmrnithasdqctitcyqarveeccabpfstbeoufhkgccvrttcazrxwrulmdqjjcgddveytutytjcaktholhestmmuiuoqszudqrtjnlklorijuot",
      "vymtkcrovcndgpgcmpyxlinauuhuurqfvvgtitjpzzrnzttwtqdpybwohhrrdqcehkecquoasvitqlburqztmmuqedcnusdrmjkocetylsizltoaaiaxkmqhjbxxqnczgsimszfjdtrdlnvhzwkeyxntbcupwvmbctmhohwazhelwdijtooieqtafutasalsmcmtvpvc",
      "hkgtzzttrcbcvlslamctmchepehaohtuvrtytiiagvtevwtxoekoscltntxfjfwmonuhpeuswibsnwufzyqdtaruqzmamcuirctqmmdrhdpoozjscuimqvkdrvdiztqimctjyuqbhqdsnbiowlacqmxgluoanucvzvdxanzqhjvlbxakrhgptnwclytyermzkesqdppj",
      "icahnukdqmbdpwmyodwzxiifpbgzvmwgvtevzrwasnwvvhhxlmbpemanouolzokchmtunvqzexxymipqttiqpaitlhzzmrnqtsasdhctitcyqarveeccabpfstneoufhkgchvcrtcazrxwrulmdqjjcgddveytutytjcaktcolhnstmmuquoqszudqrtjslklorijubt",
      "isumlttfconelptjrxvatxtcqepsiizctrxvqdfkkovqemmurblumlmympcujrtdcadgcgjqivnspadwvezwmrpbybqdhkjmtxusqtcztqkoknrzozhbcwxiityhamqzdcrtvuhtcciohnvtlulbzfuehomweoqjenrhplauiwqntsovthsmyaaasngyzvzhudtwgadc",
      "vlgcbtaojxmhuyaqtrivalyqythrhmitzxcssqotbleorqscwpemtsnzszkujzpchniottmcxtpkpaasdjqmedltlzroeiiiamhnnoownqtaqjtfqcbhcmkmnpvtatcvduuvmquhrubzsackrzmqvcmrdukwzbncgdgeuywyxhlwlfdpjodtieighrfdzcxutvuwvevt",
      "evxxlisadnhchjatzsvajfeszohcxdpdsaqcmqvqqmypmwgoinpdoklnlzqcrmmvtomobztqzavaxhccrejhdbdttzattkcctgqroihycuqfutimynuitekwgrinkbuvcqyhbstmdltunmjsqwkxrupuzalvdrpizpnzwucittuhslougtwreeltvmjebctayrhowfmv",
      "etcztiqmaqpuitnnvhcmtiuduqawveblzddcuuymrqjujifbtygjeohwqmaotzxkyhveeuzlmvzrkdoxtlhclytvnyqaqmupclfswmtghwtchtsczzbrtmropumjuhdrsbapgrsolsenoijntqbkrmcgnttdvicaloprqttvkkvpwxidshzcamqczxdhinfesxvoaacw",
      "hurtialitcczmolsrunptuotmvqhndgttdtrpcfdkphvqfhekbvuteahemdrmuwxktozqceuvoprdzdhmcltiiztywuvlvsrmmcngnrsswliotvnulzhxkaitkgdtemhmmxialpqtabictvafccswndwoabucgvebsqyzbzyzjyyswpjnamqjjruqqaocjexqhqoctzx",
      "ltpdcpzuyqhoxhwxarxqntagisqqcwmrmysvlsjyodmnapgpwzltmkyjtqovwlacutqhqerfnuuamewvitasblotlhctfshbqcsufjzctdhvjzxachgoumtnvdunetqvekizozurndgcairdttrjbkkbrtmeommucceiuizpctvodtpnrcwaizmtsyvmlbzdhqvekhix",
      "autceiuqzhrrszzoltudimcanklndscvpdyhoddqdimtncutttlqyaqebeehrhbxmslmtcwmbpmwqhzoqaailrfjjikivtcizgbjorttxsdgpmxzyszwvwevowejrtwacyrltngznzgovtpvxhqcpptjtquafhmaldkcmrvbiuamukvuntoquechvkoquynsxhmscctf",
      "vyivxeqltulxdkztddqmdaacujvsuifiodasovvjdhzjbtgtuvctbddprqmjtpayeflzzcqtmmhczuwkirazycfwcckrnueeprtkqcezmeucwvisynhozsihmeoarinsmlqthabhcrhtqmtxwoyttlnkrniumstojpaloubhwomxwltqpcxtgmsqbgqnzcanrvuvhpgt",
      "cvlmvoqtnnltdtvmhyauycntspprldptncszcadufmsziuzmvhmeuqimbcohmwcvpotjkjnshhtzrdyusgwsandyfjlymrkdmzeuldtsuzvwxhjztraztmaktcegvkwcceqlwetrzqtqxljvoxqoqqrduabbtqgoghotprxhtnembpieqccaxbvairuihwcakofiutii",
      "udrymiucnmtttdavnxysvokafpasvlmmnhyiuuzugooztkrcfeqicbdjwrrlkccnuwhnicuxtzsbabuuhdlxcpqogjimmssptowmkhohhtqtitqaqbyvfqpmlpbuwctrhnwdtvazkqeqzqeowtigxtrmzixremaeljzchlssajtzycvvvtoezcdgnlmqpcdvtrdjehta",
      "ohhoaosaziaisctbjwqrxwucpprtvtjjqmfxcohvltdqtnddszvyyvmomaumpufcatvtnvwvezdoxngrtlumuhzerttwbtblalgdcaqmtccbulpkitnofutchqgcoyhceakieqzejlvxiercumehmskybzqqwiqznrkjhpxsdwtldyuskstvmrdzqcimiugtrpznmhan",
      "qcahsxkdqmbdpwmyodwzxiifpbgzvmwgvtevzcwasnwvvhhulmbpemanouolzokchmtunvqznxxymipqrtiqpaitlszzmrnithasdhctitcyqarveeccabpfstbeoufhkgccvrttcazrxwrulmdqjjcgddveytutytjcaktholhestmmuquoqszudqrtjnlklorijunt",
      "iyktusoqttcquepfoqgkpnatcvaxxtzqvtzwmipbnixqhiagcqysosrcscnmuzrnhimxerbaormvkdywvmdoetjjtccbuucphoudenltamkqemlmtnvfmrwvrckhidlhrayahlpqizschwmhdtbdqutubtccaosvfjagzdtetdoqtegizsmtvlurlhxzpzjyuzwwljvn",
      "hurtialitcczmolsrunptuotmvqhndgttdtrpcfdkphvqfhekbvuteahemdrmuwxktozqcepvourdzdhmcltiiztywuvlvsrmmcngnrsswliotvnulzhxkaitkgdtemhmmxialpqtabictvafccswndwoabucgvebsqyzbzyzjyyswpjnamqjjruqqaocjexqhqoctzx",
      "icahnukdqmbdpwmyodwzxiifpbgzvmwgvtevzrwasnwvvhhxlmbpemanouolzokchmtunvqznxxymipqttiqpaitlhzzmrnqtsasdhctitcyqarveeccabpfstneoufhkgchvcrtcazrxwrulmdqjjcgddveytutytjcaktcolhestmmuquoqszudqrtjslklorijubt",
      "icahsukdqmbdpwmyodwzxiifpbgzvmwgvtevzrwasnwvvhhxlmbpemanouolzokchmtunvqznxxymipqttiqpaitlhzzmrnqtsasdhctitcyqarveeccabpfstneoufhkgchvcrtcazrxwrulmdqjjcgddveytutytjcaktcolhestmmuquoqszudqrtjnlklorijubt",
      "mvaanjocbvtcuslbrugdtqpvkyemsdlcjinjnrtvtqhkazlxsedzeybzvkudhxnetzxuvetuqajzdmrdhfwwmmrltpkatmgwgvvwooroklmbinynifqauqivtmrytupzzhhuatqocmcgucbptdsihechizcicxtqitmhwjmsxproelqnahqzfocoaluyttrptcqdcssw",
      "eoxxlisadnhchjatzsvajfehzohcxdpdsaqcmqvqqmypmwgoinpdoklnlzqcrmmvtomobztqzavaxhccrejsdbdttzattkcctgqroihycuqfutimynuitekwgrinkbuvcqyhbstmdltunmjsqwkxrupuzalvdrpizpnzwucittuhslvugtwreeltvmjebctayrhowfmv",
      "hkgtzzttrcbcvlslamctmchepehaohtuvrtytiiagvtevwtxoekoscltntxfjfomonuhpeuswibsnwufzyqdtaruqzmamcuirctqmmdrhdpowzjscuimqvkdrvdiztqimctjyuqbhqdsnbiowlacqmxgluoanucvzvdxanzqhjvlbxakrhgptnwclytyermzkesqdppj",
      "huitialitcczmolsrunptuotmvqhndgttbtrpcfdkphvqfhekdvuteahemdrmuwxkifzqcepvourdzdhmcltiiztywuvlvsrmmcngnrsswltotvnulzhxkartkgdteuhmmxialpqtabictvaoccswndwoabucgvebsqyzbzyzjyyswpjnamqjjrmqqaocjexqhqoctzx",
      "vyomtatqcppcuepallcnettjodtmcgmsgzjrknquswtwbjxhzsizkxtdemuvtcqtubuirwihfbrcoyzqmczfxxerecqbvtqqnrglypmeshkyuahhwvtviiljcrlvmdhibzoaavjtuoaqrutwhqhinuoimozvhgcttdnrktldtkladnzwamcmmvpdspqsyasfzexnucod",
      "vymtkcreicndgpgcmpyxlinauuzuurqfvvgtitjpzhrnzttwtqdpybwohhrrdqcehkecquoasvitqlburqztmmuqedcnusdrmjkoceaylsizltotaiaxkmqhjbxxqnczgsimszfjdtrdlnvhzwkoyxntbcupwvmbctmhohwazhelwdijtooveqtafutasalsmcmtvpvc",
      "vymtkcreicndgpgcmpyxlinauuzuurqfvvgtitjpzhdnzttwtqdpybwohhrrdqcehkecquoasvitqlburqztmmuqedcnusdrmjkoceaylsizltotaiaxkmqhjbxxqnczgsimszfjdtrdlnvhzwkoyxntbcupwvmbctmhohwazhelwrijtooveqtafutasalsmcmvtpvc",
      "qcahsukdqmbdpwmyodwzxiifpbgzvmwgvtevzcwasnwvvhhxlmbpemanouolzokchmtunvqznxxymipqrtiqpaitlhzzmrnitsasdhctitcyqarveeccabpfstneoufhkgchvrttcazrxwrulmdqjjcgddveytutytjcaktcolhestmmuquoqszudqrtjnlklorijubt",
      "hurtialitcczmolsrunptuotmvqhndgttdtrpcfdkphvqfhexbvuteahemdrmuwxktozqceuvoprdzdhmcltiiztywuvlvsrmmcngnrsswliotvnulzhxkaitkgdtemhmmxialpqtabictvafccswndwoabucgvebsqyzbzyzjyyswpjnamqjjruqqaocjexqhqoctzk",
      "qcahsxkdqmbdpwmyodwzxiifpbgzvmwgvtevzcwasnwvvhhulmbpemanouolznkchmtunvqznxxymipqrtiqpaitlszzmrnithasdhctitcyqarveeccabpfstbeoufhkgccvrttcazrxwrulmdqjjcgddveytutytjcaktholhestmmuquoqszudqrtjnlklorijuot",
      "icahnukdqmbdpwmykdwzxiifpbgzvmwgvtevzrwasnwvvhhxlmbpemanouolzoochmtunvqzexxymipqttiqpaitlhzzmrnqtsasdhctitcyqarveeccabpfstneoufhkgchvcrtcazrxwrulmdqjjcgddveytutytjcaktcolhnstmmuquoqszudqrtjslklorijubt",
      "qqltmtlvcwgeuzcsaojpapotlozhkcbssbrundyctvcsjnhiymwkmrnceetdhoamuqhxxiivhndvfamaqtozcjntkqdcizlgwtveuhiaetrqipsabtfkunmbqjvrutczgpopsoduzvnczxzdghbuwcxzhueftrmatruvmywmrljsolqtcwtpevqykxiyhdlqiradmttm"
    ],
    ["zkhnmefhyr", "ykznfhehmr", "mkhnyefrzh", "zkhnyefrmh", "zkmnhefhyr", "ykznhfehmr", "zkynhfehmr", "mkhnhefrzy", "zkhnmefryh", "zkmnhfehyr"],
    ["tars", "rats", "arts", "star"],
    ["omv", "ovm"],
  ];
  values.forEach((v) {
    final sb = StringBuffer("'$v'");
    final result = Solution().numSimilarGroups(v);
    sb.write(" -> '$result'");
    print(sb.toString());
  });
}

class Node {
  final int id;
  Node? parent;
  final children = <Node>[];
  Node(this.id);
  void setParent(Node value) {
    parent = value;
    parent!.children.add(this);
  }

  Node getRootParent() {
    var v = parent;
    while (v!.parent != null) {
      v = v.parent;
    }
    return v;
  }
}

class Solution {
  bool isSimilar(String a, String b) {
    if (a == b) {
      return true;
    }
    var errors = 0;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) {
        errors++;
      }
      if (errors > 2) {
        return false;
      }
    }
    return true;
  }

  int numSimilarGroups(List<String> strs) {
    final rootNodes = <Node>[];
    final cache = <int, Node>{};
    final len = strs.length;
    for (var i = 0; i < len; i++) {
      final str1 = strs[i];
      var node1 = cache[i];
      if (node1 == null) {
        node1 = Node(i);
        cache[i] = node1;
        rootNodes.add(node1);
      }
      for (var j = 0; j < len; j++) {
        if (j == i) {
          continue;
        }
        if (isSimilar(str1, strs[j])) {
          var node2 = cache[j];
          if (node2 == null) {
            node2 = Node(j);
            node2.setParent(node1);
            cache[j] = node2;
          } else {
            if (node1.parent == null && node2.parent == null) {
              node2.setParent(node1);
              rootNodes.removeWhere((e) => (e.id == node2!.id));
            } else {
              if (node1.parent == null) {
                //var rootP = node2.getRootParent();
                if (node2.parent!.id != node1.id) {
                  node1.setParent(node2);
                  rootNodes.removeWhere((e) => (e.id == node1!.id));
                }
              } else if (node2.parent == null) {
                //var rootP = node1.getRootParent();
                if (node1.parent!.id != node2.id) {
                  node2.setParent(node1);
                  rootNodes.removeWhere((e) => (e.id == node2!.id));
                }
              } else {
                var rootP1 = node1.getRootParent();
                var rootP2 = node2.getRootParent();
                if (rootP1.id != rootP2.id) {
                  rootP1.setParent(rootP2);
                  rootNodes.removeWhere((e) => (e.id == rootP1.id));
                }
              }
            }
          }
        }
      }
    }
    return rootNodes.length;
  }
}

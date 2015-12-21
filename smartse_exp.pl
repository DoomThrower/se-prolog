:- dynamic([xpozytywne/1, xnegatywne/1, xnie_wiem/1, xtelefon_jest/1, xtelefonem_polecanym_jest/1, xwhy/2, xhow/4]).

%uzupelniam listy pustym znakiem, inaczej zle sie drukuja
przygotuj :-
	assertz(xpozytywne('')),
	assertz(xnegatywne('')),
	assertz(xnie_wiem('')),
	
	assertz(xtelefonem_polecanym_jest('')),
	assertz(xtelefon_jest('')),
	
	assertz(xwhy('','')),
	assertz(xhow('','','','')).
	

ktelefonem_polecanym_jest(X) :-
	telefonem_polecanym_jest(X),
	(xtelefonem_polecanym_jest(X);
	(assertz(xtelefonem_polecanym_jest(X)),
	assertz(xwhy('telefonem_polecanym_jest', X)))).

telefonem_polecanym_jest(samsung_galaxy_s6_edge) :-
	ktelefon_jest(samsung_galaxy_s6_edge, dobry_procesor),
    (ktelefon_jest(samsung_galaxy_s6_edge, duzy_ekran);
    ktelefon_jest(samsung_galaxy_s6_edge, dotykowy);
    ktelefon_jest(samsung_galaxy_s6_edge, dobry_aparat);
    ktelefon_jest(samsung_galaxy_s6_edge, przedni_aparat);
    ktelefon_jest(samsung_galaxy_s6_edge, lte);
    ktelefon_jest(samsung_galaxy_s6_edge, duza_pamiec_wewnetrzna);
    ktelefon_jest(samsung_galaxy_s6_edge, trzy_gb_ramu);
    ktelefon_jest(samsung_galaxy_s6_edge, nfc);
    ktelefon_jest(samsung_galaxy_s6_edge, gps);
    ktelefon_jest(samsung_galaxy_s6_edge, bluetooth)).
	
telefonem_polecanym_jest(htc_one_mini) :-
    ktelefon_jest(htc_one_mini, maly_ekran),
    (ktelefon_jest(htc_one_mini, jeden_gb_ramu);
    ktelefon_jest(htc_one_mini, tani);
    ktelefon_jest(htc_one_mini, bluetooth)).
	
telefonem_polecanym_jest(huawei_honor_6_plus_dual_sim) :-
    ktelefon_jest(huawei_honor_6_plus_dual_sim, duzy_ekran),
    (ktelefon_jest(huawei_honor_6_plus_dual_sim, dual_sim);
    ktelefon_jest(huawei_honor_6_plus_dual_sim, trzy_gb_ramu);
    ktelefon_jest(huawei_honor_6_plus_dual_sim, tani);
    ktelefon_jest(huawei_honor_6_plus_dual_sim, bluetooth);
    ktelefon_jest(huawei_honor_6_plus_dual_sim, nfc)).

telefonem_polecanym_jest(samsung_solid_b2700) :-
	ktelefon_jest(samsung_solid_b2700, wytrzymaly),
	(ktelefon_jest(samsung_solid_b2700, tani);
	ktelefon_jest(samsung_solid_b2700, maly_ekran)).

telefonem_polecanym_jest(sony_xperia_m2_aqua) :-
	ktelefon_jest(sony_xperia_m2_aqua, wodoodporny),
	(ktelefon_jest(sony_xperia_m2_aqua, maly_ekran);
	ktelefon_jest(sony_xperia_m2_aqua, tani)).
/*
================================
*/

ktelefon_jest(X, Y) :-
	assertz(xwhy('telefonem_polecanym_jest', X)),
	assertz(xwhy('telefon_jest', Y)),
	telefon_jest(X, Y),
	(xtelefon_jest(Y);
	assertz(xtelefon_jest(Y))).

telefon_jest(X, duzy_ekran) :-
    pozytywne(X, duzy_ekran, dla_filmow),
    pozytywne(X, duzy_ekran, dla_gier).
	
telefon_jest(X, maly_ekran) :-
    pozytywne(X, maly_ekran, do_smsowania),
    pozytywne(X, maly_ekran, do_dzwonienia),
    pozytywne(X, maly_ekran, do_sluchania_muzyki).

telefon_jest(X, dobry_procesor) :-
    pozytywne(X, dobry_procesor, dla_gier).

telefon_jest(X, duza_pamiec_wewnetrzna) :-
    pozytywne(X, duza_pamiec_wewnetrzna, dla_filmow),
    pozytywne(X, duza_pamiec_wewnetrzna, dla_gier).

telefon_jest(X, wytrzymala_bateria) :-
    pozytywne(X, wytrzymala_bateria, dla_filmow),
    pozytywne(X, wytrzymala_bateria, dla_gier),
    pozytywne(X, wytrzymala_bateria, do_sluchania_muzyki).

telefon_jest(X, przedni_aparat) :-
    pozytywne(X, przedni_aparat, do_robienia_selfie),
    pozytywne(X, przedni_aparat, do_podrozy_sluzbowych),
    pozytywne(X, przedni_aparat, do_pracy).

telefon_jest(X, dobry_aparat) :-
    pozytywne(X, dobry_aparat, dla_zdjec).

telefon_jest(X, lte) :-
    pozytywne(X, lte, do_internetu).

telefon_jest(X, jeden_gb_ramu) :-
    pozytywne(X, jeden_gb_ramu, do_smsowania),
    pozytywne(X, jeden_gb_ramu, do_dzwonienia).

telefon_jest(X, dwa_gb_ramu) :-
    pozytywne(X, dwa_gb_ramu, dla_programowania).

telefon_jest(X, trzy_gb_ramu) :-
    pozytywne(X, trzy_gb_ramu, dla_gier).

telefon_jest(X, cztery_gb_ramu) :-
    pozytywne(X, cztery_gb_ramu, dla_gier).

telefon_jest(X, nfc) :-
    pozytywne(X, nfc, do_przesylania_multimediow).

telefon_jest(X, gps) :-
    pozytywne(X, gps, dla_orientacji_w_terenie).

telefon_jest(X, szybkie_ladowanie) :-
    pozytywne(X, szybkie_ladowanie, do_podrozy_sluzbowych).

telefon_jest(X, dual_sim) :-
    pozytywne(X, dual_sim, do_pracy).

telefon_jest(X, dobra_jakosc_dzwieku) :-
    pozytywne(X, dobra_jakosc_dzwieku, dla_filmow).

telefon_jest(X, wygodne_wprowadzanie_tekstu) :-
    pozytywne(X, wygodne_wprowadzanie_tekstu, do_smsowania).

telefon_jest(X, czytnik_linii_papilarnych) :-
    pozytywne(X, czytnik_linii_papilarnych, do_pracy).

telefon_jest(X, duze_dpi) :-
    pozytywne(X, duze_dpi, dla_filmow),
    pozytywne(X, duze_dpi, dla_gier),
    pozytywne(X, duze_dpi, dla_zdjec).

telefon_jest(X, bluetooth) :-
    pozytywne(X, bluetooth, do_przesylania_multimediow).
	
telefon_jest(X, dotykowy) :-
    pozytywne(X, dotykowy, dla_gier).

telefon_jest(X, wytrzymaly) :-
	telefon_jest(X, odporny_na_snieg),
	telefon_jest(X, wodoodporny),
	telefon_jest(X, wstrzasoodporny).

telefon_jest(X, odporny_na_snieg) :-
	pozytywne(X, odporny_na_snieg, do_podrozy_w_gory);
	pozytywne(X, odporny_na_snieg, do_uprawiania_sportow_zimowych).
	
telefon_jest(X, wodoodporny) :-
    pozytywne(X, wodoodporny, do_plywania),
    pozytywne(X, wodoodporny, do_podrozy).

telefon_jest(X, wstrzasoodporny) :-
    pozytywne(X, wstrzasoodporny, do_podrozy),
    pozytywne(X, wstrzasoodporny, do_biegania).
	
telefon_jest(X, tani) :-
    pozytywne(X, tani, do_smsowania),
    pozytywne(X, tani, do_dzwonienia).
	
/*	
================================
*/
	
pozytywne(_, _, Z) :-
	assertz(xwhy('pozytywne', Z)),
	xpozytywne(Z), !;
	xnie_wiem(Z), !.

pozytywne(X, Y, Z) :-
	not(xnegatywne(Z)),
	not(xnie_wiem(Z)),
	pytaj(X, Y, Z, tak).

negatywne(_, _, Z) :-
	assertz(xwhy('negatywne', Z)),
	xnegatywne(Z), !; 
	xnie_wiem(Z), !.

negatywne(X, Y, Z) :-
	not(xpozytywne(Z)),
	not(xnie_wiem(Z)),
	pytaj(X, Y, Z, nie).

pytaj(X, Y, Z, K) :-
	!, write('\nCzy telefon ma byc: '), write(Z), write('? \n'),
	write('a) Tak \n'), 
	write('b) Nie \n'),
	write('c) Chce pominac to pytanie (odpowiedz nie bedzie miala wplywu na wynik testu)\n\n'),
	
	readln([Replay]),
	not(skoncz(Replay)),
	
	(pamietaj(X, Y, Z, Replay),
	(odpowiedz(Replay, K);
	odpowiedz(Replay, nie_wiem));
	
	(odpowiedz(Replay, what),
	pytaj(X, Y, Z, K));
	
	(odpowiedz(Replay, how),
	pytaj(X, Y, Z, K));
	
	(odpowiedz(Replay, why),
	pytaj(X, Y, Z, K));
	
	(odpowiedz(Replay, help),
	pytaj(X, Y, Z, K))).

odpowiedz(Replay, tak):-
	sub_string(Replay, 0, _, _, 'a').

odpowiedz(Replay, nie):-
	sub_string(Replay, 0, _, _, 'b').

odpowiedz(Replay, nie_wiem):-
	sub_string(Replay, 0, _, _, 'c').

odpowiedz(Replay, end) :-
	sub_string(Replay, 0, _, _, 'end').
	
odpowiedz(Replay, what):-
	sub_string(Replay, 0, _, _, 'what'),
	podaj_what.

odpowiedz(Replay, why):-
	sub_string(Replay, 0, _, _, 'why'),
	podaj_why.
	
odpowiedz(Replay, how):-
	sub_string(Replay, 0, _, _, 'how'),
	podaj_how.

odpowiedz(Replay, help) :-
	sub_string(Replay, 0, _, _, 'help'),
	help.

help :-
	write('\n<------- MANUAL ---------->\n\n'),
	write('help - wyswietla pomoc\n'),
	write('what - lista dotychczas ustalonych faktow (symptomy, fakty posrednie, hipoteza)\n'),
	write('how - lista what poszerzona o sposob w jaki uzyskano dany fakt (odpowiedz na symptom, reguly)\n'),
	write('why - dlaczego system pyta o dany symptom (stos regul przetwarzanych, ktore wygenerowaly pytanie)\n'),
	write('end - zakonczenie testu, usuwane zostaja wszystkie odpowiedzi uzytkownika\n'),
	write('\n<-------- END --------->\n\n').
	
skoncz(Replay) :-
	odpowiedz(Replay, end),
	wyczysc_fakty,
	abort.
	
pamietaj(X, Y, Z, Replay) :-
	odpowiedz(Replay, tak),
	assertz(xpozytywne(Z)),
	assertz(xhow(X, Y, Z, 'tak')).

pamietaj(X, Y, Z, Replay) :-
	odpowiedz(Replay, nie),
	assertz(xnegatywne(Z)),
	assertz(xhow(X, Y, Z, 'nie')).

pamietaj(X, Y, Z, Replay) :-
	odpowiedz(Replay, nie_wiem),
	assertz(xnie_wiem(Z)),
	assertz(xhow(X, Y, Z, 'nie_wiem')).

podaj_what :-
	write('\n<----- WHAT ----->'),
	
	write('\n\nHipotezy:\n'),
	setof(K1, xtelefonem_polecanym_jest(K1), L1),
	drukuj(L1),
	
	write('\n\nFakty posrednie:\n'),
	setof(K2, xtelefon_jest(K2), L2),
	drukuj(L2),
	
	write('\n\nSymptomy pozytywne:\n'),
	setof(K3, xpozytywne(K3), L3),
	drukuj(L3),
	
	write('\n\nSymptomy negatywne:\n'),
	setof(K4, xnegatywne(K4), L4),
	drukuj(L4),
	
	write('\n\nSymptomy ignorowane:\n'),
	setof(K5, xnie_wiem(K5), L5),
	drukuj(L5),
	
	write('\n\n<----- END ------>\n\n').

podaj_why :-
	write('\n<----- WHY ----->'),
	
	write('\n\nStos zapytan:\n'),
	bagof([K00, K01], xwhy(K00,K01), L00),
	drukuj(L00),
	
	write('\n\n<----- END ------>\n\n').	

podaj_how :-
	podaj_what,
	write('\n<----- HOW ----->'),
	
	write('\n\nSkad sie wziely fakty posrednie:\n'),
	setof([K000, K001, K002, K003], (xhow(K000, K001, K002, K003), xtelefon_jest(K001)), L000),
	drukuj(L000),
	
	write('\n\nSkad sie wziely hipotezy:\n'),
	setof([K0000, K0001, K0002, K0003], (xhow(K0000, K0001, K0002, K0003), xtelefonem_polecanym_jest(K0000)), L0000),
	drukuj(L0000),
	
	write('\n\n<----- END ------>\n\n').
	
wyczysc_fakty :-
	write('\n\nNacisnij enter aby zakonczyc\n'),
	retractall(xpozytywne(_)),
	retractall(xnegatywne(_)),
	retractall(xnie_wiem(_)),
	retractall(xtelefon_jest(_)),
	retractall(xtelefonem_polecanym_jest(_)),
	retractall(xwhy(_,_)),
	retractall(xhow(_,_,_,_)),
	readln(_).

%funkcja drukuje liste bez pierwszego elementu
drukuj( [_|Y]) :-
	xdrukuj(Y).

xdrukuj([]).
xdrukuj( [X|Y] ) :- 
	write('- '), write(X), write(',\n'), xdrukuj(Y).

wykonaj :-
	przygotuj,
	setof(A, ktelefonem_polecanym_jest(A), B),
	setof(Y, ktelefon_jest(_, Y), Z), 
	write('\nTwoje wymagania odnosnie telefonu:\n'), drukuj(Z), nl, nl,
	write('\nSugerowane telefony to:\n'), drukuj(B), 
	wyczysc_fakty.	

wykonaj :-
	write('\nNie jestem w stanie ustalic'),
	write(' twojego sugerowanego telefonu.\n\n'), 
	wyczysc_fakty.

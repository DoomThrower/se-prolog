:- module(smartse,[wykonaj]).

:- dynamic([xpozytywne/2, xnegatywne/2]).

telefonem_polecanym_jest(samsung_galaxy_s6_edge) :-
	telefon_posiada(dobry_procesor),
	telefon_posiada(duzy_ekran),
	telefon_jest(dotykowy),
	telefon_posiada(dobry_aparat),
	telefon_posiada(przedni_aparat),
	telefon_jest(dotykowy),
	telefon_posiada(lte),
	telefon_posiada(duza_pamiec_wewnetrzna),
	telefon_posiada(trzy_gb_ramu),
	telefon_posiada(nfc),
	telefon_posiada(gps),
	telefon_posiada(bluetooth).

telefonem_polecanym_jest(htc_one_mini) :-
	telefon_posiada(maly_ekran),
	telefon_posiada(jeden_gb_ramu),
	telefon_jest(tani),
	telefon_posiada(bluetooth).

telefonem_polecanym_jest(huawei_honor_6_plus_dual_sim) :-
	telefon_posiada(duzy_ekran),
	telefon_posiada(dual_sim),
	telefon_posiada(trzy_gb_ramu),
	telefon_jest(tani),
	telefon_posiada(bluetooth),
	telefon_posiada(nfc).

telefonem_polecanym_jest(samsung_solid_b2700) :-
	telefon_jest(wytrzymaly),
	telefon_jest(tani),
	telefon_posiada(maly_ekran).

telefonem_polecanym_jest(sony_xperia_m2_aqua) :-
	telefon_jest(wodoodporny),
	telefon_posiada(maly_ekran),
	telefon_jest(tani).

telefon_posiada(duzy_ekran) :-
	pozytywne(czy, dla_filmow);
	pozytywne(czy, dla_gier).

telefon_posiada(maly_ekran) :-
	pozytywne(czy, do_smsowania);
	pozytywne(czy, do_dzwonienia);
	pozytywne(czy, do_sluchania_muzyki).

telefon_posiada(dobry_procesor) :-
	pozytywne(czy, dla_gier).

telefon_posiada(duza_pamiec_wewnetrzna) :-
	pozytywne(czy, dla_filmow);
	pozytywne(czy, dla_gier).

telefon_posiada(wytrzymala_bateria) :-
	pozytywne(czy, dla_filmow);
	pozytywne(czy, dla_gier);
	pozytywne(czy, do_sluchania_muzyki).

telefon_posiada(przedni_aparat) :-
	pozytywne(czy, do_robienia_selfie);
	pozytywne(czy, do_podrozy_sluzbowych);
	pozytywne(czy, do_pracy).

telefon_posiada(dobry_aparat) :-
	pozytywne(czy, dla_zdjec).

telefon_jest(dotykowy) :-
	pozytywne(czy, dla_gier).

telefon_posiada(lte) :-
	pozytywne(czy, do_internetu).

telefon_posiada(jeden_gb_ramu) :-
	pozytywne(czy, do_smsowania);
	pozytywne(czy, do_dzwonienia).

telefon_posiada(dwa_gb_ramu) :-
	pozytywne(czy, dla_programowania).

telefon_posiada(trzy_gb_ramu) :-
	pozytywne(czy, dla_gier).

telefon_posiada(cztery_gb_ramu) :-
	pozytywne(czy, dla_gier).

telefon_posiada(nfc) :-
	pozytywne(czy, do_przesylania_multimediow).

telefon_posiada(gps) :-
	pozytywne(czy, dla_orientacji_w_terenie).

telefon_jest(wytrzymaly) :-
	telefon_jest(odporny_na_snieg),
	telefon_jest(wodoodporny),
	telefon_jest(wstrzasoodporny).

telefon_jest(odporny_na_snieg) :-
	pozytywne(czy, do_podrozy_w_gory);
	pozytywne(czy, do_uprawiania_sportow_zimowych).

telefon_jest(wodoodporny) :-
	pozytywne(czy, do_plywania);
	pozytywne(czy, do_podrozy).

telefon_jest(wstrzasoodporny) :-
	pozytywne(czy, do_podrozy);
	pozytywne(czy, do_biegania).

telefon_posiada(szybkie_ladowanie) :-
	pozytywne(czy, do_podrozy_sluzbowych).

telefon_posiada(dual_sim) :-
	pozytywne(czy, do_pracy).

telefon_posiada(dobra_jakosc_dzwieku) :-
	pozytywne(czy, dla_filmow).

telefon_jest(tani) :-
	pozytywne(czy, do_smsowania);
	pozytywne(czy, do_dzwonienia).

telefon_posiada(wygodne_wprowadzanie_tekstu) :-
	pozytywne(czy, do_smsowania).

telefon_posiada(czytnik_linii_papilarnych) :-
	pozytywne(czy, do_pracy).

telefon_posiada(duze_dpi) :-
	pozytywne(czy, dla_filmow);
	pozytywne(czy, dla_gier);
	pozytywne(czy, dla_zdjec).

telefon_posiada(bluetooth) :-
	pozytywne(czy, do_przesylania_multimediow).

pozytywne(X, Y) :-
	xpozytywne(X, Y), !.

pozytywne(X, Y) :-
	not(xnegatywne(X, Y)),
	pytaj(X, Y, tak).

negatywne(X, Y) :-
	xnegatywne(X, Y), !.

negatywne(X, Y) :-
	not(xpozytywne(X, Y)),
	pytaj(X, Y, nie).

pytaj(X, Y, tak) :-
	!, write(X), write(' ten_telefon_ma_byc '), write(Y), write(' ? (t/n)\n'),
	readln([Replay]),
	pamietaj(X, Y, Replay), 
	odpowiedz(Replay, tak).

pytaj(X, Y, nie) :-
	!, write(X), write(' ten_telefon_ma_byc '), write(Y), write(' ? (t/n)\n'),
	readln([Replay]),
	pamietaj(X, Y, Replay),
	odpowiedz(Replay, nie).    

odpowiedz(Replay, tak):-
	sub_string(Replay, 0, _, _, 't').

odpowiedz(Replay, nie):-
	sub_string(Replay, 0, _, _, 'n').

pamietaj(X, Y, Replay) :-
	odpowiedz(Replay, tak),
	assertz(xpozytywne(X, Y)).

pamietaj(X, Y, Replay) :-
	odpowiedz(Replay, nie),
	assertz(xnegatywne(X, Y)).

wyczysc_fakty :-
	write('\n\nNacisnij enter aby zakonczyc\n'),
	retractall(xpozytywne(_, _)),
	retractall(xnegatywne(_, _)),
	readln(_).

wykonaj :-
	telefonem_polecanym_jest(X), !,
	write('W takim razie polecam telefon '), write(X), nl,
	wyczysc_fakty.

wykonaj :-
	write('\nNie ma telefonu, '),
	write('ktory spelnialby Twoje wymagania.\n\n'), wyczysc_fakty.

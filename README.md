# Makieta miasta - IQRF

## Komendy
Każda komenda to kolejny bajt kolejno po sobie.
G to numer grupy.
- 0xG0 - koniec: <grupa|kod>
- 0xG1, 0xG4, 0xG7 - wyłączenie odpowiedniego pinu: <grupa|kod> <czas czekania> <mnożnik czekania przed>
- 0xG2, 0xG5, 0xG8 - włączenie odpowiedniego pinu: <grupa|kod> <czas czekania> <mnożnik czekania przed>
- 0xG3, 0xG6, 0xG9 - miganie odpowiedniego pinu: <grupa|kod> <czas czekania> <mnożnik czekania wył.> <mnożnik czekania wł.> <ilość mignięć>
- 0xGA - ustawienie grupy: <grupa|kod> <nr grupy 0-A>
- 0xGB - włączenie powtarzania komend, jest wyłączane po każdym przesłaniu: <grupa|kod>
- 0xGC - wyłączenie powtarzania komend: <grupa|kod>

## Przy założeniu że:
#### pin1 (RC2) = zielone, polecenia 0xG1, 0xG2, 0xG3
#### pin2 (RC3) = żółte, polecenia 0xG4, 0xG5, 0xG6
#### pin3 (RC5) = czerwone, polecenia 0xG7, 0xG8, 0xG9

Pierwszy bajt musi być 0x00 i oznacza początkowy adres w pamięci, potem do 55 bajtów danych.
Teoretycznie można go zmienić i na bajcie 0 zostawić np.: polecenie do powtarzania
bajtów od 55 licząc od 0 w górę NIE WOLNO nadpisywać bo zawierają dane o stanie, 
poza tym poleceń z nich nie da się wykonać.

## Przykłady na skrzyżowaniu:
####  Zmiana wartości obecnie na 0x08 na inne zmieni czaś zmian, a 0F, F0 czas między cyklami.
#### Piesi
zielone - od razu zielone:
```
00.02.00.00.04.00.00.07.00.00.00.
```
na czerwone - 4 migi zielonego i czerowne:
```
00.04.00.00.07.00.00.03.02.F0.F0.04.01.00.00.08.02.F0.00.
```
cykl w kółko:
```
00.0B.02.0F.F0.04.00.00.07.00.00.04.0F.F0.07.00.00.03.02.F0.F0.04.01.00.00.08.02.F0.00.
```

#### Auta
czerwone na zielone - chwilę żółte i czerwone i potem zielone:
```
00.01.00.00.05.00.00.08.00.00.04.08.F0.02.00.00.07.00.00.00.
```
zielone na czerwone:
```
00.01.00.00.05.00.00.07.00.00.04.08.F0.08.00.00.00.
```
cykl w kółko:
```
00.01.F0.0F.05.00.00.08.00.00.04.08.F0.02.00.00.07.00.00.0B.01.0F.F0.05.00.00.07.00.00.04.08.F0.08.00.00.00.
```

 wszystkie wył.:
```
00.07.00.00.04.00.00.01.00.00.00.
```
wszystkie wł.:
```
00.08.00.00.05.00.00.02.00.00.00.
```

## Grupowanie
Instrukcja 0x<G>A zmienia grupe dla wszystkich których dotyczy.
```
G = 0 ustawia wszystkim ktore dostały polecenie
G != 0 ustawia wszystim z daną grupą
```
np.
```
00.0A.01.00 ustawia wszystkim grupe 1
00.1A.02.00 ustawia wszystim z grupy 1 grupe 2
```

### Światła wg grup dla 1
Piesi
```
00.12.00.00.14.00.00.17.00.00.00.
00.14.00.00.17.00.00.13.02.F0.F0.04.11.00.00.18.02.F0.00.
00.1B.12.0F.F0.14.00.00.17.00.00.14.0F.F0.17.00.00.13.02.F0.F0.04.11.00.00.18.02.F0.00.
```
Auta
```
00.11.00.00.15.00.00.18.00.00.14.08.F0.12.00.00.17.00.00.00.
00.11.00.00.15.00.00.17.00.00.14.08.F0.18.00.00.00.
00.11.F0.0F.15.00.00.18.00.00.14.08.F0.12.00.00.17.00.00.1B.11.0F.F0.15.00.00.17.00.00.14.08.F0.18.00.00.00.
```

### Światła wg grup dla 2
Piesi
```
00.22.00.00.24.00.00.27.00.00.00.
00.14.00.00.27.00.00.23.02.F0.F0.04.21.00.00.28.02.F0.00.
00.2B.22.0F.F0.24.00.00.27.00.00.24.0F.F0.27.00.00.23.02.F0.F0.04.21.00.00.28.02.F0.00.
```
Auta
```
00.21.00.00.25.00.00.28.00.00.24.08.F0.22.00.00.27.00.00.00.
00.21.00.00.25.00.00.27.00.00.24.08.F0.28.00.00.00.
00.21.F0.0F.25.00.00.28.00.00.24.08.F0.22.00.00.27.00.00.2B.21.0F.F0.25.00.00.27.00.00.24.08.F0.28.00.00.00.
```

#### Można je też połączyć w np.: gaszenie z grupy 1 i świecenie z grupy 2 ale to już na życzenie bo to wiecej myślenia.
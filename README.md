# Makieta miasta - IQRF

##### WIP!

Sekwencje poprzez zapisanie w ram bajtów, dokładny kod komendy niebawem!

Składnia kodowania w bajtach od adresu 0 do 55 (lub zakończenia 0x00):
```
<kod instrukcji> <czas do mnożenia> <mnożnik opóźnienia> (<mnożnik czasu włączenia> <ilość mrugnięć>)
```

Kody:
- 0x00 - koniec
- 0x01 - wyłączenie pinu 1
- 0x02 - włączenie pinu 1
- 0x03 - mrugnięcie pinem 1
- 0x04 - wyłączenie pinu 2
- 0x05 - włączenie pinu 2
- 0x06 - mrugnięcie pinem 2
- 0x07 - wyłączenie pinu 3
- 0x08 - włączenie pinu 3
- 0x09 - mrugnięcie pinem 3

Na przykład instrukcja: 0x02 0x28 0x14 0x1 0x14 0x14 0x00
Włączy pin 1 po 40 * 20 ms i wyłączy go po kolejnych 20 * 20 ms  
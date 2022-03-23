# Esee pentru bacalaureatul la română

# Document care conține tot ( [view](book/book.pdf) | [download](../../raw/master/book/book.pdf) )

Nu am ce spune mai mult. Nu le-am scris eu, decât le-am rescris în LaTeX pentru mine, am zis să le am undeva online și poate mai ajută pe cineva.

Poate există anumite greșeli de scriere. Puteți să îmi spuneți dacă găsiți unele.

## Detalii despre proiect
Aceste fișiere au fost compilate folosind XeLaTeX. Inițial am folosit pdfLaTeX, dar am trecut la XeLaTeX datorită faptului că acesta reușește să despartă mai bine în silabe cuvintele românești, cu mult mai puține intervenții manuale.

## Structură

```
|- <dată> („<operă>” de <autor>)/
|  |- Eseu <gen literar>/
|  |  |– Eseu_<gen literar>.pdf
|  |  |– Eseu_<gen literar>.tex
|  |  |#
|  |- Eseu personaj principal <gen literar>/
|  |  |– Eseu_personaj_principal_<gen literar>.pdf
|  |  |– Eseu_personaj_principal_<gen literar>.tex
|  |  |#
|  |#
|
| [...]
|
|- book/
|  |- src/
|  |  |- [iconuri]
|  |  |#
|  |- book.pdf
|  |- book.tex
|  |#
|
|- etc/
|  |- [misc.]
|  |#
|- LICENSE
|- preamble.tex [preambulul centralizat]
|- README.md [te uiți la el]
|#
```

## Cum să îl compilezi singur
- Trebuie descărcat întreg proiectul, dacă nu dorești să faci schimbări în documentele TeX
- Recomand să folosești XeLaTeX, pentru că asta am folosit și eu când am cpmpilat PDF-urile

## TODO
- Corectat pentru greșeli gramaticale (în progres)
- Trecut la noul format (ex: cu preambul centralizat etc.) (în progres)
- Făcut un document mare, sub formă de carte, care să conțină tot (în progres)

# Licență
Am ales ceva extrem de permisiv pentru că ceea ce e scris în documente nu îmi aparține până la urmă. Licența este [WTFPL](http://www.wtfpl.net).

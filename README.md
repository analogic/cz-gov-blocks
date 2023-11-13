CZ-GOV-BLOCKS
=============

Nástroj určený zejména pro účely ISP a archivaci blokovaných domén dle příslušných zákonů ČR.

Aktualizace dat je prováděna automatickým spuštěním každý den pomocí [skriptu GitHub Actions](https://github.com/analogic/cz-gov-blocks/blob/master/.github/workflows/daily.yml)

Zdroje
------
- MFČR - Seznam nepovolených internetových her, https://www.mfcr.cz/assets/cs/media/Zverejnovane-udaje-ze-Seznamu-nepovolenych-internetovych
- SÚKL - Internetové stránky s nelegálními nabídkami neschválených přípravků, https://www.sukl.cz/leciva/webove-stranky-s-nelegalnimi-nabidkami-leciv
- ÚSKVBL -  Seznam stránek s nelegální nabídkou VLP, https://uskvbl.cz/cs/inspekce/nelegalni-vlp
- SZPI - Weby s nabídkou nebezpečných potravin, https://www.szpi.gov.cz/clanek/seznam-blokovanych-webu.aspx

Výstupy
-------
- original/ - aktualizované a nezprocesované originály
- csv/ - seznamy blokovaných domén dle jednotlivých zdrojů
- rpz/ - seznamy konvertované do zónových souborů přímo pro Knot resolver

Při použití všech seznamů stačí pouze denně stahovat soubor [all.rpz](https://raw.githubusercontent.com/analogic/cz-gov-blocks/master/rpz/all.rpz).



CZ-GOV-BLOCKS
=============

A tool designed especially for ISP purposes and archiving of blocked domains according to the relevant laws of the Czech Republic.

Data update is performed by automatic launching every day using [GitHub Actions script](https://github.com/analogic/cz-gov-blocks/blob/master/.github/workflows/daily.yml)

Resources
------
- MFČR - List of unauthorized Internet games, https://www.mfcr.cz/assets/cs/media/Zverejnovane-udaje-ze-Seznamu-nepovolenych-internetovych
- SÚKL - Website with illegal offers of unapproved products, https://www.sukl.cz/leciva/webove-stranky-s-nelegalnimi-nabidkami-leciv
- ÚSKVBL - List of websites with illegal offer of VLP, https://uskvbl.cz/cs/inspekce/nelegalni-vlp
- SZPI - List of websites offering unsafe food, https://www.szpi.gov.cz/clanek/seznam-blokovanych-webu.aspx

Outputs
-------
- original/ - updated and unprocessed originals
- csv/ - lists of blocked domains by individual sources
- rpz/ - lists converted to zone files directly for Knot resolver

When using all lists, you only need to download the [all.rpz](https://raw.githubusercontent.com/analogic/cz-gov-blocks/master/rpz/all.rpz) file daily.

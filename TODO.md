# Vor dem Public-Flip (diese Datei wird davor gelöscht)

Die vier Kacheln in `assets/` sind aktuell Design-Previews. Ersetzen durch
echte Screenshots, dann veröffentlichen.

## 1. Screenshots schießen

Setup für alle vier identisch:

- GNOME dark, Theme **Perpetual Rain** (Default)
- Gleiche Fenstergröße für alle vier Shots (z. B. 1600×1000)
- Bibliothek mit vollständigen Covern, ein Track **spielend**
  (Waveform + Cover-Accent in der Player-Bar sichtbar)

| Datei | Motiv |
|---|---|
| `assets/shot-01.png` | Track-Library: Spaltenansicht + Info-Panel rechts |
| `assets/shot-02.png` | Album-Grid mit Detail-Panel (Track mit farbigem Cover spielend) |
| `assets/shot-03.png` | Artist-Seite (Master/Detail, Hero + Alben + Top Tracks) |
| `assets/shot-04.png` | My Stats (Stunden, Top-Listen, 12-Monats-Chart) |

Gleiche Dateinamen behalten, PNG, ~1600 px Breite reicht.

## 2. README anpassen

- Die Zeile mit „Interface previews from the design system … landing here
  shortly." aus `README.md` löschen.
- Captions unter den Bildern prüfen — stimmen sie noch mit den echten
  Shots überein?

## 3. Veröffentlichen

```sh
git rm TODO.md
git add -A && git commit -m "docs: replace design previews with real screenshots"
git push
gh repo edit marvinbaudach/reprise-showcase --visibility public --accept-visibility-change-consequences
```

## 4. Pinnen (nur Web-UI möglich)

Die GitHub-API kann Profil-Pins nicht setzen:

1. <https://github.com/marvinbaudach> öffnen
2. „Customize your pins" → `reprise-showcase` anhaken

<div align="center">

<picture>
  <source media="(prefers-color-scheme: light)" srcset="assets/wordmark-light.svg">
  <img src="assets/wordmark.svg" alt="Reprise" width="300">
</picture>

<p><strong>Ein nativer GTK4-/libadwaita-Musikplayer für GNOME in Rust — und ein Testfeld für einen portablen Core mit schlanken nativen Frontends.</strong></p>

<p><a href="README.md">English</a> · <a href="README.de.md">Deutsch</a></p>

<p>
  <img src="https://img.shields.io/badge/Rust-Edition%202021-22262b?style=flat-square&logo=rust&logoColor=e7e9ec&labelColor=16181b" alt="Rust Edition 2021">
  <img src="https://img.shields.io/badge/GTK4-libadwaita-22262b?style=flat-square&labelColor=16181b" alt="GTK4 / libadwaita">
  <img src="https://img.shields.io/badge/Produktcode-176.9k%20Zeilen-22262b?style=flat-square&labelColor=16181b" alt="176.900 Zeilen Produktcode">
  <img src="https://img.shields.io/badge/Testcode-64.5k%20Zeilen-22262b?style=flat-square&labelColor=16181b" alt="64.500 Zeilen Testcode">
  <img src="https://img.shields.io/badge/Tests-2%2C693%20bestanden-22262b?style=flat-square&labelColor=16181b" alt="2.693 bestandene Tests">
  <img src="https://img.shields.io/badge/Clippy-0%20Warnungen-22262b?style=flat-square&labelColor=16181b" alt="Clippy: 0 Warnungen">
  <img src="https://img.shields.io/badge/Status-aktiv-33c9a3?style=flat-square&labelColor=16181b" alt="Status: aktiv">
</p>

<p><sub>Gestartet am 11. Juli 2026 · aktives Portfolio-Projekt · noch kein öffentliches Release · Evidenz aktualisiert am 2. August 2026</sub></p>

</div>

Reprise denkt zuerst an lokale Musiksammlungen: virtualisierte Ansichten für
große Bibliotheken, ernsthafte Metadatenwerkzeuge, Hörstatistiken, Android-Sync
und eine enge GNOME-Integration. Gleichzeitig ist das Produkt ein
Architekturexperiment: Das Domänenverhalten lebt in einem plattformneutralen
Rust-Core; für jede Frontend-Familie bleibt nur ihre bewusst gewählte UI- und
Integrationsschicht.

## Oberfläche

<table>
  <tr>
    <td width="50%">
      <img src="assets/shot-library.png" alt="Track-Bibliothek mit aktivem Suchfilter, persistenten sortierbaren Spalten, laufendem Track und Warteschlange">
      <p align="center"><sub>Bibliothek — Filter über alle Felder in 1.702 Tracks, persistente sortierbare Spalten, live Warteschlange</sub></p>
    </td>
    <td width="50%">
      <img src="assets/shot-visuals.png" alt="Now-Playing-Panel mit audioreaktiven Balken aus dem laufenden Wiedergabespektrum">
      <p align="center"><sub>Song Visuals — audioreaktives Panel aus dem laufenden Wiedergabespektrum</sub></p>
    </td>
  </tr>
  <tr>
    <td width="50%">
      <img src="assets/shot-stats.png" alt="My-Stats-Seite mit Hörstunden, Wochenverlauf, meistgespielter Band und meistgespielten Songs">
      <p align="center"><sub>My Stats — Hörstunden, beste Woche, meistgespielte Band und Songs</sub></p>
    </td>
    <td width="50%">
      <img src="assets/shot-settings.png" alt="Einstellungsdialog auf der Plugins-Seite: lokale Funktionen und Online-Integrationen als einzeln aktivierbare Schalter">
      <p align="center"><sub>Einstellungen — jede Online-Integration ist ein eigenes, freiwillig aktiviertes Modul</sub></p>
    </td>
  </tr>
</table>

<p align="center"><sub>Aufnahmen der laufenden App unter GNOME (dunkel, Standard-Theme <em>Perpetual Rain</em>), gegen eine echte Bibliothek mit 1.702 Tracks.</sub></p>

## Heutiger Produktumfang

| Bereich | Gebaut |
|---|---|
| Bibliothek | SQLite-Katalog, virtualisierte Track-Tabelle mit Album-/Artist-/Genre-Scopes, rollierendes Recently Added, inkrementelle Scans, Live-Watcher sowie Move- und Missing-Erkennung |
| Wiedergabe und Visuals | GStreamer mit Gapless/Crossfade, Equalizer, ReplayGain, Queue, Shuffle/Repeat, Waveform-Seeking und 64 Neon-Balken aus einer CAVA-PCM-Pipeline vor ReplayGain |
| Metadaten und Cover | Multi-Track-Bearbeitung, die nur geänderte Felder schreibt, MusicBrainz-Lookup, eingebettete/Ordner-/Cover-Art-Archive-Cover und albumweite Cover-Konsistenz ohne Schreibzugriff auf Musikdateien |
| Suche und Organisation | Vollfeldsuche, Filter-Chips, persistente benutzerdefinierte Spalten einschließlich Hinzugefügt, manuelle/smarte Playlists sowie M3U-Import und -Export |
| Statistiken und Lyrics | Zeitraumbezogene Hörgeschichte mit Trends, bester Woche, Bands, Songs und Genres; synchronisierte/statische Lyrics mit gecachtem LRCLIB-Lookup |
| Podcasts und Radio | RSS- und YouTube-Abos, bedingte Aktualisierung/Downloads, Resume-/Played-Status, rückgängig löschbare Episoden sowie Radio-Browser/manuelle Sender mit externer Wiedergabe und MPRIS |
| Konzerte und Releases | Optionale Konzert- und Neuerscheinungssuche mit persistenten Filtern, Hintergrundaktualisierung, eigenen Ansichten und einer gemeinsamen Updates-Oberfläche |
| Desktop und Dienste | MPRIS-Medientasten, Quick Settings, Benachrichtigungen, Sperrbildschirm-Metadaten, Themes, Cover-Akzent sowie unabhängige ListenBrainz-/Last.fm-Module mit Keyring-Credentials und Offline-Queues |
| Android-Geräte | Playlist-spiegelnder MTP-Delta-Sync mit Speicher/Tempo/Fortschritt, Abbruch, sicheren Löschungen nur im verwalteten Bereich und optionalem Opus-Transcoding mit 256 kbit/s |
| Instrumentalfassungen | Experimentelle Opt-in-Stem-Separation über einen separat paketierten Worker mit geprüfter Runtime-Bereitschaft, Staging-Preview, Speichern/Verwerfen und dauerhafter KI-Provenienz |
| CLI- und MCP-Adapter | Headless-Befehle für Bibliothek/Suche/Playlists/Scan/Instrumentals sowie capability-gesteuerter, pfadsicherer MCP-Zugriff auf Playlists, Quellen, Discovery, Gerätesync, Instrumentals und optionale Wiedergabe |
| Migration und Sicherheit | Einmaliger Rhythmbox-Import, Session-Restore ohne Autoplay, Missing-/Import-Flows, nur Datenbank-Remove und bestätigter Papierkorb |

## Architektur: ein Core, native Ränder

![Reprise-Architektur und Roadmap: Das heutige native GNOME-Frontend und der Linux-Adapter umgeben den portablen Core; als Nächstes folgt Android nativ mit Kotlin, danach ein gemeinsames Tauri-2-Desktop-Frontend für KDE/Linux, Windows und macOS.](assets/reprise-architecture-de.svg)

| Crate | Verantwortung | Erzwungene Grenze |
|---|---|---|
| `reprise-core` | Bibliothek, Datenbank-Facades, Queue-Semantik, Playlists, Settings, Module und Plattformverträge | Keine GTK-, libadwaita-, GStreamer-, zbus- oder GLib-Abhängigkeit |
| `reprise-gnome` | GTK4-/libadwaita-Komposition, native Interaktionen, Accessibility, Theme und Präsentation | Kein produktives SQL, blockierendes HTTP, direkte GStreamer-Kopplung oder ungeprüftes Unsafe |
| `reprise-platform-linux` | Linux-Implementierungen für Audio, Medienintegration, Geräte, Waveforms und Papierkorb | Implementiert die Core-Verträge; UI-Code erhält Interfaces |
| `reprise-cli` | Headless-Befehle über Core-Facades für Bibliothek, Playlists, Scan und Instrumental-Jobs | Keine GUI-Abhängigkeiten oder duplizierten Produktregeln |
| `reprise-mcp` | Lokale stdio-Tools und pfadsichere Ressourcen mit expliziten Lese-/Schreib-Capabilities | Kein produktives SQL, keine impliziten Mutationen und keine Pfad-/Credential-Leaks |
| `reprise-stems` | Portable Stem-Separation und geprüfte Modell-/Runtime-Bereitstellung | Keine GUI-, Datenbank- oder Playback-Kopplung |

Die heutige GTK-App beweist die Grenze. Als nächste Frontend-Stufe folgt
Android nativ mit Kotlin. Danach ist ein gemeinsames `Tauri 2`-Desktop-
Frontend für KDE/Linux, Windows und macOS geplant. Diese Roadmap-Stufen sind
nicht ausgeliefert; das gemeinsame Desktop-Frontend ersetzt weder die native
GNOME- noch die Android-Erfahrung.

## Performance: messen, ändern, vergleichen

Performance-Arbeit beginnt mit generierter Evidenz, nicht mit Bauchgefühl.
Release-Benchmarks erzeugen isolierte Metadatenprofile mit 10.000 und 100.000
Tracks, behalten stabiles JSON samt Commit-/Build-Manifest, verweigern
bestehende Ausgabeordner und berühren weder Musikdateien noch eine reale
Benutzerdatenbank.

Die erste benchmarkgetriebene Optimierung ersetzte Full Scan plus temporäre
Sortierung durch einen partiellen `NOCASE`-Titelindex. Der akzeptierte
Same-Host-Vergleich mit 100.000 Tracks maß:

![Reprise-Performance bei 100.000 Tracks: Ein partieller Titelindex ohne Beachtung der Groß-/Kleinschreibung ersetzt Full Scan und temporäre Sortierung, beschleunigt das letzte Titelfenster um den Faktor 40,2 und die Playback-ID-Projektion um 96,33 Prozent; dafür wächst die Datenbank um 9,85 Prozent.](assets/reprise-performance-de.svg)

| Messung | Vorher | Nachher | Ergebnis |
|---|---:|---:|---:|
| Letztes Titel-Fenster mit 200 Zeilen | 53.605 µs | 1.333 µs | **-97,51 %** |
| Projektion der Playback-IDs | 8.125 µs | 298 µs | **-96,33 %** |
| SQLite-Plan | Full Scan + temporärer B-Tree | partieller Index-Scan | temporäre Sortierung entfernt |
| Datenbankgröße | Ausgangswert | +2.379.776 Bytes | **+9,85 %** expliziter Trade-off |

Das Tracklistenmodell bleibt unabhängig davon auf **8 gecachte SQL-Fenster und
1.600 gehaltene Zeilen** begrenzt — gleich bei 10.000 und 100.000 Tracks. Fünf
frische Prozesse maßen 100.000 Queue-Einträge mit einem RSS-Delta von 1.609.728
Bytes beziehungsweise **16,10 Byte/Track**.

```sh
scripts/performance-baseline.sh /tmp/reprise-before
# Kandidatenänderung implementieren und danach deren Commit messen
scripts/performance-baseline.sh /tmp/reprise-after
scripts/performance-query-compare.sh \
  /tmp/reprise-before /tmp/reprise-after > /tmp/query-comparison.json
```

Die vollständige Runtime-Suite beobachtet zusätzlich Startzeit der installierten
App, realisierte GTK-Zeilen/-Zellen, Provider-/Modellzahlen, Queue-Speicher und
eine CUA-gesteuerte Scroll-Reaktion. Sind private D-Bus-/Xvfb-/AT-SPI-Sockets
nicht verfügbar, bricht sie geschlossen ab und fällt nie auf den echten Desktop
zurück. Laufzeiten sind Vergleichsevidenz auf demselben Host, keine portablen
CI-Grenzwerte; deterministische Cache- und Speicherbudgets sind harte Tests.

## Kennzahlen

| Metrik | Aktuelle Evidenz |
|---|---:|
| Rust-Code | 241.421 Zeilen |
| — Produktcode | 176.874 Zeilen |
| — Testcode | 64.547 Zeilen |
| Gezählter Stand | Veröffentlichter `dev@2e5aff6e44` vom 1. August 2026 |
| UX-Verträge | Mehr als 300 aktive Regeln; jede braucht einen regelbenannten Test |
| Qualitätsgates | 17 Merge-Gates einschließlich Workspace-, Display-, Runtime-Bus-, Architektur- und Audit-Prüfungen |

<sub>Die Rust-Zeilen wurden direkt mit dem installierten <code>cloc 2.08</code> auf dem committeten Reprise-Stand <code>dev@2e5aff6e4448246cbe3f1ad122cf8f023537bd69</code> gezählt. Leerzeilen und reine Kommentarzeilen bleiben außen vor. Produkt- und Testcode werden über die expliziten Reprise-Dateikonventionen getrennt (<code>tests/</code>, <code>tests.rs</code>, <code>test_*.rs</code>, <code>*_tests.rs</code>, <code>*_smoke.rs</code> und verwandte Namen); ein eigener Rust-Analyzer wird nicht verwendet.</sub>

## Engineering-Praxis

- **Spec- und testgetrieben.** Wesentliche Arbeit beginnt mit schriftlichen
  Entscheidungen und einem Taskplan. Jeder Task durchläuft Red/Green, einen
  adversarial Diff-Review und einen eigenen Commit.
- **Ein vollständiges Merge-Readiness-Gate.** Formatting, striktes All-Target-Clippy,
  warnungsfreies Rustdoc, vollständige Workspace-Tests, Dependency-Audit,
  Architektur-Policy, UX-Traceability, Motion-Tokens sowie isolierte Display-/
  CSS-Prüfungen laufen gemeinsam.
- **Ein tiefer, mechanisch geprüfter Core.** `cargo tree` beweist die Reinheit.
  Der Architektur-Linter hält außerdem Rust-Dateien unter 800 Zeilen, begrenzt
  UI-Kompositionswurzeln und blockiert Kopplungen, die ein weiteres natives
  Frontend teuer machen würden.
- **UX und Accessibility als Verträge.** Das Regelwerk umfasst Playback,
  Tastatur/Fokus, Feedback, Tooltips, Erreichbarkeit und Motion. Jede aktive
  Regel besitzt einen benannten Test. Alle sieben Motion-Regeln sind aktiv;
  Reduced Motion gewinnt gegen dekorative Animation. Sichtbares Feedback —
  einschließlich des Interaktionsziels unter 100 ms — ist vertraglich
  festgelegt; manuelle und automatisierte Evidenz bleiben klar getrennt.
- **Ehrliche Verifikationsschichten.** Reine Core-Tests, GTK-Einzelprozesse,
  Pointer-Flows unter Xvfb, semantische CUA-/AT-SPI-Flows und manuelle GNOME-/
  Hardwareprüfungen benennen jeweils, was sie beweisen können und was nicht.
- **Gemessene Optimierung.** Performance-Änderungen bringen reproduzierbare
  Vorher-/Nachher-Analysen, Query-Plan-Evidenz, begrenzte Caches und
  Speicherbudgets sowie explizite Indexierungs-Trade-offs mit.
- **Kontrollierte Auslieferung.** Feature-Branches laufen durch PR-Gates nach
  `dev` und danach in das stabile `main`. Isolierte Previews für jeden PR
  sind der nächste geplante Delivery-Schritt.
- **Tools unterstützen den Ablauf; geprüft wird das Ergebnis.** Claude Code
  und Codex bearbeiten klar abgegrenzte Aufgaben nach schriftlichen Vorgaben.
  Übernommen wird eine Änderung erst, wenn alle relevanten Tests und
  Qualitätsprüfungen bestanden sind.

## Architekturrichtung

Reprise soll über die heutige GNOME-App hinauswachsen, ohne Produktregeln zu
duplizieren oder allen Zielen dieselbe UI-Technologie aufzuzwingen. Daraus
folgen drei Richtungen:

- **Android nativ mit Kotlin.** Das nächste nutzerseitige Frontend ist eine
  native Kotlin-App, die Android-Interaktion und -Dienste auf ihrer Seite der
  Core-Grenze besitzt.
- **Ein Tauri-2-Desktop-Frontend.** Nach Android zielt eine gemeinsame
  Desktop-UI auf KDE/Linux, Windows und macOS und nutzt dieselben Rust-Domänen-
  und Runtime-Grenzen.
- **MCP- und CLI-Adapter.** Bibliothek, Playlists, Queue und Wiedergabe nutzen
  bereits schmale Adapter über dieselbe getestete Anwendungsschicht.
  Capabilities bleiben explizit, wo passend standardmäßig read-only, und
  dürfen weder lokale Pfade noch Credentials versehentlich preisgeben.

Android und Tauri sind Roadmap-Ziele, keine ausgelieferten Features. Die
Roadmap endet mit diesen benannten Zielen; ihr Wert liegt in einem gemeinsamen
Domänenmodell, ohne Plattform-UX oder Sicherheitsregeln zu schwächen.

## Quelltext und Kontakt

Der Produktionsquelltext ist privat, um eine kommerzielle Option zu erhalten.
Dieses öffentliche Repository dokumentiert Produkt, Architektur und
überprüfbare Engineering-Evidenz; ein Code-Walkthrough ist nur ein Gespräch
entfernt.

**Marvin Baudach** · m.baudach@pm.me · [linkedin.com/in/marvin-baudach](https://www.linkedin.com/in/marvin-baudach)

---

<p align="center"><sub>© 2026 Marvin Baudach · m.baudach@pm.me · <a href="https://www.linkedin.com/in/marvin-baudach">linkedin.com/in/marvin-baudach</a></sub></p>

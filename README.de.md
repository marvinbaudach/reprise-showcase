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
  <img src="https://img.shields.io/badge/Produktcode-108.1k%20Zeilen-22262b?style=flat-square&labelColor=16181b" alt="108.100 Zeilen Produktcode">
  <img src="https://img.shields.io/badge/Testcode-67.2k%20Zeilen-22262b?style=flat-square&labelColor=16181b" alt="67.200 Zeilen Testcode">
  <img src="https://img.shields.io/badge/Tests-2%2C693%20bestanden-22262b?style=flat-square&labelColor=16181b" alt="2.693 bestandene Tests">
  <img src="https://img.shields.io/badge/Clippy-0%20Warnungen-22262b?style=flat-square&labelColor=16181b" alt="Clippy: 0 Warnungen">
  <img src="https://img.shields.io/badge/Status-aktiv-33c9a3?style=flat-square&labelColor=16181b" alt="Status: aktiv">
</p>

<p><sub>Gestartet am 11. Juli 2026 · aktives Portfolio-Projekt · noch kein öffentliches Release · Evidenz aktualisiert am 27. Juli 2026</sub></p>

</div>

Reprise denkt zuerst an lokale Musiksammlungen: virtualisierte Ansichten für
große Bibliotheken, ernsthafte Metadatenwerkzeuge, Hörstatistiken, Android-Sync
und eine enge GNOME-Integration. Gleichzeitig ist das Produkt ein
Architekturexperiment: Das Domänenverhalten lebt in einem plattformneutralen
Rust-Core; jede Plattform soll nur eine kleine, wirklich native UI- und
Integrationsschicht ergänzen.

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

![Reprise-Architektur: Das GTK-Frontend sendet Befehle und Queries an den portablen Core; der Linux-Adapter implementiert dessen Playback-, Medien-, Geräte- und Analyseverträge; GUI- und Host-Abhängigkeiten sind im Core mechanisch verboten.](assets/reprise-architecture-de.svg)

| Crate | Verantwortung | Erzwungene Grenze |
|---|---|---|
| `reprise-core` | Bibliothek, Datenbank-Facades, Queue-Semantik, Playlists, Settings, Module und Plattformverträge | Keine GTK-, libadwaita-, GStreamer-, zbus- oder GLib-Abhängigkeit |
| `reprise-gnome` | GTK4-/libadwaita-Komposition, native Interaktionen, Accessibility, Theme und Präsentation | Kein produktives SQL, blockierendes HTTP, direkte GStreamer-Kopplung oder ungeprüftes Unsafe |
| `reprise-platform-linux` | Linux-Implementierungen für Audio, Medienintegration, Geräte, Waveforms und Papierkorb | Implementiert die Core-Verträge; UI-Code erhält Interfaces |
| `reprise-cli` | Headless-Befehle über Core-Facades für Bibliothek, Playlists, Scan und Instrumental-Jobs | Keine GUI-Abhängigkeiten oder duplizierten Produktregeln |
| `reprise-mcp` | Lokale stdio-Tools und pfadsichere Ressourcen mit expliziten Lese-/Schreib-Capabilities | Kein produktives SQL, keine impliziten Mutationen und keine Pfad-/Credential-Leaks |
| `reprise-stems` | Portable Stem-Separation und geprüfte Modell-/Runtime-Bereitstellung | Keine GUI-, Datenbank- oder Playback-Kopplung |

Das ist bewusst keine gemeinsame Web-Shell. Der Rust-Core besitzt Daten und
Verhalten; plattformspezifische Frontends besitzen native Interaktionsmuster.
Die GTK-App beweist die Grenze heute. Weitere Frontends sind eine Roadmap-
Richtung und keine bereits ausgelieferte Behauptung.

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
| Rust-Code | 175.286 Zeilen |
| — Produktcode | 108.095 Zeilen |
| — Testcode | 67.191 Zeilen |
| Standard-Workspace-Lauf | 2.693 bestandene Tests; 2 Radio-MCP-Loopback-Fixtures durch Sandbox-TCP-Rechte blockiert |
| Tests mit kontrollierten Bedingungen | 305 GNOME-Display-/Host-Tests explizit vom Standardlauf getrennt |
| UX-Verträge | 165 aktive Regeln; jede braucht einen regelbenannten Test |
| Code-Gates | Formatting, striktes Clippy, Core-Reinheit, Architektur, Accessibility, Input, Motion, UX-Traceability und Audit bestehen auf dem gezählten `dev`-Stand |

<sub>Die Rust-Zeilen wurden vom committeten Reprise-<code>dev</code>-Stand <code>144672eaefed5a8b7b8fc5e3eb6e2d54a08fae0d</code> mit cloc 2.08 und dem reproduzierbaren, <code>#[cfg(test)]</code>-fähigen Analyzer gezählt. Leerzeilen und reine Kommentarzeilen bleiben außen vor; Produkt- und Testcode werden getrennt ausgewiesen.</sub>

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

Die CLI- und MCP-Adapter belegen inzwischen, dass Reprise dieselbe getestete
Anwendungsschicht ohne eingebettetes GTK-Frontend anbieten kann. Ihre
Capabilities sind explizit, datenverändernde Tools standardmäßig deaktiviert
und Antworten werden auf lokale Pfad- und Credential-Leaks geprüft.

Die nächste Architekturrichtung ist ein schlankes natives Frontend für eine
weitere Plattform. Es soll den Rust-Core wiederverwenden und die passenden
Interaktionsmuster und Plattformdienste selbst implementieren — statt Reprise
in eine gemeinsame Web-Shell zu verwandeln oder Produktregeln zu duplizieren.

## Quelltext und Kontakt

Der Produktionsquelltext ist privat, um eine kommerzielle Option zu erhalten.
Dieses öffentliche Repository dokumentiert Produkt, Architektur und
überprüfbare Engineering-Evidenz; ein Code-Walkthrough ist nur ein Gespräch
entfernt.

**Marvin Baudach** · m.baudach@pm.me · [linkedin.com/in/marvin-baudach](https://www.linkedin.com/in/marvin-baudach)

---

<p align="center"><sub>© 2026 Marvin Baudach · m.baudach@pm.me · <a href="https://www.linkedin.com/in/marvin-baudach">linkedin.com/in/marvin-baudach</a></sub></p>

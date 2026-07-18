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
  <img src="https://img.shields.io/badge/Produktcode-58.1k%20Zeilen-22262b?style=flat-square&labelColor=16181b" alt="58.1k Zeilen Produktcode">
  <img src="https://img.shields.io/badge/Testcode-30.7k%20Zeilen-22262b?style=flat-square&labelColor=16181b" alt="30.7k Zeilen Testcode">
  <img src="https://img.shields.io/badge/Tests-1%2C482%20bestanden-22262b?style=flat-square&labelColor=16181b" alt="1.482 bestandene Tests">
  <img src="https://img.shields.io/badge/Clippy-0%20Warnungen-22262b?style=flat-square&labelColor=16181b" alt="Clippy: 0 Warnungen">
  <img src="https://img.shields.io/badge/Status-aktiv-33c9a3?style=flat-square&labelColor=16181b" alt="Status: aktiv">
</p>

<p><sub>Gestartet am 11. Juli 2026 · aktives Portfolio-Projekt · noch kein öffentliches Release</sub></p>

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
      <img src="assets/shot-01.png" alt="Track-Bibliothek mit sortierbaren Spalten und Metadatenpanel">
      <p align="center"><sub>Track-Bibliothek — persistente sortierbare Spalten, Metadatenpanel, Bibliothekszustand</sub></p>
    </td>
    <td width="50%">
      <img src="assets/shot-02.png" alt="Albumraster mit Detailpanel und Cover-Akzent">
      <p align="center"><sub>Albumraster — Detailpanel und aus dem Cover abgeleiteter Player-Akzent</sub></p>
    </td>
  </tr>
  <tr>
    <td width="50%">
      <img src="assets/shot-03.png" alt="Artist-Seite mit Alben und Top-Tracks">
      <p align="center"><sub>Artist-Seiten — Alben, Top-Tracks und Hörverlauf</sub></p>
    </td>
    <td width="50%">
      <img src="assets/shot-04.png" alt="Hörstatistik mit Top-Artists und Aktivitätsdiagramm">
      <p align="center"><sub>My Stats — Hörstunden, Top-Artists und -Alben, Aktivitätsdiagramm</sub></p>
    </td>
  </tr>
</table>

<p align="center"><sub>Designsystem-Previews, keine erfundenen Laufzeit-Screenshots. Aufnahmen der laufenden App ersetzen sie nach der nativen GNOME-Sichtprüfung.</sub></p>

## Heutiger Produktumfang

| Bereich | Gebaut |
|---|---|
| Bibliothek | SQLite-Katalog, virtualisierte Track-/Album-/Artist-Ansichten, inkrementelle Scans, Live-Watcher sowie Move- und Missing-Erkennung |
| Wiedergabe | GStreamer mit Gapless, Crossfade, Zehnband-Equalizer, ReplayGain, Queue, Shuffle/Repeat und Waveform-Seeking |
| Metadaten | Multi-Track-Tag-Editor, der nur geänderte Felder schreibt, MusicBrainz-Lookup, eingebettete/lokale/Online-Cover |
| Suche und Organisation | Vollfeldsuche, Filter-Chips, persistente Spalten, manuelle/smarte Playlists, M3U-Import und -Export |
| Lyrics und Discovery | Synchronisierte/statische Lyrics, gecachter LRCLIB-Lookup, optionale Artist- und Album-News |
| Desktop | MPRIS-Medientasten, Quick Settings, Benachrichtigungen, Sperrbildschirm-Metadaten, Themes und Cover-Akzent |
| Geräte | Android-MTP-Browsing und Delta-Sync mit Fortschritt, Abbruch, Playlists und optionalem Opus-Transcoding |
| Dienste | Unabhängige, standardmäßig deaktivierte ListenBrainz-/Last.fm-Module mit Keyring-Credentials und Offline-Queues |
| Migration und Sicherheit | Einmaliger Rhythmbox-Import, Session-Restore ohne Autoplay, Missing-/Import-Flows, nur Datenbank-Remove, bestätigter Papierkorb |

## Architektur: ein Core, native Ränder

![Reprise-Architektur: Das native GNOME-Frontend und künftige Frontends nutzen einen portablen Core; ein separater Linux-Adapter liefert GStreamer, MPRIS, MTP und Host-Integration.](assets/reprise-architecture.svg)

| Crate | Verantwortung | Erzwungene Grenze |
|---|---|---|
| `reprise-core` | Bibliothek, Datenbank-Facades, Queue-Semantik, Playlists, Settings, Module und Plattformverträge | Keine GTK-, libadwaita-, GStreamer-, zbus- oder GLib-Abhängigkeit |
| `reprise-gnome` | GTK4-/libadwaita-Komposition, native Interaktionen, Accessibility, Theme und Präsentation | Kein produktives SQL, blockierendes HTTP, direkte GStreamer-Kopplung oder ungeprüftes Unsafe |
| `reprise-platform-linux` | Linux-Implementierungen für Audio, Medienintegration, Geräte, Waveforms und Papierkorb | Implementiert die Core-Verträge; UI-Code erhält Interfaces |

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

![Reprise-Performance bei 100.000 Tracks: Das letzte Titelfenster wurde um 97,51 Prozent schneller, die Playback-ID-Projektion um 96,33 Prozent; der Cache bleibt auf acht SQL-Fenster und 1.600 Zeilen begrenzt, der Index kostet 9,85 Prozent zusätzlichen Datenbankspeicher.](assets/reprise-performance.svg)

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
| Rust-Code | 88.789 Zeilen |
| — Produktcode | 58.053 Zeilen |
| — Testcode | 30.736 Zeilen |
| Workspace-Gate | 1.482 bestandene Tests: 758 Core · 669 GNOME · 55 Linux-Plattform |
| Tests mit kontrollierten Bedingungen | 139 vom Standardlauf getrennt, darunter 138 GNOME-Display-/Host-Tests |
| UX-Verträge | 60 aktive Regeln; jede braucht einen regelbenannten Test |
| Qualitätsgates | 12 harte Merge-Gates plus Release-/Packaging-Prüfungen |

<sub>Die Rust-Zeilen wurden beim Abschluss der Performance-Arbeit mit dem reproduzierbaren, <code>#[cfg(test)]</code>-fähigen Analyzer des Bewerbungs-/CV-Repositories auf dem committeten Stand gezählt. Leerzeilen und reine Kommentarzeilen bleiben außen vor; Produkt- und Testcode werden getrennt ausgewiesen.</sub>

## Engineering-Praxis

- **Spec- und testgetrieben.** Wesentliche Arbeit beginnt mit schriftlichen
  Entscheidungen und einem Taskplan. Jeder Task durchläuft Red/Green, einen
  adversarial Diff-Review und einen eigenen Commit.
- **Zwölf harte Merge-Gates.** Formatting, striktes All-Target-Clippy,
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
  Reduced Motion gewinnt gegen dekorative Animation.
- **Ehrliche Verifikationsschichten.** Reine Core-Tests, GTK-Einzelprozesse,
  Pointer-Flows unter Xvfb, semantische CUA-/AT-SPI-Flows und manuelle GNOME-/
  Hardwareprüfungen benennen jeweils, was sie beweisen können und was nicht.
- **Agent-orchestriert, durch Gates kontrolliert.** Claude Code und Codex
  implementieren begrenzte Tasks gegen die schriftlichen Verträge. Tests und
  Gates sind die Merge-Autorität, nicht generiertes Selbstvertrauen.

## Roadmap: derselbe Core über den heutigen Player hinaus

Die folgenden Punkte sind Architekturziele, keine ausgelieferten Features.

| Richtung | Geplante Naht | Nicht verhandelbare Grenze |
|---|---|---|
| **MCP-Server** | Schmaler Adapter über Core-Queries, Playlists, Queue und Playback-Verträge | Explizite Capabilities, standardmäßig read-only, keine Pfad-/Credential-Leaks |
| **KI-generierte Musik** | Providerneutrales optionales Modul; Ergebnisse laufen durch den normalen Importpfad | Herkunft und explizite Benutzeraktion; niemals stille Bibliotheksmutation |
| **Visuelle KI-Effekte** | Plattform-Analysevertrag plus nativer Renderer je Frontend | Begrenzte Arbeit, kein Blockieren des Audio-Threads, High-Contrast-Fallback, Reduced Motion/Off gewinnt |
| **Schlanke native Frontends** | SwiftUI, WinUI, Mobile oder ein anderes Linux-Toolkit nutzt den MIT-Rust-Core und liefert Plattformimplementierungen | Native Interaktionsmuster statt UI auf dem kleinsten gemeinsamen Nenner |
| **Distribution** | Flatpak-/Flathub-Paketierung, vollständiges gettext und reale GNOME-Abnahme | Kein Release-Claim ohne Packaging-, Übersetzungs-, Display-, Audio-, Portal- und Hardware-Evidenz |

Das vorhandene Modulregister und die Playback-/Media-/Waveform-Verträge sind
die Ausgangsnähte. Experimentelles KI- und Agent-Verhalten bleibt außerhalb
des Core-Domänenmodells, bis Interfaces und Sicherheitsregeln bewiesen sind.

## Quelltext und Kontakt

Der Produktionsquelltext ist privat, um eine kommerzielle Option zu erhalten.
Dieses öffentliche Repository dokumentiert Produkt, Architektur und
überprüfbare Engineering-Evidenz; ein Code-Walkthrough ist nur ein Gespräch
entfernt.

**Marvin Baudach** · m.baudach@pm.me · [linkedin.com/in/marvin-baudach](https://www.linkedin.com/in/marvin-baudach)

---

<p align="center"><sub>© 2026 Marvin Baudach · m.baudach@pm.me · <a href="https://www.linkedin.com/in/marvin-baudach">linkedin.com/in/marvin-baudach</a></sub></p>

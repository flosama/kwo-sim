Big Picture
===

[TOC]

# Abstract
***tbd***

# Problemdefinition
## Kontext
Die Kraftwerke Oberhasli AG (KWO) sind ein wichtiger Teil der Schweizer Stromversorgung mit Sitz in Innertkirchen. Derzeit unterhält die KWO neun Wasserkraftwerke. Energie wird von Turbinen produziert, die mit Wasser von acht Speicherseen angetrieben werden, wobei der Niveauunterschied zwischen See und Kraftwerk genutzt wird. 

Ein Teil der Seen wird als Pumpspeicher genutzt. Dabei wird Wasser in die Seen hinaufgepumpt, wenn ein Energieüberschuss besteht. Bei erhöhtem Energiebedarf wird es wieder zum Antrieb von Turbinen benutzt.

Insgesamt liefern die Anlagen eine Leistung von 2350 GWh pro Jahr.
Die Tagesleistung ist bestimmt durch einen von den BKW Energie AG (BKW) vorgegebenen Fahrplan. Die geforderte Leistung wird dabei auf alle Anlagen verteilt. Die Kraftwerke und Speicherseen liegen in alpinem Gelände in einem Umkreis von ca. 25 km.
[tbc ?]

![Anlageschema der KWO](http://sinv-56018.edu.hsr.ch/attachments/2014/03/140316151415_anlageschema.png)
> Analgeschema der KWO; Quelle: http://www.grimselstrom.ch/info/grimselstrom/kennzahlen-und-geschaeftsbericht/ (16.03.2014)

Die Steuerung und Überwachung aller einzelnen Anlagen erfolgt dabei zentral im Kontrollzentrum in Innertkirchen. Das heisst: Alle Informationen aus den Kraftwerken wie z.B. Pegelstände der Seen, Aktivität der Turbinen, erzeugte Leistung etc. laufen hier zusammen. Ebenfalls wird das Ein- und Ausschalten von Anlagen (z.B. Öffnen und Schliessen von Druckwasserleitungen) und deren Regelung vom Kontrollzentrum gesteuert. Sämtliche Kommunikation läuft über einen redundant ausgelegten Steuer-Server mit einer angeschlosenen Visualisierungseinheit, die über das Kontrollzentrum bedient wird. Der Kommunikations-Endpunkt auf Kraftwerk-/Speichersee-Seite wird als "Automatisierungseinheit" bezeichent. Die Daten zwischen Kraftwerken/Speicherseen und Kontrollzentrum laufen über ein Netzwerk "Leittechnik", das von den Netzwerken für die übrigen Dienste (Telefonie, Mail etc.) separiert ist.

Zur Übertragung der Daten sind LWL-Glasfaserleitungen von der Zentrale in Inntertkirchen zu allen Standorten verlegt.

[*tbd: Picture Overview, Kommunikationspfad*]

[Abb.???, Picture Overview] zeigt, dass sich der hauptsächliche Kommunikationspfad in diesem Netzwerk zwischen Kraftwerk- und Speichersee-Standorten zur Zentrale bewegt. Die Kommunikationspfade zwischen den Kraftwerk-Standorten untereinander ist vernachlässigbar.

Das Leittechnik-Netzwerk ist für das Kerngeschäft der KWO von zentraler Bedeutung. Dessen unterbruchsfreie Funktion ist Bedingung für die Stromproduktion, da die Steuerung aller Kraftwerke über dieses Netzwerk erfolgt. Bereits ein kurzer Verbindungsverlust von 5s zu einer Automatisierungseinheit führt dazu, dass die angeschlossenen Maschinen nicht mehr steuerbar sind und weder ein- noch ausgeschaltet werden können. Da die Stromproduktion zudem in einem 24/7-Betrieb erfolgt, sind Netzwerk-Tests auserhalb der Produktionszeit grundsätzlich nicht möglich.

## Problem
Die Anlagen der KWO werden laufend erneuert und ausgebaut. So sind derzeit 3 weitere Kraftwerke in Planung und Bau. Jede Erweiterung der Anlagen zieht auch einen Ausbau des Leittechnik-Netzwerks nach sich, der in das bestehende System integriert werden muss, ohne den laufenden Betrieb zu stören. Aus Netzwerk-Perspektive bedeutet jede Erweiterung einerseits eine Erhöhnung der variablen Netzlast aufgrund von zusätzlichen Knoten, die Verkehr genereieren. Andrerseits wird mit damit aber auch die Grundlast des Netzwerks angehoben, d.h. der Verkehr, der durch Protokolle generiert wird, die das Funktionieren des Netzwerks selbst notwendig sind.

Ausserdem ist, insbesondere im Hinblick auf die 2019 bevorstehende Abschaltung des AKWs Mühleberg, eine Erweiterung um je ein Biomasse- und ein Geothermiekraftwerk geplant. Dies würde, sofern diese Projekte realisiert werden, das Leittechniknetz nochmals stärker belasten und die Komplexität ebenfalls erhöhen.

Am **08.12.2014** bietet sich der KWO anlässlich der Abschaltung aller Kraftwerke die seltene Gelegenheit, ausserbetriebliche Tests am realen Netzwerk durchzuführen. Da das Zeitfenster für die Abschaltung auf einen Tag beschränkt ist, müssen dafür die signifikanten Tests vorab identifiziert werden können.

Somit ist für die KWO ist ein Instrument von Vorteil, mit dem sich Änderungen an der Netzwerk-Infrastruktur vorab auf ihre Auswirkungen prüfen lassen. Ebenfalls soll dieses Instrument Netzwerk-Tests in einem risikofreien Umfeld ermöglichen und damit eine Priorisierung der kritischsten und aussägekräftigsten Tests liefern, die dann auf dem realen Netzwerk durchgeführt werden können. Mit der Abbildung des Leittechnik-Netwerks in einer Simulation soll dieses Instrument im Rahmen der vorliegenden Bachelor-Arbeit zur Verfügung gestellt werden.


# Anforderungen
Aus der Problembeschreibung ergibt sich folgender Auftrag: Die KWO will eine vollständige und funktionstüchtige Abbildung ihres Leittechniknetzes in Form einer OmNet++ Simulation. In dieser Simulation sollen Szenarien aufgesetzt und getestet werden, welche gezielt auf die Kernprobleme dieses Netzwerkes eingehen. Insbesondere sind damit die Konvergenzzeiten von OSPF und STP gemeint, sowie auch allgemeine Lastsimulationen mit Verluststatistiken und die Möglichkeit, geplante Änderungen vorab zu simulieren.

 1. Abbildung des gesamten Leittechniknetzwerkes
 2. Konfiguration der verwendeten Protokolle, insbesondere:
     - OSPF
     - STP
     - TCP/IP
 3. Erstellung von geeigneten Simulationsszenarien, um folgende Eigenschaften zu überprüfen (in absteigender Priorität):
     - Konvergierungszeiten
     - Lastverhalten / Datenverlust
     - Auswirkungen von Topologieänderungen
 4. Eventuell Änderungsvorschläge, falls grössere Mängel in der bisherigen Planung entdeckt werden

Alle Punkte zu bewältigen ist sehr ambitiös. Deshalb müssen nur die ersten beiden Punkte implementiert werden, sprich das Model muss funktionieren, damit die Projektarbeit als erfolgreich gilt.

Das Projekt soll so aufgegleist werden, dass in den Nachfolgemonaten andere Personen (weitere Studenten in einer Nachfolgearbeit oder von der KWO selbst) das Projekt weiterführen können. Dies Bedingt, dass alle Teile gut und verständlich dokmentiert sind.

## Komponenten

### Generell

Das Netzwerk ist einer Campus-LAN Topologie angelehnt. Im allgemeinen werden deshalb die Begriffe eines Campus-LANs verwendet. 

Für alle Komponenten muss mindestens der grundlegende Protokollstack implementiert werden. Dieser Umfasst:

* Ethernet
* IP (mit statischer Konfiguration)
* TCP Unterstützung

Für die Übertragung von Messdaten wird das Standardprotokoll für industrielle Automatisierung IEC 60870-5-104 verwendet. Dies werden wir nicht als solches, sondern wenn überhaupt, dann als TCP-Payload abbilden. Auch sonst werden wir keine eigenen Protokollimplementationen vornehmen.

### Core Netzwerk

**Priorität**: 1

Das Core Netzwerk ist der Backbone des Netzwerkes und besteht aus 4 Switches:

![Core Network](http://sinv-56018.edu.hsr.ch/attachments/2014/03/140314161908_99d354d942ff18f58e6e26b43de1fdae.png)
> Das Core Netzwerk wie es in der KWO implementiert ist. Speziell ist die Richtstrahlverbindung zwischen dem Core Switch Grimsel und dem Core Switch Inn BG.

Es umfasst die folgenden Komponenten

- Core Switch Grimsel
- Core Switch Handeck
- Core Switch Inn BG
- Core Switch Inn UST

Im Core Netzwerk gibt es einen Pfad, welcher über eine Richtstrahlverbindung funktioniert. Diesem Pfad soll spezielle Beachtung geschenkt werden. Er wird als einfache 50 Mbit/s Kupferkabelverbindung implementiert.

#### Implementation

* Routing von IP Traffic
* OSPF mit Areas
* ICMP für Pings
* Einfache SNMP Abfragen (Availability)


### Distribution- und Accessnetzwerke

**Priorität**: 2

Die Access- und Distributionnetzwerke sind am Corenetzwerk angeschlossen und geografisch segmentiert. Die Accessnetzwerke sind als Ringe angelegt und arbeiten mit dem proprietären HyperRing Protokoll von Hirschmann. Bei der Implementation wird mit der Modellierung der Netzwerke Grimsel 2 und Hadeck 2 begonnen.

![Distribution Netzwerk](http://sinv-56018.edu.hsr.ch/attachments/2014/03/140314172813_febc1b803c4516830e3f215195d92127.png)
> Hier zu sehen ist eine Illustration eines typischen Distributionsnetzwerkes anhand des Beispiels von Grimsel 2.

#### Implementation

* Routing von IP Traffic
* OSPF mit Areas
* STP
* ICMP für Pings
* Einfache SNMP Abfragen (Availability)
* Hyperring Protokoll (Hirschmann-proprietär)

### Server

**Priorität**: 3

Auf den drei Servern läuft die zentrale Steuerungssoftware und bilden somit die Herzstücke des Netzwerkes. Sie sind in einem eigenen Access Netzwerk angeschlossen und haben ansonsten keinerlei Nachbaren.

![Server](http://sinv-56018.edu.hsr.ch/attachments/2014/03/140314175600_Server.png)

Ein Dritter Server in einem anderen Access Netzwerk bildet hier einen Spezialfall. Er soll so implementiert werden, dass man ihn in alle Accessnetzwerke hängen könnte, ohne dass sich seine Funktionsweise ändert.

#### Implementation

* Applikationsprotokoll als Stub (das Protokoll wird nicht 1:1 abgebildet)
* Umschalten zwischen Master und Slave (Manuell)
* ICMP für Pings

### Automatisierungseinheiten

**Priorität**: 3

Die Automatisierungseinheiten sind die Steuerungssysteme, für die dieses Netzwerk ausgelegt ist. Sie kommunizieren mit benachbarten Automatisierungseinheiten und mit einem der drei Server.

#### Implementation

* Applikationsprotokoll als Stub 
* ICMP für Pings

### Visualisierungsseinheiten

**Priorität**: 3

Die Visualisierungseinheiten sind die Schnittstellen zu den Personen in der Steuerungszentrale. Fallen sie aus oder verlieren sie die Verbindung zu den Servern, ist die KWO "blind" und kann nichts mehr steuern.

![Visualisierungseinheiten](http://sinv-56018.edu.hsr.ch/attachments/2014/03/140314182122_Visualisiertungseinheit.png)
> Rot Markiert ist hier der typische Pfad zwischen Server und Automatisierungseinheit.

#### Implementation

* Windows Host als Basis
* Applikationsprotokoll als Stub 


## Szenarien

Aus der Problembeschreibung und der Auswertung des Fragenkataloges ergibt sich, Welche Szenarien zu simulieren sind. Dabei wird angegeben, was getestet wird und was dabei gemssen werden soll.

Voraussichtlich sind alle Simulationsszenarien kurzfristiger Natur, weshalb wir unsere Simulation auch daran orientiert implementieren werden. Einzig die Lastanalysen könnten unter Umständen in einer mehrtägigen / saisonal orientierten Simulation besser abgebildet werden.

### Allgemein

### Core Netzwerk

**Priorität**: 1

#### Tests

* _Auslastung von Pfaden (Normal- und Vollast)_: Datenvolumen, Congestions
* _Auslastung von Knoten_: Datenvolumen, Congestions
* _Ausfall von Pfaden/Knoten_: Verhalten, Konvergenzzeiten
* _Auslastung der Richtstrahlverbingung_: Wie hoch ist die Warscheinlichkeit, dass hier Daten fliessen

### Distribution- und Accessnetzwerke

**Priorität**: 2

#### Tests

* _Auslastung von Pfaden (Normal- und Volllast)_: Datenvolumen, Congestions
* _Auslastung von Knoten_:  Datenvolumen, Congestions
* _Ausfall von Knoten_: Verhalten, Konvergenzzeiten

### Server

**Priorität**: 3

#### Tests

* _Auslastung (Normal- und Volllast)_: Datenvolumen, Congestions
* _Ausfall von 1 oder 2 Servern_: Verhalten, Konvergenzzeiten

---Umgebung...


/*

LSN


--CLUSTER
--LINUX / WINDOWS
--ClusterSoftware

--Windows Cluster:
--Feature installieren
--Welche Server sollen CL Knoten sein
--Zugriffsnamen für den Cluster: NTCLUST (--> AD: Computerkonto=
--Client IP Adresse für NTCLUST
--Prüfbericht kann man erstmal überspringen


--HDD, der weder auf Knoten1 oder Knoten2 gehostet wird
--> ISCSI Zielserver


--VHDX erstellen (dyn oder fest)
--Zielname und Serverzuweisen
Datenträger initalisieren und mit 64kb formaiteren , keine Laufwerksbuchstaben zuweeisen
--trennen nicht vergessen!

auf Clients: iscsi Initiator
--als Ziel: die Serverinterne IP Adresse angeben
--Verbinden

Für FO: Mehrheitsentscheid--> Freigabe als Quorum auf DC

DAtenträger in FCL Manager als ClusteredSharedVolume
--> Möglichkeit mehr HDDs einzubinden, da man nicht mehr 
--auf Laufwerksbuchstaben begrenzt ist

---> Prüfbericht erstellen! ohne den, kein SQL Installation
--dieser muss fehlerfrei , aber nicht probemfrei sein.





Netzlaufwerk... muss auf einem anderem Server sein, als einer der Knoten

Wichtig ist:

Vorher Ressourcen festlegen

Netzwerk für Serverkommunikation
Netzwerk für ServerClientKommunikation

Tipp: auch die Netzwerkressource HDD auf das reine Servernetzwerk legen


HDDs.. 

Trenne Daten von Logs pro DB

E:
F:


Z:


Controller

SQLA A SQLB P		SQLA P  SQLB A
Knoten1			Knoten2
16 Kerne	  16 Kerne
256 GB RAM    256 GB RAM



Clustered Shared Volumes

E:  --> C:\CLusterStorage\Volume1 (Verknüpfung

Tipp:
TempDB auch lokal sein
der Pfad muss auch auf beiden Servern identisch angelegt sein...



















*/
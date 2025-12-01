INLÄMNING1 - William Minnert - YH2025 - En liten bokhandel
Detta projekt innehåller en liten relationsdatabas för en bokhandel. Databasen består av fyra tabeller: Kund, Bok, Beställning och Orderrad.

Syftet är att lagra information om:
⦁	vilka kunder som finns
⦁	vilka böcker som säljs
⦁	vilka beställningar som har gjorts
⦁	vilka böcker som ingår i varje beställning

ER-diagram

ER-diagrammet visar:
⦁	Kund (1) —— (N) Beställning  
En kund kan göra flera beställningar, men varje beställning tillhör exakt en kund.
⦁	Beställning (1) —— (N) Orderrad  
En beställning kan innehålla en eller flera orderrader.
⦁	Bok (1) —— (N) Orderrad  
En bok kan förekomma i många orderrader (dvs. säljas i flera beställningar).

Tabellen Orderrad fungerar därmed som en koppling mellan Beställning och Bok, vilket löser många-till-många-relationen alltså att EN beställning innehåller FLERA böcker och EN bok kan finnas i FLERA beställningar.

ER Diagram
<img width="1422" height="1036" alt="ER Diagram WIlliam Minnert YH2025" src="https://github.com/user-attachments/assets/3031e601-4a10-4fc9-8386-d6c6bcaf97ba" />

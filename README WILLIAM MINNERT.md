William Minnert README YH2025

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

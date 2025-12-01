# INLÄMNING1 – William Minnert – YH2025 – En liten bokhandel

Detta projekt innehåller en liten relationsdatabas för en bokhandel.  
Databasen består av fyra tabeller:

- **Kund**
- **Bok**
- **Beställning**
- **Orderrad**

Syftet med databasen är att lagra information om:

- vilka kunder som finns
- vilka böcker som säljs
- vilka beställningar som har gjorts
- vilka böcker och antal som ingår i varje beställning

---

## ER-diagram

ER-diagrammet visar följande relationer:

- **Kund (1) —— (N) Beställning**  
  En kund kan göra flera beställningar, men varje beställning tillhör exakt en kund.

- **Beställning (1) —— (N) Orderrad**  
  En beställning kan innehålla en eller flera orderrader.

- **Bok (1) —— (N) Orderrad**  
  En bok kan förekomma i många orderrader, dvs. samma bok kan säljas i flera olika beställningar.

Tabellen **Orderrad** fungerar därmed som en kopplingstabell mellan **Beställning** och **Bok**.  
Den löser en många-till-många-relation:

- En *beställning* kan innehålla flera *böcker*
- En *bok* kan finnas i flera *beställningar*

Genom att lägga den relationen i en egen tabell (Orderrad) blir modellen normaliserad och flexibel.

ER-diagram
<img width="1422" height="1036" alt="ER Diagram WIlliam Minnert YH2025" src="https://github.com/user-attachments/assets/3031e601-4a10-4fc9-8386-d6c6bcaf97ba" />

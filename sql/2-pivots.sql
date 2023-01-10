-- Pivot showing the population change from 1971 - 2021 by gender
SELECT *
FROM (
    SELECT JAHR, GESCHLECHT_ID, SUM(BEVOELKERUNGSANZAHL) AS anzahl
    FROM FAKT_GESAMTBEVOELKERUNG
    GROUP BY JAHR, GESCHLECHT_ID
)
PIVOT (
    SUM(anzahl)
    FOR GESCHLECHT_ID
    IN (
        1 AS "männlich",
        2 AS "weiblich"
    )
)
ORDER BY jahr;

-- Pivot showing the population change from 1971 - 2021 of a selection of towns in Upper Austria
SELECT *
FROM (
    SELECT JAHR, LAU2_CODE, SUM(BEVOELKERUNGSANZAHL) AS anzahl
    FROM FAKT_GESAMTBEVOELKERUNG
    GROUP BY JAHR, LAU2_CODE
)
PIVOT (
    SUM(anzahl)
    FOR LAU2_CODE
    IN (
        40808 AS "Grieskirchen",
        40101 AS "Linz",
        40201 AS "Steyr",
        40301 AS "Wels"
    )
)
ORDER BY jahr;

-- Pivot showing the population change from 1971-2021 by age group
SELECT *
FROM (
    SELECT JAHR, ALTERSGRUPPE_ID, SUM(BEVOELKERUNGSANZAHL) AS anzahl
    FROM FAKT_GESAMTBEVOELKERUNG
    GROUP BY JAHR, ALTERSGRUPPE_ID
)
PIVOT (
    SUM(anzahl)
    FOR ALTERSGRUPPE_ID
    IN (
        'AGE_0_TO_4' AS "0 BIS 4",
        'AGE_5_TO_9' AS "5 BIS 9",
        'AGE_10_TO_14' AS "10 BIS 14",
        'AGE_15_TO_19' AS "15 BIS 19",
        'AGE_20_TO_24' AS "20 BIS 24",
        'AGE_25_TO_29' AS "25 BIS 29",
        'AGE_30_TO_34' AS "30 BIS 34",
        'AGE_35_TO_39' AS "35 BIS 39",
        'AGE_40_TO_44' AS "40 BIS 44",
        'AGE_45_TO_49' AS "45 BIS 49",
        'AGE_50_TO_54' AS "50 BIS 54",
        'AGE_55_TO_59' AS "55 BIS 59",
        'AGE_60_TO_64' AS "60 BIS 64",
        'AGE_65_TO_69' AS "65 BIS 69",
        'AGE_70_TO_74' AS "70 BIS 74",
        'AGE_75_TO_79' AS "75 BIS 79",
        'AGE_80_TO_84' AS "80 BIS 84",
        'AGE_85_TO_89' AS "85 BIS 89",
        'AGE_90_TO_94' AS "90 BIS 94",
        'AGE_90_PLUS' AS "[Legacy] ÜBER 90",
        'AGE_95_TO_99' AS "95 BIS 99",
        'AGE_100_PLUS' AS "ÜBER 100"
    )
)
ORDER BY jahr;

-- Pivot showing the population change for each town in Upper Austria by gender in the year 2001
SELECT *
FROM (
    SELECT LAU2_NAME, GESCHLECHT_ID, SUM(BEVOELKERUNGSANZAHL) AS anzahl
    FROM FAKT_GESAMTBEVOELKERUNG f
    LEFT JOIN DIM_GEMEINDEN g
    ON f.LAU2_CODE = g.LAU2_CODE
    WHERE JAHR IN (2001)
    GROUP BY LAU2_NAME, GESCHLECHT_ID
)
PIVOT (
    SUM(anzahl)
    FOR GESCHLECHT_ID
    IN (
        1 AS "männlich",
        2 AS "weiblich"
    )
)
ORDER BY LAU2_NAME;

-- Pivot showing the population change for each town in Upper Austria by age group in the year 2001
SELECT *
FROM (
    SELECT LAU2_NAME, ALTERSGRUPPE_ID, SUM(BEVOELKERUNGSANZAHL) AS anzahl
    FROM FAKT_GESAMTBEVOELKERUNG f
    LEFT JOIN DIM_GEMEINDEN g
    ON f.LAU2_CODE = g.LAU2_CODE
    WHERE JAHR IN (2001)
    GROUP BY LAU2_NAME, ALTERSGRUPPE_ID
)
PIVOT (
    SUM(anzahl)
    FOR ALTERSGRUPPE_ID
    IN (
        'AGE_0_TO_4' AS "0 BIS 4",
        'AGE_5_TO_9' AS "5 BIS 9",
        'AGE_10_TO_14' AS "10 BIS 14",
        'AGE_15_TO_19' AS "15 BIS 19",
        'AGE_20_TO_24' AS "20 BIS 24",
        'AGE_25_TO_29' AS "25 BIS 29",
        'AGE_30_TO_34' AS "30 BIS 34",
        'AGE_35_TO_39' AS "35 BIS 39",
        'AGE_40_TO_44' AS "40 BIS 44",
        'AGE_45_TO_49' AS "45 BIS 49",
        'AGE_50_TO_54' AS "50 BIS 54",
        'AGE_55_TO_59' AS "55 BIS 59",
        'AGE_60_TO_64' AS "60 BIS 64",
        'AGE_65_TO_69' AS "65 BIS 69",
        'AGE_70_TO_74' AS "70 BIS 74",
        'AGE_75_TO_79' AS "75 BIS 79",
        'AGE_80_TO_84' AS "80 BIS 84",
        'AGE_85_TO_89' AS "85 BIS 89",
        'AGE_90_TO_94' AS "90 BIS 94",
        'AGE_90_PLUS' AS "[Legacy] ÜBER 90",
        'AGE_95_TO_99' AS "95 BIS 99",
        'AGE_100_PLUS' AS "ÜBER 100"
    )
)
ORDER BY LAU2_NAME;

-- Pivot showing the population change for each age group with their gender in the year 2001
SELECT *
FROM (
    SELECT GESCHLECHT_NAME, ALTERSGRUPPE_ID, SUM(BEVOELKERUNGSANZAHL) AS anzahl
    FROM FAKT_GESAMTBEVOELKERUNG f
    LEFT JOIN DIM_GESCHLECHT g
    ON f.GESCHLECHT_ID = g.GESCHLECHT_ID
    WHERE JAHR IN (2001)
    GROUP BY GESCHLECHT_NAME, ALTERSGRUPPE_ID
)
PIVOT (
    SUM(anzahl)
    FOR ALTERSGRUPPE_ID
    IN (
        'AGE_0_TO_4' AS "0 BIS 4",
        'AGE_5_TO_9' AS "5 BIS 9",
        'AGE_10_TO_14' AS "10 BIS 14",
        'AGE_15_TO_19' AS "15 BIS 19",
        'AGE_20_TO_24' AS "20 BIS 24",
        'AGE_25_TO_29' AS "25 BIS 29",
        'AGE_30_TO_34' AS "30 BIS 34",
        'AGE_35_TO_39' AS "35 BIS 39",
        'AGE_40_TO_44' AS "40 BIS 44",
        'AGE_45_TO_49' AS "45 BIS 49",
        'AGE_50_TO_54' AS "50 BIS 54",
        'AGE_55_TO_59' AS "55 BIS 59",
        'AGE_60_TO_64' AS "60 BIS 64",
        'AGE_65_TO_69' AS "65 BIS 69",
        'AGE_70_TO_74' AS "70 BIS 74",
        'AGE_75_TO_79' AS "75 BIS 79",
        'AGE_80_TO_84' AS "80 BIS 84",
        'AGE_85_TO_89' AS "85 BIS 89",
        'AGE_90_TO_94' AS "90 BIS 94",
        'AGE_90_PLUS' AS "[Legacy] ÜBER 90",
        'AGE_95_TO_99' AS "95 BIS 99",
        'AGE_100_PLUS' AS "ÜBER 100"
    )
)
ORDER BY GESCHLECHT_NAME;

-- Pivot showing the population change for each town in Upper Austria with their nationality in the year 2001
SELECT *
FROM (
    SELECT LAU2_NAME, STAATSANGEHOERIGKEIT_ID, SUM(BEVOELKERUNGSANZAHL) AS anzahl
    FROM FAKT_GESAMTBEVOELKERUNG f
    LEFT JOIN DIM_GEMEINDEN g
    ON f.LAU2_CODE = g.LAU2_CODE
    WHERE JAHR IN (2001)
    GROUP BY LAU2_NAME, STAATSANGEHOERIGKEIT_ID
)
PIVOT (
    SUM(anzahl)
    FOR STAATSANGEHOERIGKEIT_ID
    IN (
        'AT' AS "Österreich",
        'FE' AS "[Legacy] Ausland",
        'TOT' AS "Gesamt",
        'EU' AS "EU-Staaten",
        'FYS' AS "Ehem. Yugoslawien",
        'TR' AS "Türkei",
        'OTH' AS "Sonstige"
    )
)
ORDER BY LAU2_NAME;

-- Pivot showing the population change for each nationality from the year 1971 - 2021
SELECT *
FROM (
    SELECT JAHR, STAATSANGEHOERIGKEIT_ID, SUM(BEVOELKERUNGSANZAHL) AS anzahl
    FROM FAKT_GESAMTBEVOELKERUNG
    GROUP BY JAHR, STAATSANGEHOERIGKEIT_ID
)
PIVOT (
    SUM(anzahl)
    FOR STAATSANGEHOERIGKEIT_ID
    IN (
        'AT' AS "Österreich",
        'FE' AS "[Legacy] Ausland",
        'TOT' AS "Gesamt",
        'EU' AS "EU-Staaten",
        'FYS' AS "Ehem. Yugoslawien",
        'TR' AS "Türkei",
        'OTH' AS "Sonstige"
    )
)
ORDER BY jahr;
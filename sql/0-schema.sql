DROP TABLE DIM_STAATSANGEHOERIGKEIT;
DROP TABLE DIM_GESCHLECHT;
DROP TABLE DIM_ALTERSGRUPPE;
DROP TABLE DIM_ZEITRAUM;
DROP TABLE DIM_GEMEINDEN;

-- DIMENSIONS TABELLEN

CREATE TABLE DIM_GESCHLECHT
(
    geschlecht_id   CHAR(1)      NOT NULL PRIMARY KEY,
    geschlecht_name VARCHAR2(50) NOT NULL
);

CREATE TABLE DIM_ALTERSGRUPPE
(
    altersgruppe_id VARCHAR2(15) NOT NULL PRIMARY KEY,
    von             number       NOT NULL,
    bis             number       NOT NULL,
    UNIQUE (von, bis)
);

CREATE TABLE DIM_ZEITRAUM
(
    jahr NUMBER NOT NULL PRIMARY KEY
);

CREATE TABLE DIM_GEMEINDEN
(
    LAU2_CODE CHAR(5)       NOT NULL PRIMARY KEY,
    LAU2_NAME VARCHAR2(150) NOT NULL
);

CREATE TABLE DIM_STAATSANGEHOERIGKEIT
(
    staatsangehoerigkeit_id   CHAR(3)      NOT NULL PRIMARY KEY,
    staatsangehoerigkeit_name VARCHAR(100) NOT NULL
);

-- FAKTEN TABELLE

CREATE TABLE FAKT_GESAMTBEVOELKERUNG
(
    geschlecht_id           CHAR(1)      NULL,
    altersgruppe_id         VARCHAR2(15) NULL,
    jahr                    NUMBER       NOT NULL,
    LAU2_CODE               CHAR(5)      NOT NULL,
    staatsangehoerigkeit_id CHAR(3)      NULL,

    bevoelkerungsanzahl     NUMBER       NOT NULL,

    FOREIGN KEY (geschlecht_id) REFERENCES DIM_GESCHLECHT (geschlecht_id),
    FOREIGN KEY (altersgruppe_id) REFERENCES DIM_ALTERSGRUPPE (altersgruppe_id),
    FOREIGN KEY (jahr) REFERENCES DIM_ZEITRAUM (jahr),
    FOREIGN KEY (LAU2_CODE) REFERENCES DIM_GEMEINDEN (LAU2_CODE),
    FOREIGN KEY (staatsangehoerigkeit_id) REFERENCES DIM_STAATSANGEHOERIGKEIT (staatsangehoerigkeit_id)
);
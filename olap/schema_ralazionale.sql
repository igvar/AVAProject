CREATE TABLE Studente(
	cf TEXT NOT NULL PRIMARY KEY,
	tipo_maturita TEXT,
	votazione_maturita TEXT,
	data_di_nascita DATE,
	comune TEXT,
	regione TEXT,
	stato_residenza TEXT
);

CREATE TABLE Corso_Studi(
	id_corso TEXT NOT NULL PRIMARY KEY,
	durata_legale NUMERIC,
	codice_ateneo TEXT,
	nome_dipartimento TEXT,
	nome_corso TEXT
);


CREATE TABLE Anno_Accademico(
	codice_anno_accademico NUMERIC NOT NULL PRIMARY KEY,
	nome_anno_accademico TEXT,
	anno_anno_accademico TEXT
);
CREATE TABLE Tipo_Immatricolazione(
	tipo_immatricolazione TEXT NOT NULL PRIMARY KEY
);

CREATE TABLE Corso(
	codice_corso NUMERIC NOT NULL PRIMARY KEY,
	ssd TEXT,
	numero_crediti NUMERIC,
	nome_corso TEXT
);

CREATE TABLE TEMPO (
	codice_tempo INTEGER NOT NULL PRIMARY KEY,
	anno TEXT,
	mese TEXT,
	giorno TEXT
);

CREATE TABLE Ingressi
(
	k_tempo INTEGER NOT NULL,
	k_studente TEXT NOT NULL,
	k_anno_accademico INTEGER NOT NULL,
	k_corso_studi TEXT NOT NULL,
	k_tipo_immatricolazione TEXT NOT NULL,
	punteggio_test NUMERIC,
	immatricolato NUMERIC,
	CONSTRAINT ingressi_PKEY PRIMARY KEY(k_tempo, k_studente, k_anno_accademico, k_corso_studi, k_tipo_immatricolazione),
	CONSTRAINT ingressi_k_tempo_fkey FOREIGN KEY(k_tempo)
		REFERENCES Tempo (codice_tempo) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION,
		
	CONSTRAINT ingressi_k_studente_fkey FOREIGN KEY(k_studente)
		REFERENCES Studente (cf) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION,
		
	CONSTRAINT ingressi_k_anno_accademico_fkey FOREIGN KEY(k_anno_accademico)
		REFERENCES Anno_Accademico (codice_anno_accademico) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION,
		
	CONSTRAINT ingressi_k_corso_studi_fkey FOREIGN KEY(k_corso_studi)
		REFERENCES Corso_Studi (id_corso) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION,

	CONSTRAINT ingressi_k_tipo_immatricolazione_fkey FOREIGN KEY(k_tipo_immatricolazione)
		REFERENCES Tipo_Immatricolazione (tipo_immatricolazione) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Esami
(
	k_tempo INTEGER NOT NULL,
	k_studente TEXT NOT NULL,
	k_anno_accademico INTEGER NOT NULL,
	k_corso_studi TEXT NOT NULL,
	k_corso INTEGER NOT NULL,
	voto NUMERIC,
	cfu_acquisiti NUMERIC,
	CONSTRAINT esami_PKEY PRIMARY KEY(k_tempo, k_studente, k_anno_accademico, k_corso_studi, k_corso),
	CONSTRAINT esami_k_tempo_fkey FOREIGN KEY(k_tempo)
		REFERENCES Tempo (codice_tempo) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION,
		
	CONSTRAINT esami_k_studente_fkey FOREIGN KEY(k_studente)
		REFERENCES Studente (cf) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION,
		
	CONSTRAINT esami_k_anno_accademico_fkey FOREIGN KEY(k_anno_accademico)
		REFERENCES Anno_Accademico (codice_anno_accademico) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION,
		
	CONSTRAINT esami_k_corso_studi_fkey FOREIGN KEY(k_corso_studi)
		REFERENCES Corso_Studi (id_corso) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION,

	CONSTRAINT esami_k_corso_fkey FOREIGN KEY(k_corso)
		REFERENCES Corso (codice_corso) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Lauree
(
	k_tempo INTEGER NOT NULL,
	k_studente TEXT NOT NULL,
	k_anno_accademico INTEGER NOT NULL,
	k_corso_studi TEXT NOT NULL,
	voto_laurea NUMERIC,
	CONSTRAINT lauree_PKEY PRIMARY KEY(k_tempo, k_studente, k_anno_accademico, k_corso_studi),
	CONSTRAINT lauree_k_tempo_fkey FOREIGN KEY(k_tempo)
		REFERENCES Tempo (codice_tempo) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION,
		
	CONSTRAINT lauree_k_studente_fkey FOREIGN KEY(k_studente)
		REFERENCES Studente (cf) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION,
		
	CONSTRAINT lauree_k_anno_accademico_fkey FOREIGN KEY(k_anno_accademico)
		REFERENCES Anno_Accademico (codice_anno_accademico) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION,
		
	CONSTRAINT lauree_k_corso_studi_fkey FOREIGN KEY(k_corso_studi)
		REFERENCES Corso_Studi (id_corso) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION
)
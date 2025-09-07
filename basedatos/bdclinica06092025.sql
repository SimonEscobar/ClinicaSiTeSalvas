--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

-- Started on 2025-09-06 16:40:17

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 24578)
-- Name: medico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medico (
    idmedico integer NOT NULL,
    nombres character varying(100) NOT NULL,
    especialidad character varying(200) NOT NULL,
    telefono character varying(10) NOT NULL,
    correo character varying(200) NOT NULL,
    direccion character varying(200)
);


ALTER TABLE public.medico OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24577)
-- Name: medico_idmedico_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medico_idmedico_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.medico_idmedico_seq OWNER TO postgres;

--
-- TOC entry 4903 (class 0 OID 0)
-- Dependencies: 217
-- Name: medico_idmedico_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medico_idmedico_seq OWNED BY public.medico.idmedico;


--
-- TOC entry 220 (class 1259 OID 24585)
-- Name: paciente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paciente (
    idpaciente integer NOT NULL,
    documento character varying(10) NOT NULL,
    nombres character varying(100) NOT NULL,
    telefono character varying(10) NOT NULL,
    correo character varying(200) NOT NULL,
    direccion character varying(200)
);


ALTER TABLE public.paciente OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24584)
-- Name: paciente_idpaciente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.paciente_idpaciente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.paciente_idpaciente_seq OWNER TO postgres;

--
-- TOC entry 4904 (class 0 OID 0)
-- Dependencies: 219
-- Name: paciente_idpaciente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.paciente_idpaciente_seq OWNED BY public.paciente.idpaciente;


--
-- TOC entry 4747 (class 2604 OID 24581)
-- Name: medico idmedico; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medico ALTER COLUMN idmedico SET DEFAULT nextval('public.medico_idmedico_seq'::regclass);


--
-- TOC entry 4748 (class 2604 OID 24588)
-- Name: paciente idpaciente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paciente ALTER COLUMN idpaciente SET DEFAULT nextval('public.paciente_idpaciente_seq'::regclass);


--
-- TOC entry 4895 (class 0 OID 24578)
-- Dependencies: 218
-- Data for Name: medico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medico (idmedico, nombres, especialidad, telefono, correo, direccion) FROM stdin;
\.


--
-- TOC entry 4897 (class 0 OID 24585)
-- Dependencies: 220
-- Data for Name: paciente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paciente (idpaciente, documento, nombres, telefono, correo, direccion) FROM stdin;
\.


--
-- TOC entry 4905 (class 0 OID 0)
-- Dependencies: 217
-- Name: medico_idmedico_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medico_idmedico_seq', 1, false);


--
-- TOC entry 4906 (class 0 OID 0)
-- Dependencies: 219
-- Name: paciente_idpaciente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.paciente_idpaciente_seq', 1, false);


-- Completed on 2025-09-06 16:40:18

--
-- PostgreSQL database dump complete
--


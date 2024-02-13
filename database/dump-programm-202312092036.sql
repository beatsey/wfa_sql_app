--
-- PostgreSQL database cluster dump
--

-- Started on 2023-12-09 20:36:12

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-12-09 20:36:12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Completed on 2023-12-09 20:36:12

--
-- PostgreSQL database dump complete
--

--
-- Database "a_08_21" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-12-09 20:36:12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3419 (class 1262 OID 16398)
-- Name: a_08_21; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE a_08_21 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE a_08_21 OWNER TO postgres;

\connect a_08_21

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 868 (class 1247 OID 16448)
-- Name: shop; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.shop AS ENUM (
    'ReadCity',
    'knibba',
    'KnigaBook'
);


ALTER TYPE public.shop OWNER TO postgres;

--
-- TOC entry 862 (class 1247 OID 16423)
-- Name: shops; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.shops AS ENUM (
    'BookWorld',
    'ReadCity',
    'ILovBook'
);


ALTER TYPE public.shops OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 16465)
-- Name: orders_a_08; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_a_08 (
    "IdOrder" integer NOT NULL,
    "IdBook" integer,
    "Shop" public.shop NOT NULL,
    "KolBook" integer,
    "DatePost" date NOT NULL,
    "Price" integer,
    CONSTRAINT "orders_a_08_KolBook_check" CHECK (("KolBook" > 0)),
    CONSTRAINT "orders_a_08_Price_check" CHECK (("Price" > 0))
);


ALTER TABLE public.orders_a_08 OWNER TO postgres;

--
-- TOC entry 233 (class 1255 OID 16536)
-- Name: getbook(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getbook() RETURNS SETOF public.orders_a_08
    LANGUAGE sql
    AS $$ select * from orders_a_08 where "Price" < 100;
$$;


ALTER FUNCTION public.getbook() OWNER TO postgres;

--
-- TOC entry 232 (class 1255 OID 16535)
-- Name: getbooks(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getbooks() RETURNS SETOF public.orders_a_08
    LANGUAGE sql
    AS $$
select * from orders_a_08 where "Price" < 210;
$$;


ALTER FUNCTION public.getbooks() OWNER TO postgres;

--
-- TOC entry 231 (class 1255 OID 16534)
-- Name: in_ue(real, real); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.in_ue(pr real, rate real) RETURNS real
    LANGUAGE plpgsql
    AS $$
begin
return pr * rate;
end;
$$;


ALTER FUNCTION public.in_ue(pr real, rate real) OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16406)
-- Name: avtor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.avtor (
    "IdAvtor" integer NOT NULL,
    "AvtorFam" character varying(20),
    "AvtorName" character varying(20),
    "BirthDate" date
);


ALTER TABLE public.avtor OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16405)
-- Name: avtor_IdAvtor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."avtor_IdAvtor_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."avtor_IdAvtor_seq" OWNER TO postgres;

--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 217
-- Name: avtor_IdAvtor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."avtor_IdAvtor_seq" OWNED BY public.avtor."IdAvtor";


--
-- TOC entry 216 (class 1259 OID 16399)
-- Name: books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.books (
    idbook integer NOT NULL,
    bookname character(50),
    idavtor integer NOT NULL,
    quantity integer,
    bookdate date,
    rcd timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.books OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16537)
-- Name: books_new; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.books_new (
    idbook integer NOT NULL,
    bookname character(50),
    idavtor integer NOT NULL,
    quantity integer,
    bookdate date,
    rcd timestamp without time zone
);


ALTER TABLE public.books_new OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16516)
-- Name: klient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.klient (
    id integer NOT NULL,
    name character(50),
    fam character(50),
    birth date
);


ALTER TABLE public.klient OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16522)
-- Name: klient1; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.klient1 AS
 SELECT klient.id,
    klient.name,
    klient.fam,
    klient.birth
   FROM public.klient
  WHERE ((klient.name ~~ '%а%'::text) OR (klient.fam ~~ '%а%'::text) OR (klient.birth >= '1995-01-01'::date));


ALTER TABLE public.klient1 OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16526)
-- Name: klient5; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.klient5 AS
 SELECT klient.id,
    klient.fam
   FROM public.klient
  WHERE ((klient.name ~~ '%а%'::text) OR (klient.fam ~~ '%а%'::text) OR (klient.birth <= '1995-01-01'::date));


ALTER TABLE public.klient5 OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16515)
-- Name: klient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.klient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.klient_id_seq OWNER TO postgres;

--
-- TOC entry 3421 (class 0 OID 0)
-- Dependencies: 225
-- Name: klient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.klient_id_seq OWNED BY public.klient.id;


--
-- TOC entry 220 (class 1259 OID 16430)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    "IdOrder" integer NOT NULL,
    "IdBook" integer,
    "Shop" public.shops NOT NULL,
    "KolBook" integer,
    "DatePost" date NOT NULL,
    "Price" integer,
    CONSTRAINT "orders_KolBook_check" CHECK (("KolBook" > 0)),
    CONSTRAINT "orders_Price_check" CHECK (("Price" > 0))
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16507)
-- Name: kniga; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.kniga AS
 SELECT a_08."IdOrder",
    a_08."KolBook",
    (a_08."KolBook" * a_08."Price") AS sum
   FROM public.orders a_08;


ALTER TABLE public.kniga OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16511)
-- Name: knigi; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.knigi AS
 SELECT orders_a_08."IdOrder",
    orders_a_08."KolBook",
    (orders_a_08."KolBook" * orders_a_08."Price") AS sum
   FROM public.orders_a_08;


ALTER TABLE public.knigi OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16530)
-- Name: my_view; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.my_view AS
 SELECT orders_a_08."IdOrder",
    orders_a_08."IdBook",
    orders_a_08."Shop",
    orders_a_08."KolBook",
    orders_a_08."DatePost",
    orders_a_08."Price",
    "current_date"."current_date"
   FROM public.orders_a_08,
    CURRENT_DATE "current_date"("current_date")
  ORDER BY orders_a_08."IdOrder";


ALTER TABLE public.my_view OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16429)
-- Name: orders_IdOrder_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."orders_IdOrder_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."orders_IdOrder_seq" OWNER TO postgres;

--
-- TOC entry 3422 (class 0 OID 0)
-- Dependencies: 219
-- Name: orders_IdOrder_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."orders_IdOrder_seq" OWNED BY public.orders."IdOrder";


--
-- TOC entry 221 (class 1259 OID 16464)
-- Name: orders_a_08_IdOrder_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."orders_a_08_IdOrder_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."orders_a_08_IdOrder_seq" OWNER TO postgres;

--
-- TOC entry 3423 (class 0 OID 0)
-- Dependencies: 221
-- Name: orders_a_08_IdOrder_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."orders_a_08_IdOrder_seq" OWNED BY public.orders_a_08."IdOrder";


--
-- TOC entry 3228 (class 2604 OID 16409)
-- Name: avtor IdAvtor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avtor ALTER COLUMN "IdAvtor" SET DEFAULT nextval('public."avtor_IdAvtor_seq"'::regclass);


--
-- TOC entry 3231 (class 2604 OID 16519)
-- Name: klient id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.klient ALTER COLUMN id SET DEFAULT nextval('public.klient_id_seq'::regclass);


--
-- TOC entry 3229 (class 2604 OID 16433)
-- Name: orders IdOrder; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN "IdOrder" SET DEFAULT nextval('public."orders_IdOrder_seq"'::regclass);


--
-- TOC entry 3230 (class 2604 OID 16468)
-- Name: orders_a_08 IdOrder; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_a_08 ALTER COLUMN "IdOrder" SET DEFAULT nextval('public."orders_a_08_IdOrder_seq"'::regclass);


--
-- TOC entry 3406 (class 0 OID 16406)
-- Dependencies: 218
-- Data for Name: avtor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.avtor ("IdAvtor", "AvtorFam", "AvtorName", "BirthDate") FROM stdin;
1	Пушкин	Александр	1987-02-09
2	Беляев	Александр	1884-03-16
3	Булгаков	Михаил	1981-03-10
4	Поспелов	Алексей	1965-09-27
5	Толстой	Лев	1928-09-09
6	Пелевин	Виктор	1962-11-22
7	Сапковский	Анджей	1948-06-21
8	Габрелянов	Артём	1987-02-09
\.


--
-- TOC entry 3404 (class 0 OID 16399)
-- Dependencies: 216
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.books (idbook, bookname, idavtor, quantity, bookdate, rcd) FROM stdin;
4	ИСТОРИЯ РАЗВИТИЯ НЕТ                              	3	10	1908-02-07	2023-09-20 00:19:22.004185
5	ГЕНРИХ ФОРМ                                       	3	7	2023-09-20	2023-09-20 00:19:22.004185
6	КАК СОБРАТЬ КАРБЮРАТОР ЗА 5 МИНУТ                 	4	3	2021-07-13	2023-09-20 00:19:22.004185
8	МАЛЕНЬКИЙ человек в большом городе Москва         	4	69	1999-01-01	2023-09-20 00:19:22.004185
10	КНИГА                                             	2	11	2011-11-11	2023-11-12 22:29:25.713049
12	КНИГА45                                           	2	17	2011-12-11	2023-11-12 22:29:25.713049
\.


--
-- TOC entry 3413 (class 0 OID 16537)
-- Dependencies: 230
-- Data for Name: books_new; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.books_new (idbook, bookname, idavtor, quantity, bookdate, rcd) FROM stdin;
10	КНИГА                                             	2	11	2011-11-11	\N
3	ТЕОРИЯ БОЛЬШОГО ПЕЛЬМЕША                          	2	1	1967-05-27	2023-09-20 00:19:22.004185
12	КНИГА45                                           	2	17	2011-12-11	2023-11-12 22:05:38.269291
\.


--
-- TOC entry 3412 (class 0 OID 16516)
-- Dependencies: 226
-- Data for Name: klient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.klient (id, name, fam, birth) FROM stdin;
\.


--
-- TOC entry 3408 (class 0 OID 16430)
-- Dependencies: 220
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders ("IdOrder", "IdBook", "Shop", "KolBook", "DatePost", "Price") FROM stdin;
\.


--
-- TOC entry 3410 (class 0 OID 16465)
-- Dependencies: 222
-- Data for Name: orders_a_08; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_a_08 ("IdOrder", "IdBook", "Shop", "KolBook", "DatePost", "Price") FROM stdin;
6	4	ReadCity	100	2022-02-21	202
7	6	knibba	100	2022-03-21	333
8	8	knibba	3	2022-03-21	333
\.


--
-- TOC entry 3424 (class 0 OID 0)
-- Dependencies: 217
-- Name: avtor_IdAvtor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."avtor_IdAvtor_seq"', 8, true);


--
-- TOC entry 3425 (class 0 OID 0)
-- Dependencies: 225
-- Name: klient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.klient_id_seq', 1, false);


--
-- TOC entry 3426 (class 0 OID 0)
-- Dependencies: 219
-- Name: orders_IdOrder_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."orders_IdOrder_seq"', 1, true);


--
-- TOC entry 3427 (class 0 OID 0)
-- Dependencies: 221
-- Name: orders_a_08_IdOrder_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."orders_a_08_IdOrder_seq"', 8, true);


--
-- TOC entry 3239 (class 2606 OID 16411)
-- Name: avtor avtor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avtor
    ADD CONSTRAINT avtor_pkey PRIMARY KEY ("IdAvtor");


--
-- TOC entry 3237 (class 2606 OID 16403)
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (idbook);


--
-- TOC entry 3253 (class 2606 OID 16521)
-- Name: klient klient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.klient
    ADD CONSTRAINT klient_pkey PRIMARY KEY (id);


--
-- TOC entry 3241 (class 2606 OID 16446)
-- Name: orders orders_DatePost_IdBook_Price_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "orders_DatePost_IdBook_Price_key" UNIQUE ("DatePost", "IdBook", "Price");


--
-- TOC entry 3243 (class 2606 OID 16444)
-- Name: orders orders_DatePost_Shop_IdBook_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "orders_DatePost_Shop_IdBook_key" UNIQUE ("DatePost", "Shop", "IdBook");


--
-- TOC entry 3247 (class 2606 OID 16481)
-- Name: orders_a_08 orders_a_08_DatePost_IdBook_Price_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_a_08
    ADD CONSTRAINT "orders_a_08_DatePost_IdBook_Price_key" UNIQUE ("DatePost", "IdBook", "Price");


--
-- TOC entry 3249 (class 2606 OID 16479)
-- Name: orders_a_08 orders_a_08_DatePost_Shop_IdBook_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_a_08
    ADD CONSTRAINT "orders_a_08_DatePost_Shop_IdBook_key" UNIQUE ("DatePost", "Shop", "IdBook");


--
-- TOC entry 3251 (class 2606 OID 16472)
-- Name: orders_a_08 orders_a_08_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_a_08
    ADD CONSTRAINT orders_a_08_pkey PRIMARY KEY ("IdOrder");


--
-- TOC entry 3245 (class 2606 OID 16437)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY ("IdOrder");


--
-- TOC entry 3254 (class 2606 OID 16417)
-- Name: books books_idavtor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_idavtor_fkey FOREIGN KEY (idavtor) REFERENCES public.avtor("IdAvtor") ON DELETE RESTRICT;


--
-- TOC entry 3255 (class 2606 OID 16438)
-- Name: orders orders_IdBook_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "orders_IdBook_fkey" FOREIGN KEY ("IdBook") REFERENCES public.books(idbook) ON DELETE RESTRICT;


--
-- TOC entry 3256 (class 2606 OID 16502)
-- Name: orders_a_08 orders_a_08_IdBook_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_a_08
    ADD CONSTRAINT "orders_a_08_IdBook_fkey" FOREIGN KEY ("IdBook") REFERENCES public.books(idbook) ON DELETE CASCADE;


-- Completed on 2023-12-09 20:36:12

--
-- PostgreSQL database dump complete
--

--
-- Database "programm" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-12-09 20:36:12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3425 (class 1262 OID 16657)
-- Name: programm; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE programm WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE programm OWNER TO postgres;

\connect programm

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 245 (class 1255 OID 16775)
-- Name: add_polisovatel(integer, character varying, character varying, character varying, character varying, date, integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.add_polisovatel(IN usg_id integer, IN l character varying, IN p character varying, IN n character varying, IN lastn character varying, IN db date, IN num integer)
    LANGUAGE plpgsql
    AS $$
	BEGIN
insert into users (usergroup_id, login, "password", "name", lastname, date_of_birth, "number")  
values (usg_id, l, p, n, lastn, db, num);
	END;
$$;


ALTER PROCEDURE public.add_polisovatel(IN usg_id integer, IN l character varying, IN p character varying, IN n character varying, IN lastn character varying, IN db date, IN num integer) OWNER TO postgres;

--
-- TOC entry 258 (class 1255 OID 16811)
-- Name: add_polisovatel(integer, character varying, character varying, character varying, character varying, date, bigint); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.add_polisovatel(IN usg_id integer, IN l character varying, IN p character varying, IN n character varying, IN lastn character varying, IN db date, IN num bigint)
    LANGUAGE plpgsql
    AS $$
	BEGIN
insert into users (usergroup_id, login, "password", "name", lastname, date_of_birth, "number")  
values (usg_id, l, p, n, lastn, db, num);
	END;
$$;


ALTER PROCEDURE public.add_polisovatel(IN usg_id integer, IN l character varying, IN p character varying, IN n character varying, IN lastn character varying, IN db date, IN num bigint) OWNER TO postgres;

--
-- TOC entry 246 (class 1255 OID 16776)
-- Name: create_st_group(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.create_st_group(IN s_id integer)
    LANGUAGE plpgsql
    AS $$
	BEGIN
insert into studygroup  (study_id, user_id)  
values (s_id, null);
	END;
$$;


ALTER PROCEDURE public.create_st_group(IN s_id integer) OWNER TO postgres;

--
-- TOC entry 242 (class 1255 OID 16780)
-- Name: delete_student(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.delete_student() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	BEGIN
delete from homework_user
where user_id  = Old.user_id;
return old;
END;
$$;


ALTER FUNCTION public.delete_student() OWNER TO postgres;

--
-- TOC entry 249 (class 1255 OID 16782)
-- Name: insert_student(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.insert_student() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	BEGIN
insert into homework_user (homework_id, user_id, answer, mark)
select homework_id, new.user_id, null, null 
from studygroup as s inner join homework as hw on s.study_id = hw.study_id 
where s.studygroup_id = new.studygroup_id;
	return new;
END;
$$;


ALTER FUNCTION public.insert_student() OWNER TO postgres;

--
-- TOC entry 240 (class 1255 OID 16763)
-- Name: kol_students(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.kol_students() RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare kol int;
	BEGIN
    select count(user_id) into kol
     from stadygroup_user 
     group by user_id;
    return kol;
	END;
$$;


ALTER FUNCTION public.kol_students() OWNER TO postgres;

--
-- TOC entry 247 (class 1255 OID 16777)
-- Name: kol_students(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.kol_students(st_id integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare kol int;
	BEGIN
    select count(*) into kol
     from studygroup_user 
     where studygroup_id = st_id;
    return kol;
	END;
$$;


ALTER FUNCTION public.kol_students(st_id integer) OWNER TO postgres;

--
-- TOC entry 243 (class 1255 OID 16771)
-- Name: otkaz_ot_group(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.otkaz_ot_group(IN st_gr integer)
    LANGUAGE plpgsql
    AS $$
	BEGIN
update studygroup  
set user_id = null
where studygroup_id  = st_gr;
	END;
$$;


ALTER PROCEDURE public.otkaz_ot_group(IN st_gr integer) OWNER TO postgres;

--
-- TOC entry 251 (class 1255 OID 16772)
-- Name: otkaz_ot_group(integer, integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.otkaz_ot_group(IN st_gr integer, IN teach_id integer)
    LANGUAGE plpgsql
    AS $$
	BEGIN
update studygroup 
set user_id = null 
where studygroup_id = st_gr and user_id = teach_id;
	END;
$$;


ALTER PROCEDURE public.otkaz_ot_group(IN st_gr integer, IN teach_id integer) OWNER TO postgres;

--
-- TOC entry 241 (class 1255 OID 16770)
-- Name: update_answer(integer, integer, integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.update_answer(IN id integer, IN answ integer, IN h_id integer)
    LANGUAGE plpgsql
    AS $$
	BEGIN
update homework_user 
set answer = answ
where user_id = id 
and homework_id = h_id;
	END;
$$;


ALTER PROCEDURE public.update_answer(IN id integer, IN answ integer, IN h_id integer) OWNER TO postgres;

--
-- TOC entry 256 (class 1255 OID 16808)
-- Name: update_answer(integer, text, integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.update_answer(IN s_id integer, IN answ text, IN h_id integer)
    LANGUAGE plpgsql
    AS $$
	BEGIN
update homework_user 
set answer = answ
where user_id = s_id 
and homework_id = h_id;
	END;
$$;


ALTER PROCEDURE public.update_answer(IN s_id integer, IN answ text, IN h_id integer) OWNER TO postgres;

--
-- TOC entry 250 (class 1255 OID 16769)
-- Name: update_mark(integer, integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.update_mark(IN id integer, IN m integer)
    LANGUAGE plpgsql
    AS $$
	BEGIN
update homework_user 
set mark = m
where user_id = id;
	END;
$$;


ALTER PROCEDURE public.update_mark(IN id integer, IN m integer) OWNER TO postgres;

--
-- TOC entry 255 (class 1255 OID 16806)
-- Name: update_mark(integer, integer, integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.update_mark(IN u_id integer, IN h_w integer, IN m integer)
    LANGUAGE plpgsql
    AS $$
	BEGIN
update homework_user 
set mark = m
where user_id = u_id and homework_id = h_w;
	END;
$$;


ALTER PROCEDURE public.update_mark(IN u_id integer, IN h_w integer, IN m integer) OWNER TO postgres;

--
-- TOC entry 248 (class 1255 OID 16791)
-- Name: view_courses(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.view_courses() RETURNS TABLE(course_description character varying)
    LANGUAGE plpgsql
    AS $$
	begin
return query
select description
from study;
	END;
$$;


ALTER FUNCTION public.view_courses() OWNER TO postgres;

--
-- TOC entry 253 (class 1255 OID 16804)
-- Name: view_done_homeworks(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.view_done_homeworks(t_id integer) RETURNS TABLE("FIO" text, hw_description text, course_description character varying, answer text, mark integer)
    LANGUAGE plpgsql
    AS $$
	begin
return query
select 
concat(u.name, ' ', u.lastname) as "FIO",
h.description, s.description, hu.answer, hu.mark  
from studygroup as sg
inner join study as s on sg.study_id = s.study_id
inner join homework as h on h.study_id = s.study_id
inner join studygroup_user su on sg.studygroup_id = su.studygroup_id
inner join users as u on u.User_id = su.User_id
inner join homework_user as hu on hu.homework_id = h.homework_id and u.user_id = hu.user_id 
where sg.user_id = t_id and hu.mark is null;
	END;
$$;


ALTER FUNCTION public.view_done_homeworks(t_id integer) OWNER TO postgres;

--
-- TOC entry 254 (class 1255 OID 16801)
-- Name: view_marks(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.view_marks(studygroup_id integer) RETURNS TABLE("Course_description" character varying, "FIO" text, "All_hw" bigint, "Done_hw" bigint, "Average_mark" numeric)
    LANGUAGE plpgsql
    AS $$
	begin
return query
select s.description as "Course_description",
concat(u.name, ' ', u.lastname) as "FIO",
hu2."A_hw" as "All_hw",
hu."D_hw" as "Done_hw",
hu3."Av_mark" as "Average_mark"
from studygroup as sg
inner join study as s on sg.study_id = s.study_id
inner join studygroup_user as su on su.studygroup_id = sg.Studygroup_id 
inner join users as u on su.User_id = u.User_id
inner join (select distinct(user_id) as user_id, count(case when mark >= 3 then 1 end) over (partition by User_id) as "D_hw"
from homework_user) as hu on u.User_id=hu.user_id
inner join (select distinct(user_id) as user_id, count(homework_id) over (partition by User_id) as "A_hw"
from homework_user) as hu2 on u.User_id=hu2.user_id
inner join (select distinct(user_id) as user_id, avg(mark) over (partition by User_id) as "Av_mark"
from homework_user) as hu3 on u.User_id=hu3.user_id
where su.studygroup_id = sg.studygroup_id;
	END;
$$;


ALTER FUNCTION public.view_marks(studygroup_id integer) OWNER TO postgres;

--
-- TOC entry 252 (class 1255 OID 16794)
-- Name: view_marks1(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.view_marks1(studygroup_id integer) RETURNS TABLE("Course_description" character varying, "FIO" text, "All_hw" integer, "Done_hw" integer, "Average_mark" double precision)
    LANGUAGE plpgsql
    AS $$
	begin
return query
select s.description as "Course_description",
concat(u.name, ' ', u.lastname) as "FIO",
hu2."A_hw" as "All_hw",
hu."D_hw" as "Done_hw",
hu3."Av_mark" as "Average_mark"
from studygroup as sg
inner join study as s on sg.study_id = s.study_id
inner join studygroup_user as su on su.studygroup_id = sg.Studygroup_id 
inner join users as u on su.User_id = u.User_id
inner join (select distinct(user_id) as user_id, count(case when mark >= 3 then 1 end) over (partition by User_id) as "D_hw"
from homework_user) as hu on u.User_id=hu.user_id
inner join (select distinct(user_id) as user_id, count(homework_id) over (partition by User_id) as "A_hw"
from homework_user) as hu2 on u.User_id=hu2.user_id
inner join (select distinct(user_id) as user_id, avg(mark) over (partition by User_id) as "Av_mark"
from homework_user) as hu3 on u.User_id=hu3.user_id
where su.studygroup_id = sg.studygroup_id;
	END;
$$;


ALTER FUNCTION public.view_marks1(studygroup_id integer) OWNER TO postgres;

--
-- TOC entry 257 (class 1255 OID 16809)
-- Name: vsyat_group(integer, integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.vsyat_group(IN st_gr integer, IN teach_id integer)
    LANGUAGE plpgsql
    AS $$
	BEGIN
update studygroup  
set user_id = teach_id
where studygroup_id  = st_gr and user_id is null;
	END;
$$;


ALTER PROCEDURE public.vsyat_group(IN st_gr integer, IN teach_id integer) OWNER TO postgres;

--
-- TOC entry 244 (class 1255 OID 16774)
-- Name: zachislenie_student(integer, integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.zachislenie_student(IN st_id integer, IN st_gr integer)
    LANGUAGE plpgsql
    AS $$
	BEGIN
insert into studygroup_user (user_id, studygroup_id)  
values (st_id, st_gr);
	END;
$$;


ALTER PROCEDURE public.zachislenie_student(IN st_id integer, IN st_gr integer) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16666)
-- Name: homework; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.homework (
    homework_id integer NOT NULL,
    theory character varying(300) DEFAULT NULL::character varying,
    study_id integer NOT NULL,
    description text
);


ALTER TABLE public.homework OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16665)
-- Name: homework_homework_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.homework ALTER COLUMN homework_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.homework_homework_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 16701)
-- Name: homework_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.homework_user (
    id integer NOT NULL,
    homework_id integer NOT NULL,
    user_id integer NOT NULL,
    answer text,
    mark integer
);


ALTER TABLE public.homework_user OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16700)
-- Name: homework_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.homework_user ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.homework_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 215 (class 1259 OID 16659)
-- Name: study; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.study (
    study_id integer NOT NULL,
    description character varying(300) DEFAULT NULL::character varying
);


ALTER TABLE public.study OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16721)
-- Name: studygroup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.studygroup (
    studygroup_id integer NOT NULL,
    study_id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.studygroup OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16687)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    usergroup_id integer NOT NULL,
    login character varying(20) NOT NULL,
    password character varying(20) NOT NULL,
    name character varying(20) NOT NULL,
    lastname character varying(20) NOT NULL,
    date_of_birth date,
    number bigint NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16765)
-- Name: newview; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.newview AS
 SELECT u.name,
    u.lastname,
    u.date_of_birth,
    sg.studygroup_id,
    s.description
   FROM ((public.users u
     JOIN public.studygroup sg ON ((u.user_id = sg.user_id)))
     JOIN public.study s ON ((s.study_id = sg.study_id)));


ALTER TABLE public.newview OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16658)
-- Name: study_study_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.study ALTER COLUMN study_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.study_study_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 16720)
-- Name: studygroup_studygroup_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.studygroup ALTER COLUMN studygroup_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.studygroup_studygroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 227 (class 1259 OID 16739)
-- Name: studygroup_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.studygroup_user (
    id integer NOT NULL,
    user_id integer NOT NULL,
    studygroup_id integer NOT NULL
);


ALTER TABLE public.studygroup_user OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16738)
-- Name: studygroup_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.studygroup_user ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.studygroup_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 16681)
-- Name: usergroup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usergroup (
    usergroup_id integer NOT NULL,
    usergroupname character varying(40) NOT NULL
);


ALTER TABLE public.usergroup OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16680)
-- Name: usergroup_usergroup_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.usergroup ALTER COLUMN usergroup_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.usergroup_usergroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 16686)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN user_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3409 (class 0 OID 16666)
-- Dependencies: 217
-- Data for Name: homework; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.homework (homework_id, theory, study_id, description) FROM stdin;
1	Для решения данной задачи можно использовать глубокие нейронные сети, такие как сверточные нейронные сети (CNN). Эти сети способны выделять важные признаки из изображений и автоматически извлекать закономерности, что делает их эффективными в задачах классификации изображений.	1	Необходимо разработать модель машинного обучения для классификации изображений на основе нейронных сетей. Вам предоставлен набор данных, включающий в себя различные категории изображений. Задача состоит в том, чтобы обучить модель распознавать и классифицировать изображения с высокой точностью.
2	Рекуррентные нейронные сети, особенно долгосрочные краткосрочной памяти (LSTM) или gated recurrent units (GRU), могут успешно моделировать временные зависимости в данных. Эти сети позволяют учесть контекст прошлых моментов времени, что делает их подходящими для задач прогнозирования временных рядов.	1	Предоставлен набор данных временных рядов, например, данные о продажах товаров в течение нескольких лет. Ваша задача - разработать модель для прогнозирования будущих значений временного ряда с использованием рекуррентных нейронных сетей (RNN). Модель должна учитывать временные зависимости и позволять точно предсказывать будущие значения.
3	Алгоритмы кластеризации, такие как K-средних или иерархическая кластеризация, могут быть применены для группировки клиентов схожего поведения. Это помогает более эффективно настраивать маркетинговые кампании и предоставлять персонализированный опыт покупателя.	1	Предоставлен набор данных о поведении клиентов в вашем интернет-магазине. Ваша задача - разработать модель для кластеризации клиентов, чтобы выделить сегменты схожих потребителей. Это может помочь улучшить стратегии маркетинга и персонализировать предложения для каждого сегмента.
4	Методы обнаружения аномалий, такие как изоляционный лес или автоэнкодеры, могут быть использованы для выявления необычных паттернов в данных. Это позволяет оперативно реагировать на потенциальные проблемы и предотвращать негативные последствия.	1	Вам предоставлены данные о производственных процессах, и вам нужно разработать модель для выявления аномалий в этих данных. Задача состоит в том, чтобы автоматически обнаруживать необычные события или отклонения от нормы, которые могут указывать на проблемы в производственном процессе.
5	Методы коллаборативной фильтрации или гибридные рекомендательные системы могут быть использованы для построения эффективных рекомендаций. Эти методы учитывают как историю пользователя, так и сходство между пользователями или товарами.	1	Вы разрабатываете платформу для онлайн-торговли, и ваша цель - создать рекомендательную систему, которая предлагает пользователям персонализированные товары на основе их предыдущих покупок и предпочтений.
6	Для реализации RESTful API часто используется фреймворк, например, Flask (Python) или Express (Node.js). Вы можете использовать методы HTTP (GET, POST, PUT, DELETE) для обеспечения стандартного взаимодействия с ресурсами и базой данных для хранения информации о задачах.	3	Вам необходимо создать RESTful API, позволяющее создавать, получать, обновлять и удалять задачи в проекте. Каждая задача должна иметь уникальный идентификатор, описание, статус выполнения и дату создания.
7	Для реализации аутентификации и авторизации можно использовать токены доступа (JWT) или сессии. Различные фреймворки и библиотеки предоставляют средства для безопасного управления пользователями и их правами.	3	Расширьте предыдущее приложение, добавив механизмы аутентификации и авторизации. Только аутентифицированные пользователи должны иметь доступ к созданию, изменению и удалению задач.
8	Очереди сообщений, такие как RabbitMQ или Apache Kafka, позволяют асинхронно обрабатывать задачи, не замедляя основной процесс. Это улучшает производительность и отзывчивость системы.	3	Организуйте обработку фоновых задач с использованием очереди сообщений. Например, когда задача помечается как выполненная, отправьте уведомление на электронную почту или обновите статус в базе данных.
9	Использование кэширования снижает нагрузку на базу данных и ускоряет ответы на запросы. Redis или Memcached могут быть использованы для хранения кэша в памяти.	3	Оптимизируйте производительность вашего приложения, добавив механизм кэширования для часто запрашиваемых данных. Например, кэшируйте результаты запросов к базе данных или внешним API.
10	Логирование позволяет фиксировать информацию о действиях и ошибках в приложении. Для мониторинга можно использовать инструменты, такие как Prometheus, Grafana или Sentry, чтобы оперативно реагировать на проблемы.	3	Добавьте систему логирования, которая будет регистрировать события в приложении. Также внедрите механизм мониторинга, чтобы отслеживать производительность и выявлять потенциальные проблемы.
11	Используйте HTML для структуры формы, CSS для стилизации и JavaScript для валидации и отправки данных без перезагрузки страницы. Можно также использовать современные фреймворки или библиотеки, такие как React или Vue.js.	2	Разработайте интерактивную форму обратной связи, включающую поля для имени, электронной почты, сообщения и кнопки отправки. При отправке формы данные должны быть валидированы, и пользователю должно отображаться уведомление об успешной отправке или об ошибках в данных.
12	Для создания слайдера можно использовать HTML и CSS для структуры и стилей, а также JavaScript для управления логикой и анимациями. Библиотеки, такие как Swiper или Slick, могут упростить реализацию.	2	Создайте анимированный слайдер, который отображает изображения и позволяет пользователю переключаться между ними. Добавьте анимации при переходе между слайдами и кнопки управления.
13	Используйте JavaScript для работы с API, асинхронных запросов с использованием Fetch API или библиотек, таких как Axios. Организуйте код с использованием принципов модульности и обработки асинхронного кода.	2	Создайте клиентскую часть приложения, взаимодействующую с RESTful API. Реализуйте функционал для получения, отображения и отправки данных на сервер. Например, это может быть приложение для отображения списка задач из предыдущей задачи.
14	Используйте медиа-запросы в CSS для определения различных размеров экранов и применения соответствующих стилей. Важно также учесть доступность и удобство использования на мобильных устройствах.	2	Сделайте ваш сайт адаптивным для различных устройств, особенно для мобильных телефонов. Гарантируйте, что контент корректно отображается и взаимодействует с пользователем на маленьких экранах.
15	Используйте JavaScript для управления данными и библиотеку для визуализации. Определите подходящий тип графика или диаграммы в зависимости от целей вашего проекта.	2	Интегрируйте библиотеку для визуализации данных, такую как D3.js или Chart.js, в ваш проект. Отобразите данные в виде графика или диаграммы, делая их интерактивными и информативными.
\.


--
-- TOC entry 3415 (class 0 OID 16701)
-- Dependencies: 223
-- Data for Name: homework_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.homework_user (id, homework_id, user_id, answer, mark) FROM stdin;
16	1	10	\N	\N
20	5	10	\N	\N
21	1	11	\N	\N
22	2	11	\N	\N
23	3	11	\N	\N
24	4	11	\N	\N
25	5	11	\N	\N
26	1	12	\N	\N
27	2	12	\N	\N
28	3	12	\N	\N
29	4	12	\N	\N
30	5	12	\N	\N
31	1	13	\N	\N
32	2	13	\N	\N
33	3	13	\N	\N
34	4	13	\N	\N
35	5	13	\N	\N
36	1	14	\N	\N
37	2	14	\N	\N
38	3	14	\N	\N
39	4	14	\N	\N
40	5	14	\N	\N
41	1	15	\N	\N
42	2	15	\N	\N
43	3	15	\N	\N
44	4	15	\N	\N
45	5	15	\N	\N
46	1	16	\N	\N
47	2	16	\N	\N
48	3	16	\N	\N
49	4	16	\N	\N
50	5	16	\N	\N
51	1	17	\N	\N
52	2	17	\N	\N
53	3	17	\N	\N
54	4	17	\N	\N
55	5	17	\N	\N
56	1	18	\N	\N
57	2	18	\N	\N
58	3	18	\N	\N
59	4	18	\N	\N
60	5	18	\N	\N
61	1	19	\N	\N
62	2	19	\N	\N
63	3	19	\N	\N
64	4	19	\N	\N
65	5	19	\N	\N
66	1	20	\N	\N
67	2	20	\N	\N
68	3	20	\N	\N
69	4	20	\N	\N
70	5	20	\N	\N
71	1	21	\N	\N
72	2	21	\N	\N
73	3	21	\N	\N
74	4	21	\N	\N
75	5	21	\N	\N
76	1	22	\N	\N
77	2	22	\N	\N
78	3	22	\N	\N
79	4	22	\N	\N
80	5	22	\N	\N
81	1	23	\N	\N
82	2	23	\N	\N
83	3	23	\N	\N
84	4	23	\N	\N
85	5	23	\N	\N
86	1	24	\N	\N
87	2	24	\N	\N
88	3	24	\N	\N
89	4	24	\N	\N
90	5	24	\N	\N
91	1	25	\N	\N
92	2	25	\N	\N
93	3	25	\N	\N
94	4	25	\N	\N
95	5	25	\N	\N
96	1	26	\N	\N
97	2	26	\N	\N
98	3	26	\N	\N
99	4	26	\N	\N
100	5	26	\N	\N
101	1	27	\N	\N
102	2	27	\N	\N
103	3	27	\N	\N
104	4	27	\N	\N
105	5	27	\N	\N
106	1	28	\N	\N
107	2	28	\N	\N
108	3	28	\N	\N
109	4	28	\N	\N
110	5	28	\N	\N
111	1	29	\N	\N
112	2	29	\N	\N
113	3	29	\N	\N
114	4	29	\N	\N
115	5	29	\N	\N
116	6	30	\N	\N
117	7	30	\N	\N
118	8	30	\N	\N
119	9	30	\N	\N
120	10	30	\N	\N
121	6	31	\N	\N
122	7	31	\N	\N
123	8	31	\N	\N
124	9	31	\N	\N
125	10	31	\N	\N
126	6	32	\N	\N
127	7	32	\N	\N
128	8	32	\N	\N
129	9	32	\N	\N
130	10	32	\N	\N
131	6	33	\N	\N
132	7	33	\N	\N
133	8	33	\N	\N
134	9	33	\N	\N
135	10	33	\N	\N
136	6	34	\N	\N
137	7	34	\N	\N
138	8	34	\N	\N
139	9	34	\N	\N
140	10	34	\N	\N
141	6	35	\N	\N
142	7	35	\N	\N
143	8	35	\N	\N
144	9	35	\N	\N
145	10	35	\N	\N
146	6	36	\N	\N
147	7	36	\N	\N
148	8	36	\N	\N
149	9	36	\N	\N
150	10	36	\N	\N
151	6	37	\N	\N
152	7	37	\N	\N
153	8	37	\N	\N
154	9	37	\N	\N
155	10	37	\N	\N
156	6	38	\N	\N
157	7	38	\N	\N
158	8	38	\N	\N
159	9	38	\N	\N
160	10	38	\N	\N
161	6	39	\N	\N
162	7	39	\N	\N
163	8	39	\N	\N
164	9	39	\N	\N
165	10	39	\N	\N
166	6	40	\N	\N
167	7	40	\N	\N
168	8	40	\N	\N
169	9	40	\N	\N
170	10	40	\N	\N
171	6	41	\N	\N
172	7	41	\N	\N
173	8	41	\N	\N
174	9	41	\N	\N
175	10	41	\N	\N
176	6	42	\N	\N
177	7	42	\N	\N
178	8	42	\N	\N
179	9	42	\N	\N
180	10	42	\N	\N
181	6	43	\N	\N
182	7	43	\N	\N
183	8	43	\N	\N
184	9	43	\N	\N
185	10	43	\N	\N
19	4	10	\N	5
18	3	10	\N	5
17	2	10	https://programm.com/my_dz2.html	5
186	6	44	\N	\N
187	7	44	\N	\N
188	8	44	\N	\N
189	9	44	\N	\N
190	10	44	\N	\N
191	6	45	\N	\N
192	7	45	\N	\N
193	8	45	\N	\N
194	9	45	\N	\N
195	10	45	\N	\N
196	6	46	\N	\N
197	7	46	\N	\N
198	8	46	\N	\N
199	9	46	\N	\N
200	10	46	\N	\N
201	6	47	\N	\N
202	7	47	\N	\N
203	8	47	\N	\N
204	9	47	\N	\N
205	10	47	\N	\N
206	6	48	\N	\N
207	7	48	\N	\N
208	8	48	\N	\N
209	9	48	\N	\N
210	10	48	\N	\N
211	6	49	\N	\N
212	7	49	\N	\N
213	8	49	\N	\N
214	9	49	\N	\N
215	10	49	\N	\N
216	11	50	\N	\N
217	12	50	\N	\N
218	13	50	\N	\N
219	14	50	\N	\N
220	15	50	\N	\N
221	11	51	\N	\N
222	12	51	\N	\N
223	13	51	\N	\N
224	14	51	\N	\N
225	15	51	\N	\N
226	11	52	\N	\N
227	12	52	\N	\N
228	13	52	\N	\N
229	14	52	\N	\N
230	15	52	\N	\N
231	11	53	\N	\N
232	12	53	\N	\N
233	13	53	\N	\N
234	14	53	\N	\N
235	15	53	\N	\N
236	11	54	\N	\N
237	12	54	\N	\N
238	13	54	\N	\N
239	14	54	\N	\N
240	15	54	\N	\N
241	11	55	\N	\N
242	12	55	\N	\N
243	13	55	\N	\N
244	14	55	\N	\N
245	15	55	\N	\N
246	11	56	\N	\N
247	12	56	\N	\N
248	13	56	\N	\N
249	14	56	\N	\N
250	15	56	\N	\N
251	11	57	\N	\N
252	12	57	\N	\N
253	13	57	\N	\N
254	14	57	\N	\N
255	15	57	\N	\N
256	11	58	\N	\N
257	12	58	\N	\N
258	13	58	\N	\N
259	14	58	\N	\N
260	15	58	\N	\N
261	11	59	\N	\N
262	12	59	\N	\N
263	13	59	\N	\N
264	14	59	\N	\N
265	15	59	\N	\N
\.


--
-- TOC entry 3407 (class 0 OID 16659)
-- Dependencies: 215
-- Data for Name: study; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.study (study_id, description) FROM stdin;
1	Introduction to Data Science
2	Frontend development
3	Backend development
\.


--
-- TOC entry 3417 (class 0 OID 16721)
-- Dependencies: 225
-- Data for Name: studygroup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.studygroup (studygroup_id, study_id, user_id) FROM stdin;
1	1	4
3	3	7
4	3	8
5	2	9
2	1	5
9	3	\N
\.


--
-- TOC entry 3419 (class 0 OID 16739)
-- Dependencies: 227
-- Data for Name: studygroup_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.studygroup_user (id, user_id, studygroup_id) FROM stdin;
5	10	1
6	11	1
7	12	1
8	13	1
9	14	1
10	15	1
11	16	1
12	17	1
13	18	1
14	19	1
15	20	2
16	21	2
17	22	2
18	23	2
19	24	2
20	25	2
21	26	2
22	27	2
23	28	2
24	29	2
25	30	3
26	31	3
27	32	3
28	33	3
29	34	3
30	35	3
31	36	3
32	37	3
33	38	3
34	39	3
35	40	4
36	41	4
37	42	4
38	43	4
39	44	4
40	45	4
41	46	4
42	47	4
43	48	4
44	49	4
45	50	5
46	51	5
47	52	5
48	53	5
49	54	5
50	55	5
51	56	5
52	57	5
53	58	5
54	59	5
\.


--
-- TOC entry 3411 (class 0 OID 16681)
-- Dependencies: 219
-- Data for Name: usergroup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usergroup (usergroup_id, usergroupname) FROM stdin;
4	Администратор
5	Учитель
6	Ученик
7	Пользователь
\.


--
-- TOC entry 3413 (class 0 OID 16687)
-- Dependencies: 221
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, usergroup_id, login, password, name, lastname, date_of_birth, number) FROM stdin;
1	4	SimonovNA	23S_N23	Nikolay	Simonov	1991-12-12	89056897751
2	4	AlekseevAA	27A_A27	Aleksey	Alekseev	1995-11-17	89056888851
4	5	hklimentyonok	qQ5&UPMYE	Humphrey	Klimentyonok	1999-10-03	89042829403
5	5	vgallatly	mB5&WR*?(Ne8c	Veronike	Gallatly	1990-11-11	89042555403
7	5	sschade2	zA0?k)p"	Samuele	Schade	1989-03-08	89042909403
8	5	gshynn	iE2@oJScuOsp|	Gavra	Shynn	1980-05-03	89042229499
9	5	bliddell	uC8(_y>Zj+i	Belicia	Liddell	1987-09-11	89042877777
10	6	akyndred	tD1</pXg5RB	Ardene	Kyndred	2005-03-19	7697975964
11	6	pgatteridge	mH0)OQ\\I/9({P	Pebrook	Gatteridge	2008-08-14	4353123249
12	6	mmessier2	hZ6'l&`#	Malena	Messier	2004-01-31	3825837118
13	6	gheisham	iX6{aD1Cz%E7u`	Geralda	Heisham	2002-12-22	6973360066
14	6	dhillam	pE2|7HZmEI4}2v9	Deanna	Hillam	2009-08-06	1408851676
15	6	rlovstrom	aV8+&Cl>"	Ryun	Lovstrom	2000-09-01	7278235249
16	6	sedmons	bF6!9zCzeD	Sanders	Edmons	2003-09-13	4417228874
17	6	mhazel	lN4?jaL`*	Myriam	Hazel	2008-01-07	8936722525
18	6	jwalcar	sD5}l=E*	Juliet	Walcar	2009-12-01	5483590429
19	6	ejzak	cU4(2K.)	Emelina	Jzak	2002-08-31	9806594228
20	6	gbohina	xG5=_Y|RWOMW=	Grazia	Bohin	2008-11-17	4158836423
21	6	fmactrustyb	bX6?~\\{Uu.	Fern	MacTrusty	2001-05-14	4838840989
22	6	edavidsohnc	iU9|Y.u*N	Emily	Davidsohn	2005-03-30	2195696478
23	6	mklichd	rF5'1*vezRg2FEd	Mano	Klich	2010-03-01	7377166349
24	6	lskeemore	rS4~d|c+u<	Lynnett	Skeemor	2000-08-27	7153117675
25	6	eglowachaf	fQ5>|v/|<EHJ	Enid	Glowacha	2001-06-04	3746488979
26	6	mwyettg	vV9%ut><>Z`{!T	Monica	Wyett	2009-04-17	2854571732
27	6	rsowmanh	wM0>N`B9o	Ronalda	Sowman	2007-08-30	5702023353
28	6	bnewbiggingi	mE0$0pTV'=RJ,H	Bondy	Newbigging	2008-10-05	9594150412
29	6	ghalyj	cA8|jc+aB<\\(c	Garrick	Haly	2006-05-20	4699445620
30	6	lpeatheyjohnsk	xY1\\C(,cDR	Lucien	Peatheyjohns	2003-11-05	4349999723
31	6	dbilofskyl	oG1,DTx`{zwJB	Deni	Bilofsky	2007-10-08	2333362182
32	6	stringm	nG2,'_Cgw	Sheryl	Tring	2009-04-16	5802746930
33	6	mchampnissn	pJ1_S_XaJeB!,e	Minny	Champniss	2005-08-14	2002515343
34	6	cagrono	kB2<+|K>p7QLk}NM	Cory	Agron	2006-10-06	4643559461
35	6	gskowcraftp	pP3,j_e(o	Gayel	Skowcraft	2007-04-07	9588450869
36	6	rortasq	tQ4>JE)@|	Rod	Ortas	2000-05-13	2185525219
37	6	gdotr	rD3?f.c`	Glenda	Dot	2000-01-16	8462961661
38	6	mlowreys	kM4>=DgX	Murray	Lowrey	2008-10-29	7285694944
39	6	cdeandreist	aS7(E_+e	Cathee	De Andreis	2008-12-12	1794016197
40	6	lbothwellu	mW5~Y.p6I	Lurlene	Bothwell	2002-07-25	5425268042
41	6	tminillov	jN5`\\\\SNWb	Tamarra	Minillo	2007-05-28	6469066200
42	6	syaknovw	uZ0+=Wfi,E@UPVU	Stearn	Yaknov	2007-11-12	9166992254
43	6	dabellsx	rB4>U?y0$%*VGKZ(	Donny	Abells	2006-12-26	5641117847
44	6	ilinklatery	oS3!9dGGy	Irv	Linklater	2010-04-27	6603643178
45	6	dtellettz	bT3#jJ3Z	Dinah	Tellett	2009-04-30	4992820361
46	6	epernell10	jS7"0}QM*2I7f\\\\	Emmy	Pernell	2005-07-03	1393141809
47	6	cgaineofengland11	nU5|Qf,GarFb*	Coraline	Gaine of England	2007-11-22	8737647301
48	6	bmaliffe12	xH5(xa!Jw1	Bill	Maliffe	2000-06-10	6884995747
49	6	jharwick13	tS1<p}`=y	Jacklin	Harwick	2010-08-27	1085768999
50	6	sempson14	tD5_%+fA	Shari	Empson	2002-04-17	5801590148
51	6	oaubray15	eN9%qdu*<B!t	Odelia	Aubray	2010-04-24	4976451625
52	6	liacovino16	dE8|U+(+8p*79	Lynne	Iacovino	2009-10-27	5067112142
53	6	hhaquard17	cS4#wG@r	Henrie	Haquard	2001-02-14	8007720136
54	6	tmaymand18	bM8>,DPnXI	Tracy	Maymand	2002-04-30	2021123204
55	6	gmoreinu19	dD3/43~{>"	Germaine	Moreinu	2009-02-15	6797642877
56	6	edeyes1a	mT7\\uP!)=1j4S	Edd	Deyes	2003-06-23	2349416243
57	6	abeane1b	uT1,/_z!_#1Y	Annetta	Beane	2002-07-26	2843254473
58	6	stackett1c	tO6?&IJ@!%9{tO	Standford	Tackett	2011-12-03	8075263260
59	6	credgate1d	kA6\\p8!6%P1tdr	Corty	Redgate	2006-10-05	2532413816
60	7	snettle	eK6(0p\\rlk'_=	Suzann	Nettle	2009-10-24	9629384558
61	7	aoade	tB0@ODCqJGGB	Aeriell	Oade	1994-11-09	8317658652
62	7	jmidson2	rO9#<}yw=mD"(Kz}	Jaime	Midson	1993-12-11	9488808377
63	7	hmehaffey	mC3(ayZ4U9L3	Hyacinthe	Mehaffey	1991-11-10	9872810219
64	7	cspraging	yP2.Xf+vL~F(3+`o	Constancia	Spraging	1992-04-14	7046226400
65	7	jbezants	uX6<WOz3L.Dz5E	Joscelin	Bezants	2009-03-13	4543905866
66	7	llanegran	mW3}5Tj79v.~zFK	Lesley	Lanegran	1994-08-17	9067277871
67	7	vlamping7	vC7#nmsE\\7&z5	Vilhelmina	Lamping	2010-09-30	7852407960
68	7	jetteridge	uF5@">$SkZ/aoE	Jeralee	Etteridge	2001-08-29	6127209503
69	7	cfyfe9	bW5=f%\\Z6nu}fsc	Cly	Fyfe	1992-09-05	3512531590
70	7	ahuna	fB4*bDi#`%P/>OV`	Andre	Hun	1995-04-05	5602823416
71	7	dkorousb	pL6,W!<1PY\\483	Dinny	Korous	1990-07-14	4702702951
72	7	dguardc	kL8(xAqB@#u0R6%k	Dulcine	Guard	2008-02-21	8466256368
73	7	hbernardinellid	bU3_lbbs6A	Hillyer	Bernardinelli	1986-12-14	9748963094
74	7	Ara_2316	dfwg_09	Amalia	arakelyan	2004-12-01	89034567781
\.


--
-- TOC entry 3426 (class 0 OID 0)
-- Dependencies: 216
-- Name: homework_homework_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.homework_homework_id_seq', 15, true);


--
-- TOC entry 3427 (class 0 OID 0)
-- Dependencies: 222
-- Name: homework_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.homework_user_id_seq', 265, true);


--
-- TOC entry 3428 (class 0 OID 0)
-- Dependencies: 214
-- Name: study_study_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.study_study_id_seq', 3, true);


--
-- TOC entry 3429 (class 0 OID 0)
-- Dependencies: 224
-- Name: studygroup_studygroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.studygroup_studygroup_id_seq', 9, true);


--
-- TOC entry 3430 (class 0 OID 0)
-- Dependencies: 226
-- Name: studygroup_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.studygroup_user_id_seq', 54, true);


--
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 218
-- Name: usergroup_usergroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usergroup_usergroup_id_seq', 7, true);


--
-- TOC entry 3432 (class 0 OID 0)
-- Dependencies: 220
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 74, true);


--
-- TOC entry 3232 (class 2606 OID 16673)
-- Name: homework homework_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homework
    ADD CONSTRAINT homework_pkey PRIMARY KEY (homework_id);


--
-- TOC entry 3243 (class 2606 OID 16707)
-- Name: homework_user homework_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homework_user
    ADD CONSTRAINT homework_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3229 (class 2606 OID 16664)
-- Name: study study_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.study
    ADD CONSTRAINT study_pkey PRIMARY KEY (study_id);


--
-- TOC entry 3247 (class 2606 OID 16725)
-- Name: studygroup studygroup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.studygroup
    ADD CONSTRAINT studygroup_pkey PRIMARY KEY (studygroup_id);


--
-- TOC entry 3250 (class 2606 OID 16743)
-- Name: studygroup_user studygroup_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.studygroup_user
    ADD CONSTRAINT studygroup_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3252 (class 2606 OID 16745)
-- Name: studygroup_user studygroup_user_un; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.studygroup_user
    ADD CONSTRAINT studygroup_user_un UNIQUE (user_id);


--
-- TOC entry 3237 (class 2606 OID 16693)
-- Name: users user_un; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_un UNIQUE (login);


--
-- TOC entry 3234 (class 2606 OID 16685)
-- Name: usergroup usergroup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usergroup
    ADD CONSTRAINT usergroup_pkey PRIMARY KEY (usergroup_id);


--
-- TOC entry 3239 (class 2606 OID 16691)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3230 (class 1259 OID 16679)
-- Name: homework_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX homework_fk ON public.homework USING btree (study_id);


--
-- TOC entry 3240 (class 1259 OID 16718)
-- Name: homework_user_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX homework_user_fk ON public.homework_user USING btree (user_id);


--
-- TOC entry 3241 (class 1259 OID 16719)
-- Name: homework_user_fk_1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX homework_user_fk_1 ON public.homework_user USING btree (homework_id);


--
-- TOC entry 3244 (class 1259 OID 16736)
-- Name: studygroup_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX studygroup_fk ON public.studygroup USING btree (user_id);


--
-- TOC entry 3245 (class 1259 OID 16737)
-- Name: studygroup_fk_1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX studygroup_fk_1 ON public.studygroup USING btree (study_id);


--
-- TOC entry 3248 (class 1259 OID 16756)
-- Name: studygroup_user_fk_1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX studygroup_user_fk_1 ON public.studygroup_user USING btree (studygroup_id);


--
-- TOC entry 3235 (class 1259 OID 16699)
-- Name: user_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_fk ON public.users USING btree (usergroup_id);


--
-- TOC entry 3261 (class 2620 OID 16781)
-- Name: studygroup_user delete_hw_student; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER delete_hw_student BEFORE DELETE ON public.studygroup_user FOR EACH ROW EXECUTE FUNCTION public.delete_student();


--
-- TOC entry 3262 (class 2620 OID 16790)
-- Name: studygroup_user insert_hw_student; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER insert_hw_student AFTER INSERT ON public.studygroup_user FOR EACH ROW EXECUTE FUNCTION public.insert_student();


--
-- TOC entry 3253 (class 2606 OID 16674)
-- Name: homework homework_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homework
    ADD CONSTRAINT homework_fk FOREIGN KEY (study_id) REFERENCES public.study(study_id) ON DELETE CASCADE;


--
-- TOC entry 3255 (class 2606 OID 16708)
-- Name: homework_user homework_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homework_user
    ADD CONSTRAINT homework_user_fk FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 3256 (class 2606 OID 16713)
-- Name: homework_user homework_user_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homework_user
    ADD CONSTRAINT homework_user_fk_1 FOREIGN KEY (homework_id) REFERENCES public.homework(homework_id) ON DELETE CASCADE;


--
-- TOC entry 3257 (class 2606 OID 16726)
-- Name: studygroup studygroup_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.studygroup
    ADD CONSTRAINT studygroup_fk FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 3258 (class 2606 OID 16731)
-- Name: studygroup studygroup_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.studygroup
    ADD CONSTRAINT studygroup_fk_1 FOREIGN KEY (study_id) REFERENCES public.study(study_id) ON DELETE CASCADE;


--
-- TOC entry 3259 (class 2606 OID 16746)
-- Name: studygroup_user studygroup_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.studygroup_user
    ADD CONSTRAINT studygroup_user_fk FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 3260 (class 2606 OID 16751)
-- Name: studygroup_user studygroup_user_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.studygroup_user
    ADD CONSTRAINT studygroup_user_fk_1 FOREIGN KEY (studygroup_id) REFERENCES public.studygroup(studygroup_id) ON DELETE CASCADE;


--
-- TOC entry 3254 (class 2606 OID 16694)
-- Name: users user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_fk FOREIGN KEY (usergroup_id) REFERENCES public.usergroup(usergroup_id) ON DELETE CASCADE;


-- Completed on 2023-12-09 20:36:12

--
-- PostgreSQL database dump complete
--

-- Completed on 2023-12-09 20:36:12

--
-- PostgreSQL database cluster dump complete
--


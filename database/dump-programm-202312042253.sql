--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-12-04 22:53:45

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

DROP DATABASE programm;
--
-- TOC entry 3422 (class 1262 OID 16657)
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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3423 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 249 (class 1255 OID 16775)
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
-- TOC entry 250 (class 1255 OID 16776)
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
-- TOC entry 254 (class 1255 OID 16780)
-- Name: delete_student(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.delete_student() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	BEGIN
delete from homework_user
where user_id  = Old.user_id;
	END;
$$;


ALTER FUNCTION public.delete_student() OWNER TO postgres;

--
-- TOC entry 255 (class 1255 OID 16782)
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
	END;
$$;


ALTER FUNCTION public.insert_student() OWNER TO postgres;

--
-- TOC entry 241 (class 1255 OID 16763)
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
-- TOC entry 251 (class 1255 OID 16777)
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
-- TOC entry 245 (class 1255 OID 16771)
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
-- TOC entry 246 (class 1255 OID 16772)
-- Name: otkaz_ot_group(integer, integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.otkaz_ot_group(IN st_gr integer, IN teach_id integer)
    LANGUAGE plpgsql
    AS $$
	BEGIN
update studygroup  
set user_id = null
where studygroup_id  = st_gr and user_id = teach_id;
	END;
$$;


ALTER PROCEDURE public.otkaz_ot_group(IN st_gr integer, IN teach_id integer) OWNER TO postgres;

--
-- TOC entry 244 (class 1255 OID 16770)
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
-- TOC entry 243 (class 1255 OID 16769)
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
-- TOC entry 253 (class 1255 OID 16779)
-- Name: view_courses(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.view_courses() RETURNS TABLE(course_description text)
    LANGUAGE plpgsql
    AS $$
	BEGIN
select description
from study;
	END;
$$;


ALTER FUNCTION public.view_courses() OWNER TO postgres;

--
-- TOC entry 252 (class 1255 OID 16778)
-- Name: view_done_homeworks(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.view_done_homeworks(t_id integer) RETURNS TABLE("FIO" character varying, hw_description text, course_description text, answer text)
    LANGUAGE plpgsql
    AS $$
	BEGIN
select 
concat(u.name, ' ', u.lastname) as "FIO",
h.description, s.description, hu.answer 
from studygroup as sg
inner join study as s on sg.study_id = s.study_id
inner join homework as h on h.study_id = s.study_id
inner join homework_user as hu on hu.homework_id = h.homework_id 
inner join users as u on hu.User_id = u.User_id
where sg.user_id = t_id and hu.mark = null;
	END;
$$;


ALTER FUNCTION public.view_done_homeworks(t_id integer) OWNER TO postgres;

--
-- TOC entry 240 (class 1255 OID 16762)
-- Name: view_marks(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.view_marks() RETURNS TABLE("Course_description" text, "FIO" character varying, "All_hw" integer, "Done_hw" integer, "Average_mark" double precision)
    LANGUAGE plpgsql
    AS $$
	BEGIN
select st.description as "Course_description",
concat(u.name, ' ', u.lastname) as "FIO",
count(hu.homework_id) over (partition by u.User_id) as "All_hw",
count(case when hu.mark >= 3 then 1 end) over (partition by u.User_id) as "Done_hw",
avg(hu.mark) over (partition by u.User_id) as "Average_mark"
from studygroup as sg
inner join study as s on sg.study_id = s.study_id
inner join studygroup_user as su on su.studygroup_id = sg.Studygroup_id 
inner join users as u on su.User_id = u.User_id
inner join homework_user as hu on u.User_id=hu.user_id
where su.studygroup_id = studygroup_id;
	END;
$$;


ALTER FUNCTION public.view_marks() OWNER TO postgres;

--
-- TOC entry 242 (class 1255 OID 16764)
-- Name: view_marks(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.view_marks(studygroup_id integer) RETURNS TABLE("Course_description" text, "FIO" character varying, "All_hw" integer, "Done_hw" integer, "Average_mark" double precision)
    LANGUAGE plpgsql
    AS $$
	BEGIN
select st.description as "Course_description",
concat(u.name, ' ', u.lastname) as "FIO",
count(hu.homework_id) over (partition by u.User_id) as "All_hw",
count(case when hu.mark >= 3 then 1 end) over (partition by u.User_id) as "Done_hw",
avg(hu.mark) over (partition by u.User_id) as "Average_mark"
from studygroup as sg
inner join study as s on sg.study_id = s.study_id
inner join studygroup_user as su on su.studygroup_id = sg.Studygroup_id 
inner join users as u on su.User_id = u.User_id
inner join homework_user as hu on u.User_id=hu.user_id
where su.studygroup_id = studygroup_id;
	END;
$$;


ALTER FUNCTION public.view_marks(studygroup_id integer) OWNER TO postgres;

--
-- TOC entry 247 (class 1255 OID 16773)
-- Name: vsyat_group(integer, integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.vsyat_group(IN st_gr integer, IN taech_id integer)
    LANGUAGE plpgsql
    AS $$
	BEGIN
update studygroup  
set user_id = teach_id
where studygroup_id  = st_gr and user_id = null;
	END;
$$;


ALTER PROCEDURE public.vsyat_group(IN st_gr integer, IN taech_id integer) OWNER TO postgres;

--
-- TOC entry 248 (class 1255 OID 16774)
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
    number integer NOT NULL
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
-- TOC entry 3406 (class 0 OID 16666)
-- Dependencies: 217
-- Data for Name: homework; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.homework (homework_id, theory, study_id, description) FROM stdin;
\.


--
-- TOC entry 3412 (class 0 OID 16701)
-- Dependencies: 223
-- Data for Name: homework_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.homework_user (id, homework_id, user_id, answer, mark) FROM stdin;
\.


--
-- TOC entry 3404 (class 0 OID 16659)
-- Dependencies: 215
-- Data for Name: study; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.study (study_id, description) FROM stdin;
\.


--
-- TOC entry 3414 (class 0 OID 16721)
-- Dependencies: 225
-- Data for Name: studygroup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.studygroup (studygroup_id, study_id, user_id) FROM stdin;
\.


--
-- TOC entry 3416 (class 0 OID 16739)
-- Dependencies: 227
-- Data for Name: studygroup_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.studygroup_user (id, user_id, studygroup_id) FROM stdin;
\.


--
-- TOC entry 3408 (class 0 OID 16681)
-- Dependencies: 219
-- Data for Name: usergroup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usergroup (usergroup_id, usergroupname) FROM stdin;
\.


--
-- TOC entry 3410 (class 0 OID 16687)
-- Dependencies: 221
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, usergroup_id, login, password, name, lastname, date_of_birth, number) FROM stdin;
\.


--
-- TOC entry 3424 (class 0 OID 0)
-- Dependencies: 216
-- Name: homework_homework_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.homework_homework_id_seq', 1, false);


--
-- TOC entry 3425 (class 0 OID 0)
-- Dependencies: 222
-- Name: homework_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.homework_user_id_seq', 1, false);


--
-- TOC entry 3426 (class 0 OID 0)
-- Dependencies: 214
-- Name: study_study_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.study_study_id_seq', 1, false);


--
-- TOC entry 3427 (class 0 OID 0)
-- Dependencies: 224
-- Name: studygroup_studygroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.studygroup_studygroup_id_seq', 1, false);


--
-- TOC entry 3428 (class 0 OID 0)
-- Dependencies: 226
-- Name: studygroup_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.studygroup_user_id_seq', 1, false);


--
-- TOC entry 3429 (class 0 OID 0)
-- Dependencies: 218
-- Name: usergroup_usergroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usergroup_usergroup_id_seq', 1, false);


--
-- TOC entry 3430 (class 0 OID 0)
-- Dependencies: 220
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, false);


--
-- TOC entry 3229 (class 2606 OID 16673)
-- Name: homework homework_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homework
    ADD CONSTRAINT homework_pkey PRIMARY KEY (homework_id);


--
-- TOC entry 3240 (class 2606 OID 16707)
-- Name: homework_user homework_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homework_user
    ADD CONSTRAINT homework_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3226 (class 2606 OID 16664)
-- Name: study study_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.study
    ADD CONSTRAINT study_pkey PRIMARY KEY (study_id);


--
-- TOC entry 3244 (class 2606 OID 16725)
-- Name: studygroup studygroup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.studygroup
    ADD CONSTRAINT studygroup_pkey PRIMARY KEY (studygroup_id);


--
-- TOC entry 3247 (class 2606 OID 16743)
-- Name: studygroup_user studygroup_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.studygroup_user
    ADD CONSTRAINT studygroup_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3249 (class 2606 OID 16745)
-- Name: studygroup_user studygroup_user_un; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.studygroup_user
    ADD CONSTRAINT studygroup_user_un UNIQUE (user_id);


--
-- TOC entry 3234 (class 2606 OID 16693)
-- Name: users user_un; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_un UNIQUE (login);


--
-- TOC entry 3231 (class 2606 OID 16685)
-- Name: usergroup usergroup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usergroup
    ADD CONSTRAINT usergroup_pkey PRIMARY KEY (usergroup_id);


--
-- TOC entry 3236 (class 2606 OID 16691)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3227 (class 1259 OID 16679)
-- Name: homework_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX homework_fk ON public.homework USING btree (study_id);


--
-- TOC entry 3237 (class 1259 OID 16718)
-- Name: homework_user_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX homework_user_fk ON public.homework_user USING btree (user_id);


--
-- TOC entry 3238 (class 1259 OID 16719)
-- Name: homework_user_fk_1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX homework_user_fk_1 ON public.homework_user USING btree (homework_id);


--
-- TOC entry 3241 (class 1259 OID 16736)
-- Name: studygroup_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX studygroup_fk ON public.studygroup USING btree (user_id);


--
-- TOC entry 3242 (class 1259 OID 16737)
-- Name: studygroup_fk_1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX studygroup_fk_1 ON public.studygroup USING btree (study_id);


--
-- TOC entry 3245 (class 1259 OID 16756)
-- Name: studygroup_user_fk_1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX studygroup_user_fk_1 ON public.studygroup_user USING btree (studygroup_id);


--
-- TOC entry 3232 (class 1259 OID 16699)
-- Name: user_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_fk ON public.users USING btree (usergroup_id);


--
-- TOC entry 3258 (class 2620 OID 16781)
-- Name: studygroup_user delete_hw_student; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER delete_hw_student BEFORE DELETE ON public.studygroup_user FOR EACH ROW EXECUTE FUNCTION public.delete_student();


--
-- TOC entry 3259 (class 2620 OID 16783)
-- Name: studygroup_user insert_hw_student; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER insert_hw_student AFTER INSERT ON public.studygroup_user FOR EACH ROW EXECUTE FUNCTION public.insert_student();


--
-- TOC entry 3250 (class 2606 OID 16674)
-- Name: homework homework_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homework
    ADD CONSTRAINT homework_fk FOREIGN KEY (study_id) REFERENCES public.study(study_id) ON DELETE CASCADE;


--
-- TOC entry 3252 (class 2606 OID 16708)
-- Name: homework_user homework_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homework_user
    ADD CONSTRAINT homework_user_fk FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 3253 (class 2606 OID 16713)
-- Name: homework_user homework_user_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homework_user
    ADD CONSTRAINT homework_user_fk_1 FOREIGN KEY (homework_id) REFERENCES public.homework(homework_id) ON DELETE CASCADE;


--
-- TOC entry 3254 (class 2606 OID 16726)
-- Name: studygroup studygroup_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.studygroup
    ADD CONSTRAINT studygroup_fk FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 3255 (class 2606 OID 16731)
-- Name: studygroup studygroup_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.studygroup
    ADD CONSTRAINT studygroup_fk_1 FOREIGN KEY (study_id) REFERENCES public.study(study_id) ON DELETE CASCADE;


--
-- TOC entry 3256 (class 2606 OID 16746)
-- Name: studygroup_user studygroup_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.studygroup_user
    ADD CONSTRAINT studygroup_user_fk FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 3257 (class 2606 OID 16751)
-- Name: studygroup_user studygroup_user_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.studygroup_user
    ADD CONSTRAINT studygroup_user_fk_1 FOREIGN KEY (studygroup_id) REFERENCES public.studygroup(studygroup_id) ON DELETE CASCADE;


--
-- TOC entry 3251 (class 2606 OID 16694)
-- Name: users user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_fk FOREIGN KEY (usergroup_id) REFERENCES public.usergroup(usergroup_id) ON DELETE CASCADE;


-- Completed on 2023-12-04 22:53:45

--
-- PostgreSQL database dump complete
--


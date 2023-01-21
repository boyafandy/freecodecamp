--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    num_of_guess integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22)
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (116, 105, 11);
INSERT INTO public.games VALUES (117, 106, 629);
INSERT INTO public.games VALUES (118, 106, 21);
INSERT INTO public.games VALUES (119, 107, 365);
INSERT INTO public.games VALUES (120, 107, 539);
INSERT INTO public.games VALUES (121, 106, 549);
INSERT INTO public.games VALUES (122, 106, 173);
INSERT INTO public.games VALUES (123, 106, 914);
INSERT INTO public.games VALUES (124, 108, 739);
INSERT INTO public.games VALUES (125, 108, 141);
INSERT INTO public.games VALUES (126, 109, 688);
INSERT INTO public.games VALUES (127, 109, 567);
INSERT INTO public.games VALUES (128, 108, 251);
INSERT INTO public.games VALUES (129, 108, 803);
INSERT INTO public.games VALUES (130, 108, 66);
INSERT INTO public.games VALUES (131, 110, 842);
INSERT INTO public.games VALUES (132, 110, 108);
INSERT INTO public.games VALUES (133, 111, 28);
INSERT INTO public.games VALUES (134, 111, 685);
INSERT INTO public.games VALUES (135, 110, 662);
INSERT INTO public.games VALUES (136, 110, 249);
INSERT INTO public.games VALUES (137, 110, 872);
INSERT INTO public.games VALUES (138, 112, 628);
INSERT INTO public.games VALUES (139, 112, 199);
INSERT INTO public.games VALUES (140, 113, 117);
INSERT INTO public.games VALUES (141, 113, 14);
INSERT INTO public.games VALUES (142, 112, 180);
INSERT INTO public.games VALUES (143, 112, 923);
INSERT INTO public.games VALUES (144, 112, 966);
INSERT INTO public.games VALUES (145, 114, 767);
INSERT INTO public.games VALUES (146, 114, 153);
INSERT INTO public.games VALUES (147, 115, 655);
INSERT INTO public.games VALUES (148, 115, 663);
INSERT INTO public.games VALUES (149, 114, 454);
INSERT INTO public.games VALUES (150, 114, 595);
INSERT INTO public.games VALUES (151, 114, 965);
INSERT INTO public.games VALUES (152, 116, 794);
INSERT INTO public.games VALUES (153, 116, 976);
INSERT INTO public.games VALUES (154, 117, 103);
INSERT INTO public.games VALUES (155, 117, 252);
INSERT INTO public.games VALUES (156, 116, 192);
INSERT INTO public.games VALUES (157, 116, 754);
INSERT INTO public.games VALUES (158, 116, 348);
INSERT INTO public.games VALUES (159, 118, 869);
INSERT INTO public.games VALUES (160, 118, 9);
INSERT INTO public.games VALUES (161, 119, 219);
INSERT INTO public.games VALUES (162, 119, 987);
INSERT INTO public.games VALUES (163, 118, 861);
INSERT INTO public.games VALUES (164, 118, 128);
INSERT INTO public.games VALUES (165, 118, 230);
INSERT INTO public.games VALUES (166, 120, 223);
INSERT INTO public.games VALUES (167, 120, 782);
INSERT INTO public.games VALUES (168, 121, 680);
INSERT INTO public.games VALUES (169, 121, 70);
INSERT INTO public.games VALUES (170, 120, 915);
INSERT INTO public.games VALUES (171, 120, 275);
INSERT INTO public.games VALUES (172, 120, 544);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (105, 'boy');
INSERT INTO public.users VALUES (106, 'user_1674292130543');
INSERT INTO public.users VALUES (107, 'user_1674292130542');
INSERT INTO public.users VALUES (108, 'user_1674292212452');
INSERT INTO public.users VALUES (109, 'user_1674292212451');
INSERT INTO public.users VALUES (110, 'user_1674292254090');
INSERT INTO public.users VALUES (111, 'user_1674292254089');
INSERT INTO public.users VALUES (112, 'user_1674292333154');
INSERT INTO public.users VALUES (113, 'user_1674292333153');
INSERT INTO public.users VALUES (114, 'user_1674292391788');
INSERT INTO public.users VALUES (115, 'user_1674292391787');
INSERT INTO public.users VALUES (116, 'user_1674292407148');
INSERT INTO public.users VALUES (117, 'user_1674292407147');
INSERT INTO public.users VALUES (118, 'user_1674292425925');
INSERT INTO public.users VALUES (119, 'user_1674292425924');
INSERT INTO public.users VALUES (120, 'user_1674292456643');
INSERT INTO public.users VALUES (121, 'user_1674292456642');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 172, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 121, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--


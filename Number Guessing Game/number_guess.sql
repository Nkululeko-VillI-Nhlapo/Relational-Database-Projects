--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    number_of_guesses integer,
    secret_number integer
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
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    user_id integer NOT NULL,
    username character varying(30) NOT NULL
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: username_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.username_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.username_user_id_seq OWNER TO freecodecamp;

--
-- Name: username_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.username_user_id_seq OWNED BY public.players.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: players user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN user_id SET DEFAULT nextval('public.username_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 3, 743, 742);
INSERT INTO public.games VALUES (2, 3, 852, 851);
INSERT INTO public.games VALUES (3, 4, 811, 810);
INSERT INTO public.games VALUES (4, 4, 554, 553);
INSERT INTO public.games VALUES (5, 3, 667, 664);
INSERT INTO public.games VALUES (6, 3, 416, 414);
INSERT INTO public.games VALUES (7, 3, 654, 653);
INSERT INTO public.games VALUES (8, 5, 822, 821);
INSERT INTO public.games VALUES (9, 5, 471, 470);
INSERT INTO public.games VALUES (10, 6, 987, 986);
INSERT INTO public.games VALUES (11, 6, 173, 172);
INSERT INTO public.games VALUES (12, 5, 510, 507);
INSERT INTO public.games VALUES (13, 5, 806, 804);
INSERT INTO public.games VALUES (14, 5, 156, 155);
INSERT INTO public.games VALUES (15, 7, 805, 804);
INSERT INTO public.games VALUES (16, 7, 62, 61);
INSERT INTO public.games VALUES (17, 8, 335, 334);
INSERT INTO public.games VALUES (18, 8, 447, 446);
INSERT INTO public.games VALUES (19, 7, 897, 894);
INSERT INTO public.games VALUES (20, 7, 965, 963);
INSERT INTO public.games VALUES (21, 7, 338, 337);
INSERT INTO public.games VALUES (22, 9, 427, 426);
INSERT INTO public.games VALUES (23, 9, 552, 551);
INSERT INTO public.games VALUES (24, 10, 212, 211);
INSERT INTO public.games VALUES (25, 10, 415, 414);
INSERT INTO public.games VALUES (26, 9, 69, 66);
INSERT INTO public.games VALUES (27, 9, 267, 265);
INSERT INTO public.games VALUES (28, 9, 385, 384);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (1, 'user_1718050698594');
INSERT INTO public.players VALUES (2, 'user_1718050698593');
INSERT INTO public.players VALUES (3, 'user_1718050835036');
INSERT INTO public.players VALUES (4, 'user_1718050835035');
INSERT INTO public.players VALUES (5, 'user_1718051876323');
INSERT INTO public.players VALUES (6, 'user_1718051876322');
INSERT INTO public.players VALUES (7, 'user_1718051970325');
INSERT INTO public.players VALUES (8, 'user_1718051970324');
INSERT INTO public.players VALUES (9, 'user_1718052855340');
INSERT INTO public.players VALUES (10, 'user_1718052855339');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 28, true);


--
-- Name: username_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.username_user_id_seq', 10, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: players username_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT username_pkey PRIMARY KEY (user_id);


--
-- Name: players username_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT username_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.players(user_id);


--
-- PostgreSQL database dump complete
--


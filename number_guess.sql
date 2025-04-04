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
    guesses integer,
    user_id integer
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
    name character varying(22) NOT NULL
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

INSERT INTO public.games VALUES (1, 7, 1);
INSERT INTO public.games VALUES (2, 136, 2);
INSERT INTO public.games VALUES (3, 968, 2);
INSERT INTO public.games VALUES (4, 145, 3);
INSERT INTO public.games VALUES (5, 792, 3);
INSERT INTO public.games VALUES (6, 487, 2);
INSERT INTO public.games VALUES (7, 113, 2);
INSERT INTO public.games VALUES (8, 582, 2);
INSERT INTO public.games VALUES (9, 93, 4);
INSERT INTO public.games VALUES (10, 242, 4);
INSERT INTO public.games VALUES (11, 230, 5);
INSERT INTO public.games VALUES (12, 281, 5);
INSERT INTO public.games VALUES (13, 599, 4);
INSERT INTO public.games VALUES (14, 327, 4);
INSERT INTO public.games VALUES (15, 518, 4);
INSERT INTO public.games VALUES (16, 442, 6);
INSERT INTO public.games VALUES (17, 150, 6);
INSERT INTO public.games VALUES (18, 362, 7);
INSERT INTO public.games VALUES (19, 892, 7);
INSERT INTO public.games VALUES (20, 84, 6);
INSERT INTO public.games VALUES (21, 329, 6);
INSERT INTO public.games VALUES (22, 277, 6);
INSERT INTO public.games VALUES (23, 129, 8);
INSERT INTO public.games VALUES (24, 934, 8);
INSERT INTO public.games VALUES (25, 888, 9);
INSERT INTO public.games VALUES (26, 841, 9);
INSERT INTO public.games VALUES (27, 650, 8);
INSERT INTO public.games VALUES (28, 954, 8);
INSERT INTO public.games VALUES (29, 230, 8);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'fcc');
INSERT INTO public.users VALUES (2, 'user_1743781080416');
INSERT INTO public.users VALUES (3, 'user_1743781080415');
INSERT INTO public.users VALUES (4, 'user_1743781157479');
INSERT INTO public.users VALUES (5, 'user_1743781157478');
INSERT INTO public.users VALUES (6, 'user_1743781198464');
INSERT INTO public.users VALUES (7, 'user_1743781198463');
INSERT INTO public.users VALUES (8, 'user_1743781248807');
INSERT INTO public.users VALUES (9, 'user_1743781248806');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 29, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 9, true);


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
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--


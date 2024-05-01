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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    id integer,
    galaxy_id integer NOT NULL,
    type text,
    size numeric,
    has_black_hole boolean NOT NULL,
    number_of_stars integer,
    name character varying(30) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    id integer,
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    diameter_km integer,
    is_tidal_locked boolean NOT NULL,
    has_atmosphere boolean,
    is_captured boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    id integer,
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    star_id integer,
    type text,
    mass_kg numeric NOT NULL,
    is_habitable boolean NOT NULL,
    number_of_moons integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    id integer,
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    galaxy_id integer,
    spectral_type character varying(30),
    mass_kg numeric NOT NULL,
    is_binary boolean,
    luminosity double precision
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_planet (
    star_id integer NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.star_planet OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (NULL, 1, 'Spiral', 1000000, true, 200, 'Milky Way');
INSERT INTO public.galaxy VALUES (NULL, 2, 'Spiral', 1200000, false, 300, 'Andromeda');
INSERT INTO public.galaxy VALUES (NULL, 3, 'Spiral', 500000, false, 50, 'Triangulum');
INSERT INTO public.galaxy VALUES (NULL, 4, 'Elliptical', 1500000, true, 500, 'Messier 87');
INSERT INTO public.galaxy VALUES (NULL, 5, 'Spiral', 800000, false, 100, 'Whirlpool');
INSERT INTO public.galaxy VALUES (NULL, 6, 'Spiral', 700000, false, 80, 'Pinwheel');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (NULL, 1, 'Moon', 1, 3474, true, false, false);
INSERT INTO public.moon VALUES (NULL, 2, 'Phobos', 2, 22, true, false, false);
INSERT INTO public.moon VALUES (NULL, 3, 'Deimos', 2, 12, true, false, false);
INSERT INTO public.moon VALUES (NULL, 4, 'Europa', 3, 3122, true, true, false);
INSERT INTO public.moon VALUES (NULL, 5, 'Ganymede', 3, 5262, true, true, false);
INSERT INTO public.moon VALUES (NULL, 6, 'Io', 3, 3643, true, true, false);
INSERT INTO public.moon VALUES (NULL, 7, 'Titan', 4, 5150, true, true, false);
INSERT INTO public.moon VALUES (NULL, 8, 'Enceladus', 4, 504, true, true, false);
INSERT INTO public.moon VALUES (NULL, 9, 'Triton', 5, 2706, true, true, false);
INSERT INTO public.moon VALUES (NULL, 10, 'Charon', 5, 1212, true, false, false);
INSERT INTO public.moon VALUES (NULL, 11, 'Luna', 6, 1737, true, false, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (NULL, 1, 'Earth', 1, 'Terrestrial', 5972000000000000000000000, true, 1);
INSERT INTO public.planet VALUES (NULL, 2, 'Mars', 1, 'Terrestrial', 639000000000000000000000, false, 2);
INSERT INTO public.planet VALUES (NULL, 3, 'Jupiter', 1, 'Gas Giant', 1898000000000000000000000000, false, 79);
INSERT INTO public.planet VALUES (NULL, 4, 'Saturn', 1, 'Gas Giant', 568300000000000000000000000, false, 82);
INSERT INTO public.planet VALUES (NULL, 5, 'Neptune', 1, 'Ice Giant', 102400000000000000000000000, false, 14);
INSERT INTO public.planet VALUES (NULL, 6, 'Kepler-186f', 2, 'Terrestrial', 3890000000000000000000000, true, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (NULL, 'Sun', 1, 1, 'G2V', 1989000000000000000000000000000, false, 3.846e+26);
INSERT INTO public.star VALUES (NULL, 'Alpha Centauri A', 2, 1, 'G2V', 2180000000000000000000000000000, false, 4.83e+26);
INSERT INTO public.star VALUES (NULL, 'Alpha Centauri B', 3, 1, 'K1V', 1800000000000000000000000000000, false, 5e+25);
INSERT INTO public.star VALUES (NULL, 'Sirius', 4, 1, 'A1V', 2020000000000000000000000000000, true, 2.54e+27);
INSERT INTO public.star VALUES (NULL, 'Proxima Centauri', 5, 1, 'M5V', 123000000000000000000000000000, false, 1.7e+23);
INSERT INTO public.star VALUES (NULL, 'Betelgeuse', 6, 1, 'M1-2Ia-Iab', 20000000000000000000000000000000, false, 1e+30);


--
-- Data for Name: star_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_planet VALUES (1, 1);
INSERT INTO public.star_planet VALUES (1, 2);
INSERT INTO public.star_planet VALUES (1, 3);
INSERT INTO public.star_planet VALUES (1, 4);
INSERT INTO public.star_planet VALUES (1, 5);
INSERT INTO public.star_planet VALUES (2, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 11, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star_planet star_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet
    ADD CONSTRAINT star_planet_pkey PRIMARY KEY (star_id, planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star_planet star_planet_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet
    ADD CONSTRAINT star_planet_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star_planet star_planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet
    ADD CONSTRAINT star_planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--


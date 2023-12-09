--
-- PostgreSQL database dump
--

-- Dumped from database version 15.5 (Homebrew)
-- Dumped by pg_dump version 15.5 (Homebrew)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: spaceunicorn
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer,
    short_info text
);


ALTER TABLE public.asteroid OWNER TO spaceunicorn;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: spaceunicorn
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO spaceunicorn;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spaceunicorn
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: spaceunicorn
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    number_of_stars_bl integer,
    name character varying(50) NOT NULL,
    size numeric(10,2)
);


ALTER TABLE public.galaxy OWNER TO spaceunicorn;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: spaceunicorn
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO spaceunicorn;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spaceunicorn
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: spaceunicorn
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer,
    short_info text
);


ALTER TABLE public.moon OWNER TO spaceunicorn;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: spaceunicorn
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO spaceunicorn;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spaceunicorn
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: spaceunicorn
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    moons_around integer,
    name character varying(50) NOT NULL,
    star_id integer,
    more_info text,
    have_moons boolean DEFAULT false,
    have_life boolean DEFAULT false
);


ALTER TABLE public.planet OWNER TO spaceunicorn;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: spaceunicorn
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO spaceunicorn;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spaceunicorn
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: spaceunicorn
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    planets_inside integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO spaceunicorn;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: spaceunicorn
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO spaceunicorn;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spaceunicorn
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: spaceunicorn
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: spaceunicorn
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: spaceunicorn
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: spaceunicorn
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: spaceunicorn
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: spaceunicorn
--

COPY public.asteroid (asteroid_id, name, star_id, short_info) FROM stdin;
41	Ceres	153	The largest object in the asteroid belt between Mars and Jupiter; also classified as a dwarf planet
42	Vesta	153	One of the largest asteroids in the asteroid belt with a sizeable crater on its surface
43	Pallas	153	The second-largest asteroid in the asteroid belt known for its irregular shape
44	Juno	153	A main-belt asteroid and one of the largest stony asteroids
45	Hygiea	153	The fourth-largest and one of the darkest asteroids in the asteroid belt
46	Eros	153	An elongated asteroid that became the first near-Earth asteroid to be orbited by a spacecraft
47	Psyche	153	An asteroid believed to be composed largely of metallic iron and nickel; a target for a NASA mission
48	Lutetia	153	A large main-belt asteroid that was visited by the Rosetta spacecraft
49	Ida	153	An asteroid in the Koronis family visited by the Galileo spacecraft
50	Mathilde	153	A C-type asteroid and one of the largest in the asteroid belt visited by the NEAR Shoemaker spacecraft
\.


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: spaceunicorn
--

COPY public.galaxy (galaxy_id, number_of_stars_bl, name, size) FROM stdin;
264	100	Milky Way	100000.00
265	1000	Andromeda	220000.00
266	40	Triangulum	60000.00
267	2	Sombrero	50000.00
268	100	Whirlpool	60000.00
269	100	Pinwheel	170000.00
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: spaceunicorn
--

COPY public.moon (moon_id, name, planet_id, short_info) FROM stdin;
133	Moon	176	Earths only natural satellite
134	Phobos	177	One of the two moons of Mars
135	Deimos	177	The smaller and outermost moon of Mars
136	Io	178	The innermost and fourth-largest moon of Jupiter
137	Europa	178	One of Jupiters Galilean moons known for its ice-covered surface
138	Ganymede	178	The largest moon in our solar system - a moon of Jupiter
139	Callisto	178	The third-largest moon of Jupiter
140	Titan	179	The largest moon of Saturn known for its thick atmosphere
141	Enceladus	179	One of Saturns moons with an icy surface and geysers of water vapor
142	Mimas	179	The smallest and innermost of Saturns major moons
143	Triton	180	The largest moon of Neptune known for its retrograde orbit
144	Charon	184	Plutos largest moon - part of the Pluto-Charon binary system
145	Luna	176	The Latin name for Earths Moon
146	Phoebe	179	An irregular moon of Saturn known for its retrograde orbit
147	Rhea	179	The second-largest moon of Saturn
148	Dione	179	A moon of Saturn known for its bright icy surface
149	Hyperion	179	An irregular moon of Saturn with an irregular shape
150	Ariel	183	One of Uranuss five major moons
151	Titania	183	The largest moon of Uranus
152	Miranda	183	The smallest and innermost of Uranuss five major moons
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: spaceunicorn
--

COPY public.planet (planet_id, moons_around, name, star_id, more_info, have_moons, have_life) FROM stdin;
176	1	Earth	153	The third planet from the Sun and the only known celestial body to support life.	t	t
177	2	Mars	153	The fourth planet from the Sun often called the "Red Planet."	t	f
178	79	Jupiter	153	The largest planet in our solar system known for its massive size and powerful storms.	t	f
179	83	Saturn	153	Famous for its stunning ring system Saturn is the sixth planet from the Sun.	t	f
180	14	Neptune	153	The eighth and farthest known planet from the Sun known for its deep blue color.	t	f
181	0	Venus	153	The second planet from the Sun often referred to as Earths "sister planet."	f	f
182	0	Mercury	153	The smallest planet in our solar system closest to the Sun.	f	f
183	27	Uranus	153	The seventh planet from the Sun known for its distinct tilt.	t	f
184	5	Pluto	153	A dwarf planet located in the Kuiper Belt once considered the ninth planet.	t	f
185	0	Kepler-22b	159	An exoplanet located in the habitable zone of the star Kepler-22.	f	f
186	2	Gliese 581g	160	A potentially habitable exoplanet orbiting the red dwarf star Gliese 581.	t	t
187	0	Proxima Centauri b	154	A potentially habitable exoplanet in the habitable zone of Proxima Centauri.	f	t
188	0	TRAPPIST-1e	156	An exoplanet in the TRAPPIST-1 system part of a seven-planet system.	f	t
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: spaceunicorn
--

COPY public.star (star_id, planets_inside, name, galaxy_id) FROM stdin;
153	8	Sun	264
154	3	Proxima Centauri	264
155	5	Kepler-186	264
156	7	Trappist-1	264
157	0	Alpha Centauri B	264
158	5	Tau Ceti	264
159	1	Kepler-22	264
160	4	Gliese 581	264
\.


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spaceunicorn
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 50, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spaceunicorn
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 269, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spaceunicorn
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 152, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spaceunicorn
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 188, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spaceunicorn
--

SELECT pg_catalog.setval('public.star_star_id_seq', 160, true);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: spaceunicorn
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: spaceunicorn
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: spaceunicorn
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: spaceunicorn
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: spaceunicorn
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: spaceunicorn
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: spaceunicorn
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: spaceunicorn
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: spaceunicorn
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon planet_fk; Type: FK CONSTRAINT; Schema: public; Owner: spaceunicorn
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_fk; Type: FK CONSTRAINT; Schema: public; Owner: spaceunicorn
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: asteroid star_fk; Type: FK CONSTRAINT; Schema: public; Owner: spaceunicorn
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT star_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: spaceunicorn
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


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
    star_id integer,
    short_info text,
    name character varying(50) NOT NULL
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
    size numeric(10,2),
    short_info text
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
    short_info text,
    diametr_km numeric(10,1)
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
    galaxy_id integer,
    short_info text
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

COPY public.asteroid (asteroid_id, star_id, short_info, name) FROM stdin;
111	209	The largest object in the asteroid belt between Mars and Jupiter; also classified as a dwarf planet	Ceres
112	209	One of the largest asteroids in the asteroid belt with a sizeable crater on its surface	Vesta
113	209	The second-largest asteroid in the asteroid belt known for its irregular shape	Pallas
114	209	A main-belt asteroid and one of the largest stony asteroids	Juno
115	209	The fourth-largest and one of the darkest asteroids in the asteroid belt	Hygiea
116	209	An elongated asteroid that became the first near-Earth asteroid to be orbited by a spacecraft	Eros
117	209	An asteroid believed to be composed largely of metallic iron and nickel; a target for a NASA mission	Psyche
118	209	A large main-belt asteroid that was visited by the Rosetta spacecraft	Lutetia
119	209	An asteroid in the Koronis family visited by the Galileo spacecraft	Ida
120	209	A C-type asteroid and one of the largest in the asteroid belt visited by the NEAR Shoemaker spacecraft	Mathilde
\.


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: spaceunicorn
--

COPY public.galaxy (galaxy_id, number_of_stars_bl, name, size, short_info) FROM stdin;
306	100	Milky Way	100000.00	Our home galaxy with approximately 100 billion stars.
307	1000	Andromeda	220000.00	The nearest spiral galaxy to the Milky Way with about 1 trillion stars.
308	40	Triangulum	60000.00	A member of the Local Group; smaller than the Milky Way and Andromeda.
309	2	Sombrero	50000.00	Named for its appearance: a spiral galaxy with a bright nucleus and a wide brim.
310	100	Whirlpool	60000.00	Interacting with a smaller galaxy; known for its spiral arms and star formation.
311	100	Pinwheel	170000.00	Also known as Messier 101: a face-on spiral galaxy in the constellation Ursa Major.
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: spaceunicorn
--

COPY public.moon (moon_id, name, planet_id, short_info, diametr_km) FROM stdin;
265	Moon	267	Earths only natural satellite	3474.8
266	Phobos	268	One of the two moons of Mars	22.4
267	Deimos	268	The smaller and outermost moon of Mars	12.4
268	Io	269	The innermost and fourth-largest moon of Jupiter	3643.2
269	Europa	269	One of Jupiters Galilean moons known for its ice-covered surface	3121.6
270	Ganymede	269	The largest moon in our solar system - a moon of Jupiter	5268.2
271	Callisto	269	The third-largest moon of Jupiter	4821.0
272	Titan	270	The largest moon of Saturn known for its thick atmosphere	5152.0
273	Enceladus	270	One of Saturns moons with an icy surface and geysers of water vapor	504.2
274	Mimas	270	The smallest and innermost of Saturns major moons	396.0
275	Triton	271	The largest moon of Neptune known for its retrograde orbit	2706.8
276	Charon	275	Plutos largest moon - part of the Pluto-Charon binary system	1212.0
277	Luna	267	The Latin name for Earths Moon	3474.8
278	Phoebe	270	An irregular moon of Saturn known for its retrograde orbit	213.0
279	Rhea	270	The second-largest moon of Saturn	1527.6
280	Dione	270	A moon of Saturn known for its bright icy surface	1123.6
281	Hyperion	270	An irregular moon of Saturn with an irregular shape	220.0
282	Ariel	274	One of Uranuss five major moons	578.9
283	Titania	274	The largest moon of Uranus	1578.8
284	Miranda	274	The smallest and innermost of Uranuss five major moons	471.6
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: spaceunicorn
--

COPY public.planet (planet_id, moons_around, name, star_id, more_info, have_moons, have_life) FROM stdin;
267	1	Earth	209	The third planet from the Sun and the only known celestial body to support life.	t	t
268	2	Mars	209	The fourth planet from the Sun often called the "Red Planet."	t	f
269	79	Jupiter	209	The largest planet in our solar system known for its massive size and powerful storms.	t	f
270	83	Saturn	209	Famous for its stunning ring system Saturn is the sixth planet from the Sun.	t	f
271	14	Neptune	209	The eighth and farthest known planet from the Sun known for its deep blue color.	t	f
272	0	Venus	209	The second planet from the Sun often referred to as Earths "sister planet."	f	f
273	0	Mercury	209	The smallest planet in our solar system closest to the Sun.	f	f
274	27	Uranus	209	The seventh planet from the Sun known for its distinct tilt.	t	f
275	5	Pluto	209	A dwarf planet located in the Kuiper Belt once considered the ninth planet.	t	f
276	0	Kepler-22b	215	An exoplanet located in the habitable zone of the star Kepler-22.	f	f
277	2	Gliese 581g	216	A potentially habitable exoplanet orbiting the red dwarf star Gliese 581.	t	t
278	0	Proxima Centauri b	210	A potentially habitable exoplanet in the habitable zone of Proxima Centauri.	f	t
279	0	TRAPPIST-1e	212	An exoplanet in the TRAPPIST-1 system part of a seven-planet system.	f	t
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: spaceunicorn
--

COPY public.star (star_id, planets_inside, name, galaxy_id, short_info) FROM stdin;
209	8	Sun	306	The center of our solar system.
210	3	Proxima Centauri	306	The closest known star to the Sun.
211	5	Kepler-186	306	A star with a planetary system including Earth-sized planets.
212	7	Trappist-1	306	A red dwarf star with a system of seven Earth-sized planets.
213	0	Alpha Centauri B	306	Part of the Alpha Centauri star system.
214	5	Tau Ceti	306	A Sun-like star with a debris disk.
215	1	Kepler-22	306	Hosts Kepler-22b - an exoplanet in the habitable zone.
216	4	Gliese 581	306	A red dwarf star with multiple known planets.
\.


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spaceunicorn
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 120, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spaceunicorn
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 311, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spaceunicorn
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 284, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spaceunicorn
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 279, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spaceunicorn
--

SELECT pg_catalog.setval('public.star_star_id_seq', 216, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: spaceunicorn
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


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


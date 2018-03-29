--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: award_nominations; Type: TABLE; Schema: public; Owner: rails; Tablespace: 
--

CREATE TABLE award_nominations (
    id integer NOT NULL,
    award_name character varying(255),
    nominator_name character varying(255),
    nominator_phone character varying(255),
    nominator_email character varying(255),
    nominee_name character varying(255),
    nominee_address character varying(255),
    nominee_phone character varying(255),
    nominee_email character varying(255),
    nominee_title character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    supporting_material_file_name character varying(255),
    supporting_material_content_type character varying(255),
    supporting_material_file_size integer,
    supporting_material_updated_at timestamp without time zone,
    reason_for_nomination text
);


ALTER TABLE public.award_nominations OWNER TO rails;

--
-- Name: award_nominations_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE award_nominations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.award_nominations_id_seq OWNER TO rails;

--
-- Name: award_nominations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rails
--

ALTER SEQUENCE award_nominations_id_seq OWNED BY award_nominations.id;


--
-- Name: blog_posts; Type: TABLE; Schema: public; Owner: rails; Tablespace: 
--

CREATE TABLE blog_posts (
    id integer NOT NULL,
    post_title character varying(255),
    post_subtitle character varying(255),
    post_url_alias character varying(255),
    post_content text,
    blog_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    featured_image_file_name character varying(255)
);


ALTER TABLE public.blog_posts OWNER TO rails;

--
-- Name: blog_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE blog_posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_posts_id_seq OWNER TO rails;

--
-- Name: blog_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rails
--

ALTER SEQUENCE blog_posts_id_seq OWNED BY blog_posts.id;


--
-- Name: blogs; Type: TABLE; Schema: public; Owner: rails; Tablespace: 
--

CREATE TABLE blogs (
    id integer NOT NULL,
    blog_title character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    blog_url_alias character varying(255)
);


ALTER TABLE public.blogs OWNER TO rails;

--
-- Name: blogs_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE blogs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blogs_id_seq OWNER TO rails;

--
-- Name: blogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rails
--

ALTER SEQUENCE blogs_id_seq OWNED BY blogs.id;


--
-- Name: callout_assignments; Type: TABLE; Schema: public; Owner: rails; Tablespace: 
--

CREATE TABLE callout_assignments (
    id integer NOT NULL,
    page_id integer,
    callout_id integer,
    order_num integer DEFAULT 0
);


ALTER TABLE public.callout_assignments OWNER TO rails;

--
-- Name: callout_assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE callout_assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.callout_assignments_id_seq OWNER TO rails;

--
-- Name: callout_assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rails
--

ALTER SEQUENCE callout_assignments_id_seq OWNED BY callout_assignments.id;


--
-- Name: callouts; Type: TABLE; Schema: public; Owner: rails; Tablespace: 
--

CREATE TABLE callouts (
    id integer NOT NULL,
    callout_title character varying(255),
    callout_content text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.callouts OWNER TO rails;

--
-- Name: callouts_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE callouts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.callouts_id_seq OWNER TO rails;

--
-- Name: callouts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rails
--

ALTER SEQUENCE callouts_id_seq OWNED BY callouts.id;


--
-- Name: callouts_pages; Type: TABLE; Schema: public; Owner: rails; Tablespace: 
--

CREATE TABLE callouts_pages (
    id integer NOT NULL,
    page_id integer,
    callout_id integer
);


ALTER TABLE public.callouts_pages OWNER TO rails;

--
-- Name: callouts_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE callouts_pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.callouts_pages_id_seq OWNER TO rails;

--
-- Name: callouts_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rails
--

ALTER SEQUENCE callouts_pages_id_seq OWNED BY callouts_pages.id;


--
-- Name: ckeditor_assets; Type: TABLE; Schema: public; Owner: rails; Tablespace: 
--

CREATE TABLE ckeditor_assets (
    id integer NOT NULL,
    data_file_name character varying(255) NOT NULL,
    data_content_type character varying(255),
    data_file_size integer,
    assetable_id integer,
    assetable_type character varying(30),
    type character varying(30),
    width integer,
    height integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.ckeditor_assets OWNER TO rails;

--
-- Name: ckeditor_assets_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE ckeditor_assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ckeditor_assets_id_seq OWNER TO rails;

--
-- Name: ckeditor_assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rails
--

ALTER SEQUENCE ckeditor_assets_id_seq OWNED BY ckeditor_assets.id;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: rails; Tablespace: 
--

CREATE TABLE pages (
    id integer NOT NULL,
    page_title character varying(255),
    url_alias character varying(255),
    template_id integer,
    meta_keywords character varying(255),
    meta_description character varying(255),
    page_content text,
    parent_page_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    order_num integer DEFAULT 0,
    include_in_header_menu boolean,
    include_in_footer_menu boolean,
    is_redirect boolean,
    redirect_url character varying(255),
    is_members_only boolean,
    is_homepage boolean,
    meta_title character varying(255),
    is_private boolean
);


ALTER TABLE public.pages OWNER TO rails;

--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_id_seq OWNER TO rails;

--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rails
--

ALTER SEQUENCE pages_id_seq OWNED BY pages.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: rails; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO rails;

--
-- Name: settings; Type: TABLE; Schema: public; Owner: rails; Tablespace: 
--

CREATE TABLE settings (
    id integer NOT NULL,
    setting_name character varying(255),
    setting_value text,
    setting_attachment_file_name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    requires_file boolean
);


ALTER TABLE public.settings OWNER TO rails;

--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.settings_id_seq OWNER TO rails;

--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rails
--

ALTER SEQUENCE settings_id_seq OWNED BY settings.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: rails; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    first_name character varying(255),
    last_name character varying(255),
    roles character varying(255),
    membee_id character varying(255)
);


ALTER TABLE public.users OWNER TO rails;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO rails;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rails
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rails
--

ALTER TABLE ONLY award_nominations ALTER COLUMN id SET DEFAULT nextval('award_nominations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rails
--

ALTER TABLE ONLY blog_posts ALTER COLUMN id SET DEFAULT nextval('blog_posts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rails
--

ALTER TABLE ONLY blogs ALTER COLUMN id SET DEFAULT nextval('blogs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rails
--

ALTER TABLE ONLY callout_assignments ALTER COLUMN id SET DEFAULT nextval('callout_assignments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rails
--

ALTER TABLE ONLY callouts ALTER COLUMN id SET DEFAULT nextval('callouts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rails
--

ALTER TABLE ONLY callouts_pages ALTER COLUMN id SET DEFAULT nextval('callouts_pages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rails
--

ALTER TABLE ONLY ckeditor_assets ALTER COLUMN id SET DEFAULT nextval('ckeditor_assets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rails
--

ALTER TABLE ONLY pages ALTER COLUMN id SET DEFAULT nextval('pages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rails
--

ALTER TABLE ONLY settings ALTER COLUMN id SET DEFAULT nextval('settings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rails
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: award_nominations; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY award_nominations (id, award_name, nominator_name, nominator_phone, nominator_email, nominee_name, nominee_address, nominee_phone, nominee_email, nominee_title, created_at, updated_at, supporting_material_file_name, supporting_material_content_type, supporting_material_file_size, supporting_material_updated_at, reason_for_nomination) FROM stdin;
6	Bowl of Hygeia\r\nSponsored by APhA Foundation and NASPA	IMP Digital	8888888888	dev@impdigital.us	Jose Santiago	120 Route 17 North	8888888888	jose@impdigital.us	Lead Interactive Developer	2014-05-22 20:31:31.871529	2014-05-22 20:31:31.871529	NJPhA_Chart_v6.pdf	application/pdf	197668	2014-05-22 20:31:31.851752	He deserves it
7	Frederick B. Kilmer Award	Jose Santiago	2012613959	jose@impdigital.us	Jose Santiago	120 Rt 17 North, Paramus, NJ	2012613959	dev@impdigital.us	Lead Developer	2014-05-22 20:38:19.048726	2014-05-22 20:38:19.048726	logo11w.png	image/png	14022	2014-05-22 20:38:19.030233	He deserves it
8	Independent Pharmacist of the Year Award	Barack Obama		alan@impdigital.us	Jose Santiago		2012613959	jose@impdigital.us		2014-05-23 14:06:45.905663	2014-05-23 14:06:45.905663	chrome_elf.dll	application/x-msdownload	131912	2014-05-23 14:06:45.885739	Oh, I thought the award was for a "farmer assist."  
9	Cardinal Health Generation Rx Champions Award	Alan		alan@impdigidtal.us	Jose		Jose@impdigital.us	jose@impdigital.us		2014-05-23 15:09:32.101305	2014-05-23 15:09:32.101305	Desert.jpg	image/jpeg	845941	2014-05-23 15:09:32.056651	Great guy.
10	Independent Pharmacist of the Year Award	Jim Beatty	732-356-7485	jbib@aol.com	Ivan Saiff	see membership file	see membership file	isrxivan@aol.com		2014-06-20 21:18:47.320202	2014-06-20 21:18:47.320202	AmericasPharmacistJanuary2014-Saiff.pdf	application/pdf	5051311	2014-06-20 21:18:47.00972	Recently celebrated 50 years as owner of Saiff Drugs in Highland Park, past Pres. NJPhA, politically active on a state and national level. 
11	Independent Pharmacist of the Year Award	Jim Beatty	732-356-7485	jbib@aol.com	Ivan Saiff	see previous	see previous	isrxivan@aol.com		2014-06-20 21:22:12.618109	2014-06-20 21:22:12.618109	AmericasPharmacistJanuary2014-Saiff.pdf	application/pdf	5051311	2014-06-20 21:22:12.565029	see previous 
12	Andrew J. Prestion Political Action Award	Minesh N Desai	973-627-0187	mndesai@aol.com	Ritesh Shah	24 green springs way, freehold nj 07728	732 766 0546	ritesh1997@yahoo.com	Rph	2014-06-25 20:38:14.074023	2014-06-25 20:38:14.074023	ritesh.odt	application/vnd.oasis.opendocument.text	23782	2014-06-25 20:38:14.052964	Young energetic pharmacist fighting for fairness of independent pharmacy business.
13	Donald J. Wernick Academic Achievement Award	Mary Bridgeman	7329252356	mary.bridgeman@pharmacy.rutgers.edu	Mary Bridgeman	665 Harrell Avenue, Woodbridge, NJ 07095	7329252356	mary.bridgeman@pharmacy.rutgers.edu	Clinical Associate Professor, Ernest Mario School of Pharmacy, Rutgers, The State University of New Jersey	2014-06-25 20:47:31.548417	2014-06-25 20:47:31.548417	Curriculum_Vitae_-_Mary_Bridgeman_June_2014.pdf	application/pdf	329040	2014-06-25 20:47:31.526783	Mary is an outstanding professor and academician, maintaining a practice as a Clinical Pharmacist specializing in Adult Internal Medicine at Robert Wood Johnson University Hospital in New Brunswick, New Jersey and serving as a Clinical Associate Professor at the Ernest Mario School of Pharmacy at Rutgers, The State University of New Jersey.  Mary serves as course coordinator and instructor in the Self Care and Home Care and Concepts in Pharmacy Practice courses at the pharmacy school, in addition to providing lectures on kidney disease in the therapeutics modules.  She is responsible for the training and academic growth and development of the students she precepts on rotation as well as in the classroom at the school.  In addition to these activities, at the local level, she is actively engaged with the New Jersey Pharmacist’s Association as well as the New Jersey Society of Health-Systems Pharmacists.  She has presented numerous continuing education presentations to pharmacists and pharmacy technician members of both organizations.  On a regional level, as a trainer for the American Pharmacist’s Association’s Pharmacy-Based Immunization Delivery Program, she has trained over 2,000 pharmacists and pharmacy students to become immunizers.  On a national level, she is actively involved with the American Society of Health-Systems Pharmacists by serving as a preliminary round judge for the National Clinical Skills Competition, an annual event.  Mary is recognized as a Board Certified Pharmacotherapy Specialist and Certified Geriatric Pharmacist.  
14	Andrew J. Prestion Political Action Award	priti pandya	973-896-7678	pritipandya12@gmail.com	ritesh shah	733 north beers street, holmdel, nj, 07733	732-888-0303	ritesh1997@yahoo.com	pharmacist	2014-06-25 21:30:28.092093	2014-06-25 21:30:28.092093	njrxpac.pdf	application/pdf	137747	2014-06-25 21:30:28.065598	Mr Ritesh shah, pharmacist and  chairman of Political Action Committee named NJRxPAC,  dealing with an unleveled playing field, PBMs, mail order operations, and others are not playing by the same set of rules that retail pharmacies have to follow. He initiate first step toward leveling that playing field and restoring equality to the industry.
15	Pharmacist Mutual Distinguished Young Pharmacist Award	F. Zaria Chinelo	866.503.0118	info@pharmpsych.com	Brian J. Catton		717-712-4504	brianj.catton@gmail.com	Contributing Journalist (Contributor)	2014-06-26 13:22:40.256432	2014-06-26 13:22:40.256432	catton-sb493.pdf	application/pdf	115061	2014-06-26 13:22:40.233451	Dr. Catton has committed himself to informing the public about pharmacy related matters. He has helped to transform health by volunteering regularly in his community. Through his intergrity and dedication to the profession, he has changed lives. Learn more: \r\n\r\nhttp://pharmpsych.com/author/bc97743/
16	Pharmacist Mutual Distinguished Young Pharmacist Award	Vladimire Herard	(301) 785-4406	safn@yahoo.com	Brian J. Catton		717-712-4504	brianj.catton@gmail.com	Staff Pharmacist, CVS Pharmacy	2014-06-26 19:52:40.308022	2014-06-26 19:52:40.308022	catton-sb493.pdf	application/pdf	115240	2014-06-26 19:52:40.280679	Mr. Catton is a fitting recommendation for this honor because of his achievements as a pharmacist in three areas, the District of Columbia, New Jersey and Pennsylvania. He is committed to improving the field of pharmacy as a member of both the New Jersey and Pennsylvania pharmacists associations, supporting key legislation that expands pharmaceutical services to the public. He also is furthering his own skills and expertise in the field, having just accepted an offer to practice pharmacy outside of his current Cherry Hill, New Jersey region.  
17	Andrew J. Prestion Political Action Award	Jim Beatty	848-702-5923	jbib@aol.com	Ritesh Shah	to follow	732-766-0546	ritesh1997@yahoo.com	Pharmacist	2014-06-29 23:27:40.728955	2014-06-29 23:27:40.728955	S2880NJAMMO.htm	text/html	21926	2014-06-29 23:27:40.684684	Seeing that his fellow Indo-American pharmacy owners were not supporting political action, Ritesh decided to start a PAC for the Indo-American pharmacy owners. To avoid conflict with NJPhA, he appointed Elise Barry & Laurie Clark to his board, and got the owners to use Laurie as their lobbyist and coordinate their activities. He also organized, in conjunction with NJPhA a day in the legislature for the owners, and solicited financial contributions to help fight for the PBM transparency bill. He also held a dinner for a newly elected Indo-American Assemblyman and is active in Monmouth County politics
18	Rosario J. Mannino Award	Jim Beatty, RPh, Past President	848-702-5923	jbib@aol.com	Ivan Saiff	325 Raritan Avenue, Highland Park, NJ	on file	isrxivan@aol.com	Pharmacist	2014-06-29 23:40:17.528932	2014-06-29 23:40:17.528932	AmericasPharmacistJanuary2014-Saiff.pdf	application/pdf	5051311	2014-06-29 23:40:17.483943	Ivan has been an NJPhA member for more than 50 years. He is a past-President and continues to work in poliltical action and association affairs. He was recently feted by "America's Pharmacist" for being a pharmacy owner for 50 years. He is still going strong.
20	Andrew J. Prestion Political Action Award	Jim Beatty	848-702-5923	jbib@aol.com	Ritesh Shah	Bayshore Homecare Pharmacy, Holmdel, NJ	732-766-0546	ritesh1997@yahoo.com	Pharmacist	2014-06-30 01:04:01.721368	2014-06-30 01:04:01.721368	000_photo1.jpg	image/jpeg	3653743	2014-06-30 01:04:01.677529	see attached for additioinal documntation
19	NASPA Excellence in Innovation Award\r\nSponsored by Upsher-Smith	Jim Beatty	848-702-5923	jbib@aol.com	Jim Cammarata	75 Washington Valley Road, Bedminster, NJ 07921	908-658-4900	jim@valleypharmacyrx.com	Pharmacist	2014-06-30 00:39:34.187484	2014-06-30 00:39:34.187484	FAX_20140630_1404088272_145.pdf	application/pdf	56049	2014-06-30 00:39:34.156984	Jim recently remodeled and completely changed the concept of his independent retail pharmacy, Valley Integrative Pharmacy. He now has luxury and organic cosmetics, novel nutritional programs and products, a nutritionist, holistic nutritionist, homeopathist, and herbalist on staff. He offers makeovers , for weddings, proms, and gradruations, yoga classes, skin care consultations, and many other programs. He has expanded his compounding practice, and is advertising it to the public and prescribers.  Valley Integrative Pharmacy is a true 21st Century wellness pharmacy. He also uses social media to promote his services.\r\n
22	NASPA Excellence in Innovation Award\r\nSponsored by Upsher-Smith	Jim Beatty	848-702-5923	jbib@aol.com	Jim Cammarata	Valley Pharmacy, 75 Washington Valley Road, Bedminster, NJ 07921	908-658-4900	jim@valleypharmacyrx.com	Pharmacist	2014-07-01 19:33:55.39606	2014-07-01 19:33:55.39606	Valley_Advertisements.zip	application/octet-stream	320722	2014-07-01 19:33:55.369375	Jim recently remodeled and changes the concept of his independent retail pharmacy. Valley Intergrative Pharmacy. He now has luxury and organic cosmetics, novel nutritional programs and products. He employs a nutritionist, a holistic nutritionist. a homeopathist, and a herbalist. He offers makeovers for weddings, proms, and graduations, yoga classes, skin care assessments, and many other programs. He has expanded his compounding practice, and is advertising it to the public and prescribers. Valley Integrative Pharmacy is a true 21st Century Wellness pharmacy. Jim is also using social media to promote his services.
23	Pharmacist Mutual Distinguished Young Pharmacist Award	Maria Leibfried	718-990-1965	leibfrim@stjohns.edu	Brian J. Catton	126 Wesley Avenue, Cherry Hill, NJ 08002	717-712-4504	brianj.catton@gmail.com		2014-07-07 16:51:25.328389	2014-07-07 16:51:25.328389	Brian_J_Catton_resume.docx	application/vnd.openxmlformats-officedocument.wordprocessingml.document	29407	2014-07-07 16:51:25.295516	Although overcoming personal challenges at a young age, Brian's triumph over them is evident in his charisma and dedication to advancing the pharmacy profession. As a Full-Time Staff Floater Pharmacist with CVS Pharmacy in the greater Cherry Hill region, he has gained the rapport of fellow colleagues from the stores he has visited with his resilience, cheerfulness, dedication to patient safety, and customer satisfaction.  Donning his bow-ties while practicing, customers and patients alike find him accessible, friendly, and genuinely concerned about their overall health and well-being. Outside of CVS, he is involved with NJPhA's Journal Committee and has presented several live conitnuing education topics at various regional meetings. Although residing in Cherry Hill, he still actively serves on the Public Relations Committee and New Practitioners Advisory Board with the Pennsylvania Pharmacist Assocation (PPA), as was a previous New Practitioner Board of Director with the Pennsylvania Pharmacists Association's Educational Foundation Board. His involvement with PPA spans from providing constructive criticism with student poster presentations at Midyear Conferences, hosting networking events, presenting continuing education courses, and equipping student pharmacists with necessary tools to succeed post-graduation. 
24	Bowl of Hygeia\r\nSponsored by APhA Foundation and NASPA	Alan S. Aronovitz	609-823-8309	ASAXPCS@aol.com	Donna Cestone	P.O. Box 3233, Laurel, MD  20709-3233	201-874-9035	dmcestone@peoplepc.com	Past President New Jersey Pharmacist Association	2014-07-08 21:45:28.885226	2014-07-08 21:45:28.885226	Donna_Marie_Cestone_Biosketch_2014.doc	application/octet-stream	17408	2014-07-08 21:45:28.863311	Whenever we have a Region 5 meeting or I send out an e-mail and I ask people to run for office or volunteer for a committee I am usually met with a lot of apathy. We all know that only a very small minority of pharmacists in the State are doing all the work for the majority and that we all have to multitask and do the job of many. Donna Cestone exemplifies this commitment to pharmacy as is evidenced by the body of work listed in the enclosed Biosketch. I have worked with her extensively on professional matters. Donna has always encouraged me to participate in the Association and has been an invaluable resource to the Committees I have chaired, particularly in Regionalization which she committed her Presidency to, and is now serving the association so well today.  For over 25 years Donna has continually used her experience in the industry, community, managed care, clinical pharmacy and government to promote the profession and practice of pharmacy. Of the approximately 10,000 pharmacists licensed in New Jersey it would be hard to find one with such a diverse and distinguished background and one who has selflessly put her skills to use for the profession and the community we serve.
25	William H. McNeill Award	Alan S. Aronovitz	609-823-8309	ASAXPCS@aol.com	Donna Cestone	P.O. Box 3233, Laurel, MD  20709-3233	201-874-9035	dmcestone@peoplepc.com	Past President NJPhA	2014-07-08 21:53:23.578539	2014-07-08 21:53:23.578539	Donna_Marie_Cestone_Biosketch_2014.doc	application/octet-stream	17408	2014-07-08 21:53:23.558247	Whenever we have a Region 5 meeting or I send out an e-mail and I ask people to run for office or volunteer for a committee I am usually met with a lot of apathy. We all know that only a very small minority of pharmacists in the State are doing all the work for the majority and that we all have to multitask and do the job of many. Donna Cestone exemplifies this commitment to pharmacy as is evidenced by the body of work listed in the enclosed Biosketch. I have worked with her extensively on professional matters. Donna has always encouraged me to participate in the Association and has been an invaluable resource to the Committees I have chaired, particularly in Regionalization which she committed her Presidency to, and is now serving the association so well today.  For over 25 years Donna has continually used her experience in the industry, community, managed care, clinical pharmacy and government to promote the profession and practice of pharmacy. Of the approximately 10,000 pharmacists licensed in New Jersey it would be hard to find one with such a diverse and distinguished background and one who has selflessly put her skills to use for the profession and the community we serve.
35	Pharmaceutical Industry Award	Madhavi Patel	201-655-1871	madhavi.3362@gmail.com	Moriah Weissman		201-655-1871	moriahjaye@gmail.com		2014-07-15 02:26:11.95195	2014-07-15 02:26:11.95195	\N	\N	\N	\N	Moriah has consistently and continuously spread awareness of NJPhA within the pharmaceutical industry. She has been a strong advocate in recruiting fellow industry pharmacists for NJPhA. I have had the pleasure of working closely with Moriah in order to lead CE dinner programs in Region 2. Moriah also involves final year pharmacy students by allowing them to attend NJPhA meetings and CE programs. She enhances the Medical Information rotation in pharmaceutical industry by spreading the benefits of NJPhA to students. 
21	NASPA Excellence in Innovation Award\r\nSponsored by Upsher-Smith	Jim Beatty	848-702-5923	jbib@aol.com	Jim Cammarata, RPh	75 Washington Valley Road, Bedminster, NJ	908-658-4900	jim@valleypharmacyrx.com	Pharmacist	2014-06-30 15:25:47.655435	2014-06-30 15:25:47.655435	Valley_Advertisements.zip	application/octet-stream	320722	2014-06-30 15:25:47.630553	Jim has transformed his pharmacy into a truly different wellness concept. He has completely remodeled, is offering upscale and organic cosmetics, natural & homeopathic remedies, nutrition classes, yoga classes,  and other community events. He has on staff a nutritionist, a holistic nutritionist,\r\na homeopathist, and a herbalist. He is expanding his compounding practice. \r\n
27	Donald J. Wernick Academic Achievement Award	Grace Earl	215-596-8940	g.earl@usciences.edu	Timothy Nguyen	Arnold & Marie Schwartz College of Pharmacy and Health Sciences, 75 Dekalb Avenue, Brooklyn, NJ 11201	general number 718-488-1004	Timothy.Nguyen@liu.edu	Associate Professor of Pharmacy Practice	2014-07-09 22:15:40.864	2014-07-09 22:15:40.864	Profile_Timothy_Nguyen_LIU.doc	application/msword	38912	2014-07-09 22:15:40.841795	Tim was involved as the co-chair of the Student Practitioner Committee for 2012-2013 (perhaps earlier) and did a stellar job as a leader and mentor.  He took ownership of the Student Practitioner Committee newsletter and "founded" this important communicate tool which disseminates information to all NJPHA members about student activities and officer messages.  He worked tirelessly to develop a template for the newsletter and edited the first edition of the newsletter.   He networked with other NJPHA members and encouraged them to get involved with the student group.  Tim had a significant impact on my own participation in NJPHA.  Because of his collegiality and genuine personal demeanor, I was interested in joining the group to provide opportunities for students.  Tim was an outstanding role model.  He confidently ran the meetings, established charges, and effectively conducted Student Practitioner business.  I don't think I would have been interested in taking a leadership position unless Tim had showed me how to do it!  Most importantly, Tim works diligently to provide opportunities for his students.  It could be working with students on posters, publications, or on preparing for college competitions.  
26	Andrew J. Prestion Political Action Award	David Kane		davidkane360@yahoo.com	Ritesh Shah		732-766-0546	ritesh1997@yahoo.com		2014-07-09 18:15:50.066927	2014-07-09 18:15:50.066927	Ritesh_Shah.docx	application/vnd.openxmlformats-officedocument.wordprocessingml.document	12454	2014-07-09 18:15:50.03689	It is as if Ritesh Shah was born with a divine purpose and that purpose is to help the community.  Have a positive effect on healthcare, reduce medication errors and increase medication compliance with patients.  In essence his purpose is to improve the lives of the people within the communities he serves and advance the profession of pharmacy.  Ritesh is an example of a person with real compassion.  He sees a need and seeks to meet it.  Is has been over 12 years since I’ve worked in a pharmacy as a pharmacist and most would think the work Ritesh has done for pharmacists would just be impossible.  The way he looks at the world reminds me of something the great boxer Muhammad Ali said to skeptics.  “Impossible is just a big word thrown around by small men who find it easier to live in the world they've been given than to explore the power they have to change it. Impossible is not a fact. It's an opinion. Impossible is not a declaration. It's a dare. Impossible is potential. Impossible is temporary. Impossible is nothing.”  He has shown a willingness to collaborate an unparalleled dedication to his pharmacy community.  In his practice he has taken great strides to reduce medication error or rather increase medication safety and also in making it easier for people to adhere to their therapy.  I believe his efforts will save and improve the lives of many.\r\n \r\n
28	Andrew J. Prestion Political Action Award	John "Pozar" Pozarowski	732-991-0004	johnpozar@gmail.com	Ritesh Shah	C/O Bayshore Homecare Pharmacy, 733 No. Beers Street, Holmdel, NJ 07733 	732-766-0546	ritesh1997@yahoo.com	Pharmacist	2014-07-10 02:08:32.33341	2014-07-10 02:08:32.33341	Ritesh_Shah_-_NJPHA.docx	application/vnd.openxmlformats-officedocument.wordprocessingml.document	212350	2014-07-10 02:08:32.308124	see attachment
29	Rosario J. Mannino Award	IMP Digital Test	2012613959	dev@impdigital.us	IMP Digital Test	120 Route 17 North	2012613959	jose@impdigital.us		2014-07-10 14:43:21.362125	2014-07-10 14:43:21.362125	\N	\N	\N	\N	Testing form update
30	Rosario J. Mannino Award	Ron Mannino	201-481-3875	ron@interchem.com	Lou Spinelli	22 Maple Ave., Midland Park, NJ 07432-1728	201-248-3874	louisrx@verizon.net	Staff  Pharmacist The Valley Health Care System, Paramus NJ 	2014-07-10 16:24:49.743654	2014-07-10 16:24:49.743654	\N	\N	\N	\N	Lou currently Past President of Region 1, Bergen County Pharmaceutical Society but he had held the position of President from many years.  He is Chairman of Region 1 Executive Board and active in obtaining CE Program speakers and sponsorship. He has been on the continuing education and convention committees for the state over a long period of time.  He is recent recipient of the prestigious Bowl of Hygeia Award.\r\nAt the Valley Health Care System in Ridgewood/Paramus NJ he is actively mentors students for their IPPE and APPE rotations from Rutgers, St. John’s, USP, Wilkes, U. Conn., Northeastern, Albany, Pitt etc. \r\nHe has initiated a High School Pharmacy mentoring program at Valley that encompasses students from the Bergen Academies, Ridgewood, Fairlawn, etc.  He encourages them to be active in their professional associations.\r\nHe has brought the High School and Rotation students numerous times to our meetings:  He encourages them to not only attend CE accredited presentations but to prepare them as well. He encourages Pharmacy Technicians to attend our meetings for Technician approved CE Credit and to become a part of the Association.\r\nLou Spinelli would be most deserving recipient of the Rosario J. Mannino Award.  \r\n
31	Donald J. Wernick Academic Achievement Award	Maria Leibfried	718-990-1965	leibfrim@stjohns.edu	Timothy Nguyen		718-488-1234	timothy.nguyen@liu.edu	associate professor	2014-07-10 19:22:19.29315	2014-07-10 19:22:19.29315	nguyen_tim_LIU_bio.pdf	application/pdf	144508	2014-07-10 19:22:19.251584	Tim has done a terrific job in leading the Student practitioner committee and in starting the student newsletter. He also actively participated in the Student Competition in 2013, and mentored the LIU team, which eventually won the competition. He is very dedicated to the students and to academia.
32	Mortar & Pestle Award	Laurie Clark	732-213-0250	laurieclark@msn.com	Congressman Frank Pallone	P.O. Box  3176, Long Branch, NJ 07740	732-571-4141	pallone@mail.house.gov	Congressman Frank Pallone	2014-07-11 12:29:31.566815	2014-07-11 12:29:31.566815	\N	\N	\N	\N	Mr. Pallone has consistently shown support for pharmacy initiatives, and his actions have gone above and beyond the call of duty.  In particular he was instrumental in ensuring a fair compounding bill was signed into law in 2013.  Most recently, he was a tireless advocate and provided support on the Energy and Commerce subcommittee toward advancing the provisions of the 2015 CMS Call Letter.  The most important provisions were Any Willing Provider, MAC pricing update and transparency , and MTM.  The efforts on the MAC pricing and transparency were successful and it will be implemented in 2016.
33	Pharmacist Mutual Distinguished Young Pharmacist Award	Penny Catton	908.797.9128	brkeep@comcast.net	Brian J. Catton	126 Wesley Avenue, Cherry Hill, NJ    08002	717.712.4504	brianj.catton@gmail.com	Pharm.D. , Staff Pharmacist	2014-07-13 17:46:09.675829	2014-07-13 17:46:09.675829	\N	\N	\N	\N	Brian has faced many challenges in his life and has come through all of them as a talented young pharmacist.  Brian received his Pharm.D. in 2010 from Shenandoah University, Winchester, Virginia.  He is licensed to practice pharmacy in New Jersey, Pennsylvania, Washington, DC and is working toward licensure in other mid-Atlantic states.  \r\n\r\nCurrently, Brian works as a pharmacist for CVS Pharmacy in the Camden County, New Jersey area.   Brian performs his job with a high degree of efficiency, enthusiasm, and does so in a professional and courteous manner.  He has earned the trust of his patients and those he works with. Brian’s willingness to provide the extra attention needed by his patients has generated letters of appreciation.     His patients know him as “doc” the young pharmacist who wears the bow ties.  \r\nBrian’s commitment to the pharmacy profession goes beyond his work responsibilities.  Since moving back to his home state of New Jersey in 2013, Brian serves on the Journal Committee with the New Jersey Pharmacist Association (NJPA).  \r\n\r\nWhile a resident of Pennsylvania, Brian served two years in a leadership role for Pennsylvania Pharmacists Association (PPA) New Practitioner Advisory Board.  In addition, he was a member of the Public Relations Committee and Education Foundation Board.  In 2012, Brian won the PPA’s Patient Counseling Pain Management Competition.  He also volunteered for a health screening conducted by his church.\r\n\r\nBrian volunteered his professional services by presenting to the Washington, DC Department of Health in an effort to secure grant money to raise awareness for safe sex practices and HIV through social media.    \r\n\r\nBrian continues to regularly serve both the NJPA and PPA organizations as a guest speaker and has also presented webinars for both organizations.   In addition to lecturing to colleagues, Brian has also written several articles for PharmPsych online pharmacy magazine.   \r\n\r\nWhile in high school, Brian participated in many extracurricular activities, earned his Eagle Scout Rank with the Boy Scouts of America and served as the student representative for the Healthcare Institute of New Jersey.  In college, Brian participated in many extracurricular activities, was inducted into Alpha Lambda Delta National Honor Society, was a recipient of the Citizen Scholar Program, and served as class President.\r\n\r\nBrian is truly deserving of the New Jersey Pharmacist Mutual Distinguished Young Pharmacist Award.\r\n
34	Pharmacist Mutual Distinguished Young Pharmacist Award	Victoria Tomshaw	856-816-8887	vtomshaw@aol.com	Brian Catton		717-712-4504	brianj.catton@gmail.com		2014-07-15 01:13:36.025996	2014-07-15 01:13:36.025996	\N	\N	\N	\N	As a nurse practitioner I have dealt with Brian on multiple occasions.  He has been extremely helpful if I have questions concerning medications I could be ordering.  He has been friendly and always wiling to help. Kudos to Brian!
36	Independent Pharmacist of the Year Award	Alan S. Aronovitz, Acting Chairman Region 5 Awards Committee	609-823-8309	asaxpcs@aol.com	Mark Taylor	503 S 4th Ave, Galloway, NJ 08205	609-892-0301	mark@jspharmacy.com	Owner Jersey Shore Pharmacy	2014-07-15 03:21:00.59548	2014-07-15 03:21:00.59548	JSP_Bio_07092014.doc	application/octet-stream	288256	2014-07-15 03:21:00.570962	While patients can get their manufactured medication from any pharmacy, Mark Taylor has had the vision to help his patients solve their individual medical needs by compounding unique dosage forms at his Jersey Shore Pharmacy in Egg Harbor Township, NJ.  Listening carefully to his patients and then consulting with their prescriber, Mark and his team can develop customized medication solutions that meet the health objectives of both people and pets. And while compounding pharmacy has had some unfortunate mishaps recently, Mark is committed to a standard of high quality. Employing state of the art equipment and testing, Jersey Shore Pharmacy recently attained accreditation by the Pharmacy Compounding Accreditation Board (PCAB) for sterile and non-sterile compounding. PCAB accreditation gives patients, prescribers, and payers a way to select a pharmacy that meets or exceeds USP’s high quality standards. They are one of only eight pharmacies in New Jersey that are PCAB accredited.  Professionally, Mark is a member of half a dozen pharmacy organizations as well as serving as Treasurer and Trustee for NJPhA Region 5.  He also serves as a preceptor for all the area pharmacy colleges. I recommend visiting the Jersey Shore Pharmacy website at http://www.jspharmacy.com/ for a truly impressive list of accomplishments and ways in which Mark's team is serving their patients. 
37	Donald J. Wernick Academic Achievement Award	Moriah Weissman	2013150730	moriahjaye@gmail.com	Maria Leibfried		201 401 2304	leibfrim@stjohns.edu		2014-07-15 18:17:19.476641	2014-07-15 18:17:19.476641	\N	\N	\N	\N	 Maria is an amazingly well-rounded pharmacist.  She is an active participant in NJPhA, St. John's, her home church and her daughters’ cheerleading teams.  As a leader in NJPhA, she is the co-chair of the Journal committee; while in this role, she implemented the pharmacy practice spotlight (serving as the panel at this year’s convention), improved the perception of the Journal by implementing peer-review.  In addition to her role as co-chair, she implemented one of the only official student chapters of NJPhA (at St. John’s).  As the advisor of this chapter, she has led her students to become more active in NJPhA, plan bake sales to raise money to fund a bus to convention and they are planning to run a law review for students taking the NJ exam (as it is not currently offered at St. John’s).   She is a dedicated profession who is most deserving of this award – additional details can be found in her resume, attached.\r\n\r\nSigned,\r\nMoriah Weissman\r\n
38	Mortar & Pestle Award	Ruth Marietta	7322992380	ramar040@optonline.net	Elise Barry		609	ebarry@njpharma.org	NjPHA CEO	2014-07-16 10:45:19.647455	2014-07-16 10:45:19.647455	\N	\N	\N	\N	Elise works tirelessly and us dedicated to move the profession forward and is always available to members for support
39	Rosario J. Mannino Award	Elise	609-275-4246	ebarry@njpharma.org	XXX   XXXXXXX		800-123-4567	xxx@gmail.com	Mr.	2014-07-30 21:41:31.780456	2014-07-30 21:41:31.780456	\N	\N	\N	\N	WWWWWWWWWWWWWWWWWWWWWWWWWWWW\r\nXXXXXXXXXXXXXXXXXXXXXXXX
40	NASPA Excellence in Innovation Award\r\nSponsored by Upsher-Smith	Sandra Moore	609-651-1255	scmoorerp@yahoo.com	Chester Lau	Capital Health Regional Medical Center and Capital Health Medical Center - Hopewell	609-815-7656	CLau@capitalhealth.org	Director of Pharmacy	2015-03-05 18:07:59.385593	2015-03-05 18:07:59.385593	Chester_Lau_nomination_NASPA_award.docx	application/vnd.openxmlformats-officedocument.wordprocessingml.document	17245	2015-03-05 18:07:59.306974	Chester Lau is the current Director of Pharmacy at Capital Health Regional Medical Center and Capital Health Medical Center – Hopewell, NJ.  In addition to developing a Pharmacy Residency Program (PGY-1) at Capital Health in 2011, Chester developed and initiated the Mini-Residency (Knights Scholar) program with Rutgers University, EMSOP in 2014 which now expands to 3 NJ hospitals in 2015.  The program began 1/2014 with 4 students participating from 5/2014 to 12/2014. St. Barnabas and Hunterdon Hospitals have decided to implement the program at their hospitals.  There will be 9 Knight Scholars participating in the program for 2015 (4 at Capital Health, 3 at Barnabas and 2 at Hunterdon).   \r\nThe intent of the program is to develop scholarship, service, and leadership in motivated PharmD candidates through a diversified block of advanced pharmacy practice experiences (APPE) in a health-system environment.  Upon completion of the program, the KNIGHT ScholarRx student will have gained: (1) knowledge and skills necessary to function as an active member of the healthcare team; (2) a network of preceptors, practitioners and P4 students who can support his/her student and professional career; (3) innovative experiences that will prepare him/her for success in a postgraduate training program.  In addition to their standard APPE rotation requirements, the scholars, at a minimum, will complete a research project (publication or presentation) – IRB process, good clinical practice guidelines, and the Collaborative Institutional Training Initiative (CITI); participate in a community project in collaboration with other KNIGHT ScholaRx students; present one formal patient case, journal club, and drug information activity during each clinical APPE.\r\nEach KNIGHT ScholaRx is scheduled to complete 4 X 5 week blocks out of their APPE blocks covering internal medicine, infectious disease, critical care and hospital practice.  Their patient care roles include discharge counseling, medication reconciliation, antimicrobial stewardship (IV to PO, kinetic monitoring) and target drug monitoring.\r\nChester has also initiated an annual  meeting  for residents to present their research projects prior to the Eastern State Conference held each year in May.  The purpose is for the residents to practice their presentations prior to the conference and also to showcase their talents.  The invitation is sent to area DOP’s with residency programs.\r\nIt is of my opinion this program enhances the training and practice experience of the students which will enhance patient care.  The data from their interventions supports improving quality of care of the patient and their outcomes.  Chester is very committed to developing our young practitioners to focus on the care our patients receive.\r\nSandra Moore, PharmD\r\nCV for Chester Lau is attached\r\n
41	Mortar & Pestle Award	Carrie Corboy	609-658-3281	rxru95@yahoo.com	Dr. Michael J. Avaltroni	10 Stymiest Road	6093978382	mavaltro@fdu.edu	Dean, FDA School of Pharmacy	2015-03-10 23:47:33.072167	2015-03-10 23:47:33.072167	\N	\N	\N	\N	Dean Avaltroni emphasizes the importance of Professional Association work and encourages participation by directly providing membership to all FDU Students and Faculty to NJPhA.  Dr. Avaltroni has been this supportive for several years now, also encouraging his staff to support student teams in NJPhA competitions at Convention and encouraging their participation on many NJPhA committees.\r\nhttp://view2.fdu.edu/academics/pharmacy/faculty-staff/avaltroni/\r\nhttps://www.linkedin.com/profile/view?id=18636962&authType=NAME_SEARCH&authToken=QcWa&locale=en_US&trk=tyah2&trkInfo=idx%3A1-1-1%2CtarId%3A1426031196275%2Ctas%3Amichael+avaltroni
\.


--
-- Name: award_nominations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('award_nominations_id_seq', 41, true);


--
-- Data for Name: blog_posts; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY blog_posts (id, post_title, post_subtitle, post_url_alias, post_content, blog_id, created_at, updated_at, featured_image_file_name) FROM stdin;
\.


--
-- Name: blog_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('blog_posts_id_seq', 1, false);


--
-- Data for Name: blogs; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY blogs (id, blog_title, created_at, updated_at, blog_url_alias) FROM stdin;
1	News Feed	2014-04-07 20:35:54.200284	2014-04-07 20:35:54.200284	news-feed
2	President's Blog	2014-04-07 20:35:54.214973	2014-04-07 20:35:54.214973	president's-blog
\.


--
-- Name: blogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('blogs_id_seq', 1, false);


--
-- Data for Name: callout_assignments; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY callout_assignments (id, page_id, callout_id, order_num) FROM stdin;
3	44	1	1
4	44	2	2
5	2	18	1
6	2	4	2
7	3	5	1
8	3	6	2
9	4	15	1
10	4	8	2
11	45	9	1
12	45	10	2
13	5	9	1
14	5	10	2
15	6	25	1
16	6	12	2
17	7	5	1
18	7	11	2
19	10	18	1
20	10	15	2
21	11	5	1
22	11	13	2
23	50	14	1
24	50	15	2
25	50	16	3
26	12	14	1
27	12	15	2
28	12	16	3
29	13	18	1
30	14	4	1
31	14	17	2
32	15	18	1
33	15	19	2
34	16	12	1
35	16	21	2
36	17	6	1
37	17	8	2
38	18	13	1
39	18	15	2
40	19	18	1
41	19	9	2
42	20	8	1
43	20	19	2
44	21	5	1
45	21	20	2
46	22	5	1
47	22	4	2
48	30	18	1
49	30	22	2
50	48	18	1
51	48	22	2
52	31	13	1
53	31	23	2
54	32	23	1
55	32	4	2
56	23	13	1
57	23	6	2
58	23	24	3
59	24	17	1
60	24	5	2
61	25	4	1
62	25	15	2
63	26	18	1
64	26	10	2
65	27	2	1
66	27	14	2
67	29	1	1
68	29	20	2
69	1	1	1
70	1	2	2
71	13	26	2
72	9	9	1
73	9	12	2
74	16	27	3
75	47	27	1
76	17	27	3
77	19	27	3
78	18	27	3
79	20	27	3
80	21	27	3
81	22	27	3
82	24	28	3
83	46	28	1
84	46	18	2
\.


--
-- Name: callout_assignments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('callout_assignments_id_seq', 86, true);


--
-- Data for Name: callouts; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY callouts (id, callout_title, callout_content, created_at, updated_at) FROM stdin;
6	Contemplating a Change?	<h2>Contemplating a Change?</h2>\r\n<p>Check out the Career Center</p>\r\n<p>{% link_pg button, false, _self, btn-default, 25, Go Now %}</p>\r\n\r\n	2014-04-10 15:39:55.224697	2014-04-21 18:09:54.718816
8	Attend a Specialty Forum	<h2>Attend a Specialty Forum</h2>\r\n<p>NJPhA Academies keep you current</p>\r\n<p>{% link_pg button, false, _self, btn-default, 21, See How %}</p>\r\n\r\n	2014-04-10 15:42:29.003964	2014-04-21 18:11:50.304573
9	NJPhA Benefits	<h2>NJPhA Benefits</h2>\r\n<p>Education, news, networking & more</p>\r\n<p>{% link_pg button, false, _self, btn-default, 6, Get the Details %}</p>\r\n\r\n	2014-04-10 15:43:39.105874	2014-04-21 18:13:25.452303
10	Student Chapters	<h2>Student Chapters</h2>\r\n<p>Special rates for pharmacy’s future</p>\r\n<p>{% link_pg button, false, _self, btn-default, 11, Join Today %}</p>\r\n\r\n	2014-04-10 15:46:22.129955	2014-04-21 18:14:06.471653
11	NJPhA Resource Center	<h2>NJPhA Resource Center</h2>\r\n<p>Job notices, helpful links & the E-journal</p>\r\n<p>{% link_pg button, false, _self, btn-default, 23, Visit Now %}</p>\r\n\r\n	2014-04-10 15:46:59.791777	2014-04-21 18:14:43.12396
12	Get Certified in a Specialty	<h2>Get Certified in a Specialty</h2>\r\n<p>APhA programs via NJPhA</p>\r\n<p>{% link_pg button, false, _self, btn-default, 20, Learn More %}</p>\r\n\r\n	2014-04-10 15:47:47.168151	2014-04-21 18:15:36.000719
2	Join a Committee	<h2>Join a Committee</h2>\r\n\r\n<p>Finance, political action &amp; more</p>\r\n\r\n<p>{% link_pg button, false, _self, btn-default, 4, Get Details %}</p>\r\n	2014-04-10 14:57:05.65233	2014-04-21 16:00:44.132709
4	Not a Member?	<h2>Not a Member? </h2>\r\n<p>It’s easy to join NJPhA</p>\r\n<p>{% link_pg button, false, _self, btn-default, 7, Sign Up %}</p>\r\n\r\n	2014-04-10 15:18:21.525492	2014-04-21 18:07:35.17038
13	Research News & Best Practices  	<h2>Research News &amp; Best Practices</h2>\r\n\r\n<p>All in <em>The New Jersey Journal of Pharmacy</em></p>\r\n\r\n<p>{% link_pg button, false, _self, btn-default, 24, View Now %}</p>\r\n	2014-04-10 15:48:29.217652	2014-04-27 00:48:55.957988
1	Make a Difference	<h2>Make a Difference</h2>\r\n<p>Help guide NJPhA \r\n<p>{% link_pg button, false, _self, btn-mini, 3, Learn How %}</p>\r\n	2014-04-10 14:54:20.442362	2014-04-21 15:27:22.172742
14	NJPhA Legislative Day 	<h2>NJPhA Legislative Day </h2>\r\n<p>Meet legislators who impact pharmacy</p>\r\n<p>{% link_pg button, false, _self, btn-default, 15, Learn More %}</p>\r\n\r\n	2014-04-10 15:49:27.33069	2014-04-21 18:17:00.261593
18	Help Us to Help You	<h2>Help Us to Help You</h2>\r\n<p>Support NJPhA PAC</p>\r\n<p>{% link_pg button, false, _self, btn-default, 32, Learn How %}</p>\r\n\r\n	2014-04-10 15:57:24.685696	2014-04-21 18:05:42.815478
17	Several Education Tracks	<h2>Several Education Tracks</h2>\r\n\r\n<p>Live, online, certification & Academies</p>\r\n\r\n<p>{% link_pg button, false, _self, btn-default, 16, Get the Details %}</p>\r\n\r\n	2014-04-10 15:54:50.410052	2014-04-21 18:39:14.874235
20	Want to Honor a Peer?	<h2>Want to Honor a Peer?</h2>\r\n\r\n<p>Nominate them for an award</p>\r\n\r\n<p>{% link_pg button, false, _self, btn-default, 10, Learn How %}</p>\r\n	2014-04-10 16:00:32.211914	2014-04-21 18:43:33.293929
21	Local Continuing Education	<h2>Local Continuing Education</h2>\r\n<p>See what's scheduled for your region</p>\r\n<p>{% link_pg button, false, _self, btn-default, 17, View Now %}</p>\r\n	2014-04-10 16:01:15.118748	2014-04-21 18:44:48.476868
22	Pharmacy Bills in Trenton	<h2>Pharmacy Bills in Trenton</h2>\r\n<p>See where they stand</p>\r\n<p>{% link_pg button, false, _self, btn-default, 31, View Now %}</p>\r\n	2014-04-10 16:02:05.131043	2014-04-21 18:45:53.395421
24	Online Resources for Pharmacists	<h2>Online Resources for Pharmacists</h2>\r\n<p>Information for all aspects of your practice</p>\r\n<p>{% link_pg button, false, _self, btn-default, 26, View Now %}</p>\r\n\r\n	2014-04-10 16:03:20.725469	2014-04-21 18:48:09.4769
23	Who's Your Legislator?	<h2>Who&#39;s Your Legislator?</h2>\r\n\r\n<p>This page will find your representative</p>\r\n\r\n<p>{% link_pg button, false, _blank, btn-default, http://www.njleg.state.nj.us/members/legsearch.asp, Go Now %}</p>\r\n	2014-04-10 16:02:43.148735	2014-04-21 18:51:20.757837
16	Catch Up on CEUs	<h2>Catch Up on CEUs</h2>\r\n\r\n<p>Join March Madness</p>\r\n\r\n<p>{% link_pg button, false, _self, btn-default, 14, Learn More %}</p>\r\n	2014-04-10 15:53:54.432862	2014-04-23 15:40:54.510091
19	Monitor Pharmacy Legislation	<h2>Monitor Pharmacy Legislation</h2>\r\n\r\n<p>Check bill status 24/7</p>\r\n\r\n<p>{% link_pg button, false, _self, btn-default, 31, Go Now %}</p>\r\n	2014-04-10 15:58:35.249232	2014-04-26 21:48:27.253314
15	Learn and Enjoy	<h2>Learn and Enjoy</h2>\r\n\r\n<p>Attend the Annual Meeting and Convention</p>\r\n\r\n<p>{% link_pg button, false, _self, btn-default, 13, Register Today %}</p>\r\n	2014-04-10 15:52:30.558019	2014-04-26 22:27:05.522327
5	Continuing Ed, Networking & More	<h2>Continuing Ed, Networking & More</h2>\r\n<p>See what’s happening in NJ</p>\r\n<p>{% link_pg button, false, _self, btn-default, 12, View the Calendar %}</p>\r\n	2014-04-10 15:19:15.782181	2014-04-21 18:08:59.26857
28	Poster Session	<h2 style="font-weight: normal; line-height: 1.2; color: rgb(51, 51, 51); font-family: adelle-sans, arial, sans-serif;">Present a Poster</h2>\r\n\r\n<p style="color: rgb(51, 51, 51); font-family: adelle-sans, arial, sans-serif; font-size: 13px; line-height: 20.799999237060547px;">Show your research at the Annual Meeting and Convention &nbsp;</p>\r\n\r\n<p style="color: rgb(51, 51, 51); font-family: adelle-sans, arial, sans-serif; font-size: 13px; line-height: 20.799999237060547px;">{% link_pg button, false, _blank, btn-default, http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/28/original_2014conventionposter.pdf, Register Today%}</p>\r\n	2014-04-30 13:35:00.937263	2014-05-01 00:33:48.595217
27	You Have Enough CE Credits	<h2>You Have Enough CE Credits</h2>\r\n\r\n<p>But are they the right ones?</p>\r\n\r\n<p>{% link_pg button, false, _credits, btn-default, http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/attachments/65/njpha_chart_v7.pdf, Check Here%}</p>\r\n	2014-04-28 17:51:29.980844	2014-05-23 03:24:27.685246
25	Membership Current?	<h2>Membership Current?</h2>\r\n\r\n<p>Log in to check your status</p>\r\n\r\n<p>{% link_pg button, false, _self, btn-default, 33, View Now %}</p>\r\n	2014-04-21 19:08:27.738674	2014-05-21 18:50:19.296081
26	Convention 2014 Poster Call	<h2>Convention 2014 Poster Call</h2>\r\n\r\n<p>Show your work at the convention</p>\r\n\r\n<p>{% link_pg button, false, _blank, btn-default,http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/attachments/62/annconvention_callposters_v4.docx, Get Details %}</p>\r\n	2014-04-23 19:32:21.792292	2014-05-21 18:53:17.317826
7	Annual Convention Planning Underway for 2015!	<h2>Annual Convention Coming Up</h2>\r\n<p>Learn, renew ties & create new ones</p>\r\n<p>{% link_pg button, false, _self, btn-default, 13, Register Now %}</p>\r\n\r\n	2014-04-10 15:40:44.247765	2014-11-18 20:37:17.233161
\.


--
-- Name: callouts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('callouts_id_seq', 29, true);


--
-- Data for Name: callouts_pages; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY callouts_pages (id, page_id, callout_id) FROM stdin;
1	1	2
2	1	1
4	2	4
5	2	18
6	2	4
9	4	7
10	4	8
11	4	19
12	5	9
13	5	10
14	7	11
15	6	12
16	11	13
17	12	15
18	12	14
19	12	16
20	12	15
21	12	14
22	13	18
23	13	17
24	15	19
25	21	20
26	16	21
27	30	22
28	30	23
29	23	24
30	6	12
31	6	4
32	3	6
33	3	5
34	44	2
35	44	1
\.


--
-- Name: callouts_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('callouts_pages_id_seq', 35, true);


--
-- Data for Name: ckeditor_assets; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY ckeditor_assets (id, data_file_name, data_content_type, data_file_size, assetable_id, assetable_type, type, width, height, created_at, updated_at) FROM stdin;
2	nj_map.jpg	image/jpeg	159986	\N	\N	Ckeditor::Picture	427	632	2014-04-11 18:00:58.527874	2014-04-11 18:00:58.527874
3	organizationstructure.png	image/png	32920	\N	\N	Ckeditor::Picture	475	629	2014-04-11 18:10:08.103281	2014-04-11 18:10:08.103281
4	carrie_letter.png	image/png	118423	\N	\N	Ckeditor::Picture	599	312	2014-04-11 18:38:49.245868	2014-04-11 18:38:49.245868
5	carrie_signature.png	image/png	4151	\N	\N	Ckeditor::Picture	101	34	2014-04-11 18:51:02.347435	2014-04-11 18:51:02.347435
6	logo.png	image/png	13079	\N	\N	Ckeditor::Picture	165	44	2014-04-11 18:51:45.023351	2014-04-11 18:51:45.023351
8	acpe.jpg	image/jpeg	17721	\N	\N	Ckeditor::Picture	80	80	2014-04-11 19:10:17.881307	2014-04-11 19:10:17.881307
9	region_1.png	image/png	9660	\N	\N	Ckeditor::Picture	87	82	2014-04-11 19:34:52.382727	2014-04-11 19:34:52.382727
10	region_2.png	image/png	36679	\N	\N	Ckeditor::Picture	242	186	2014-04-11 19:35:41.61734	2014-04-11 19:35:41.61734
11	region_3.png	image/png	34824	\N	\N	Ckeditor::Picture	239	197	2014-04-11 19:36:26.801547	2014-04-11 19:36:26.801547
12	region_4.png	image/png	39974	\N	\N	Ckeditor::Picture	237	218	2014-04-11 19:36:50.404494	2014-04-11 19:36:50.404494
13	region_5.png	image/png	40184	\N	\N	Ckeditor::Picture	303	205	2014-04-11 19:37:19.307383	2014-04-11 19:37:19.307383
14	region_6.png	image/png	27978	\N	\N	Ckeditor::Picture	224	155	2014-04-11 19:37:39.207685	2014-04-11 19:37:39.207685
15	apha.jpg	image/jpeg	30506	\N	\N	Ckeditor::Picture	332	85	2014-04-11 19:48:39.126561	2014-04-11 19:48:39.126561
16	aade.jpg	image/jpeg	32207	\N	\N	Ckeditor::Picture	314	58	2014-04-11 19:49:50.084672	2014-04-11 19:49:50.084672
17	joseph.jpg	image/jpeg	35672	\N	\N	Ckeditor::Picture	125	187	2014-04-11 20:48:50.979389	2014-04-11 20:48:50.979389
18	carrie.jpg	image/jpeg	42166	\N	\N	Ckeditor::Picture	125	187	2014-04-11 20:49:49.594084	2014-04-11 20:49:49.594084
19	christine.jpg	image/jpeg	42555	\N	\N	Ckeditor::Picture	125	187	2014-04-11 20:49:50.752083	2014-04-11 20:49:50.752083
20	john.jpg	image/jpeg	33186	\N	\N	Ckeditor::Picture	125	187	2014-04-11 20:49:51.694663	2014-04-11 20:49:51.694663
21	moriah.jpg	image/jpeg	36905	\N	\N	Ckeditor::Picture	125	187	2014-04-11 20:49:52.871163	2014-04-11 20:49:52.871163
26	hotel_image.jpg	image/jpeg	352031	4	User	Ckeditor::Picture	600	704	2014-04-23 15:37:09.390476	2014-04-23 15:37:09.390476
27	wgcc-productcatalog.pdf	application/pdf	1292442	4	User	Ckeditor::Picture	\N	\N	2014-04-23 15:37:20.120864	2014-04-23 15:37:20.120864
28	2014conventionposter.pdf	application/pdf	213425	4	User	Ckeditor::Picture	\N	\N	2014-04-23 15:46:08.302403	2014-04-23 15:46:08.302403
30	home_political.png	image/png	10262	4	User	Ckeditor::Picture	223	111	2014-04-23 17:26:12.323899	2014-04-23 17:26:12.323899
34	summer_camp_2014_rev4.pdf	application/pdf	440657	4	User	Ckeditor::Picture	\N	\N	2014-04-23 17:28:22.468742	2014-04-23 17:28:22.468742
35	29527_spring2014_low-res-final.pdf	application/pdf	2998475	4	User	Ckeditor::AttachmentFile	\N	\N	2014-04-24 21:15:18.168756	2014-04-24 21:15:18.168756
36	annual_report_2013_v2.pdf	application/pdf	124713	4	User	Ckeditor::AttachmentFile	\N	\N	2014-04-28 02:43:09.510901	2014-04-28 02:43:09.510901
37	annual_report_2013_v2.pdf	application/pdf	124713	4	User	Ckeditor::AttachmentFile	\N	\N	2014-04-28 02:47:36.951675	2014-04-28 02:47:36.951675
38	home_calendar.png	image/png	8875	4	User	Ckeditor::Picture	223	111	2014-04-28 15:24:43.547939	2014-04-28 15:24:43.547939
39	home_education.png	image/png	8675	4	User	Ckeditor::Picture	223	111	2014-04-28 15:25:00.730123	2014-04-28 15:25:00.730123
40	home_student.png	image/png	11693	4	User	Ckeditor::Picture	223	111	2014-04-28 15:25:46.587254	2014-04-28 15:25:46.587254
41	njpha_rightcreditschart_v3.pdf	application/pdf	317716	4	User	Ckeditor::AttachmentFile	\N	\N	2014-04-28 17:50:37.855192	2014-04-28 17:50:37.855192
42	njpha_logo_from_site.png	image/png	14105	4	User	Ckeditor::Picture	175	57	2014-04-30 09:52:08.28495	2014-04-30 09:52:08.28495
43	njpha_journal_author_guidelines_april_2014.pdf	application/pdf	359221	7	User	Ckeditor::AttachmentFile	\N	\N	2014-04-30 16:18:23.772206	2014-04-30 16:18:23.772206
44	mtm_logo.jpg	image/jpeg	304857	7	User	Ckeditor::Picture	823	767	2014-04-30 20:29:57.685127	2014-04-30 20:29:57.685127
45	diabeteslogo_small.jpg	image/jpeg	20051	7	User	Ckeditor::Picture	311	68	2014-04-30 20:32:38.517792	2014-04-30 20:32:38.517792
46	immunization_final.jpg	image/jpeg	815810	7	User	Ckeditor::Picture	689	689	2014-05-01 00:19:06.349106	2014-05-01 00:19:06.349106
48	home_info.png	image/png	20804	7	User	Ckeditor::Picture	952	88	2014-05-01 19:34:35.175203	2014-05-01 19:34:35.175203
49	home_info.png	image/png	21314	7	User	Ckeditor::Picture	952	88	2014-05-05 18:26:56.04823	2014-05-05 18:26:56.04823
50	home_calendar_new2.png	image/png	10392	7	User	Ckeditor::Picture	223	111	2014-05-15 19:39:35.590448	2014-05-15 19:39:35.590448
51	home_calendar_new.png	image/png	9007	7	User	Ckeditor::Picture	223	111	2014-05-15 19:39:39.949152	2014-05-15 19:39:39.949152
52	home_education_new.png	image/png	7821	7	User	Ckeditor::Picture	223	111	2014-05-15 19:39:44.357328	2014-05-15 19:39:44.357328
53	home_education_new2.png	image/png	10428	7	User	Ckeditor::Picture	223	111	2014-05-15 19:39:52.532121	2014-05-15 19:39:52.532121
54	home_political_new.png	image/png	6603	7	User	Ckeditor::Picture	223	111	2014-05-15 19:40:17.203699	2014-05-15 19:40:17.203699
55	home_political_new2.png	image/png	9236	7	User	Ckeditor::Picture	223	111	2014-05-15 19:40:21.635454	2014-05-15 19:40:21.635454
56	home_student_new2.png	image/png	12672	7	User	Ckeditor::Picture	223	111	2014-05-15 19:40:25.221703	2014-05-15 19:40:25.221703
57	home_student_new.png	image/png	8838	7	User	Ckeditor::Picture	223	111	2014-05-15 19:40:32.719718	2014-05-15 19:40:32.719718
58	annconvention_callposters_v4.docx	application/vnd.openxmlformats-officedocument.wordprocessingml.document	965416	7	User	Ckeditor::AttachmentFile	\N	\N	2014-05-15 19:40:43.589146	2014-05-15 19:40:43.589146
59	annconvention_callposters_v4.docx	application/vnd.openxmlformats-officedocument.wordprocessingml.document	965416	7	User	Ckeditor::AttachmentFile	\N	\N	2014-05-15 19:40:45.845915	2014-05-15 19:40:45.845915
60	njpha_rightcreditschart_v4.pdf	application/pdf	319167	7	User	Ckeditor::AttachmentFile	\N	\N	2014-05-21 17:25:01.790884	2014-05-21 17:25:01.790884
61	annconvention_callposters_v4.docx	application/vnd.openxmlformats-officedocument.wordprocessingml.document	965416	7	User	Ckeditor::AttachmentFile	\N	\N	2014-05-21 18:32:28.200642	2014-05-21 18:32:28.200642
62	annconvention_callposters_v4.docx	application/vnd.openxmlformats-officedocument.wordprocessingml.document	965422	7	User	Ckeditor::AttachmentFile	\N	\N	2014-05-21 18:41:16.996396	2014-05-21 18:41:16.996396
63	njpha_chart_v6.pdf	application/pdf	3340754	7	User	Ckeditor::AttachmentFile	\N	\N	2014-05-22 17:59:08.737147	2014-05-22 17:59:08.737147
64	njpha_chart_v6.pdf	application/pdf	197668	7	User	Ckeditor::AttachmentFile	\N	\N	2014-05-22 18:06:45.41532	2014-05-22 18:06:45.41532
65	njpha_chart_v7.pdf	application/pdf	225219	7	User	Ckeditor::AttachmentFile	\N	\N	2014-05-23 03:23:10.239682	2014-05-23 03:23:10.239682
66	29226_fall-winter_low_res-final.pdf	application/pdf	4646699	11	User	Ckeditor::AttachmentFile	\N	\N	2014-08-01 20:06:12.837758	2014-08-01 20:06:12.837758
67	29897_summer_final.pdf	application/pdf	6868148	11	User	Ckeditor::AttachmentFile	\N	\N	2014-08-01 20:36:03.14627	2014-08-01 20:36:03.14627
68	29897_summer_final.pdf	application/pdf	6868148	11	User	Ckeditor::AttachmentFile	\N	\N	2014-08-04 15:35:27.139684	2014-08-04 15:35:27.139684
69	ruth_marrietta.jpg	image/jpeg	68831	11	User	Ckeditor::Picture	640	480	2014-08-08 17:50:03.359552	2014-08-08 17:50:03.359552
70	ruth_marrietta.jpg	image/jpeg	68831	11	User	Ckeditor::Picture	640	480	2014-08-08 17:51:04.649204	2014-08-08 17:51:04.649204
71	njpha_ce_program_antimicrobial_stewardship_nov_2014_compatibility_mode.pdf	application/pdf	515880	11	User	Ckeditor::AttachmentFile	\N	\N	2014-10-14 17:41:59.959904	2014-10-14 17:41:59.959904
72	njpha_-_herbals_november_16th_region_4_ce_final_rvised_10142014_compatibility_mode.pdf	application/pdf	547137	11	User	Ckeditor::AttachmentFile	\N	\N	2014-10-14 18:16:00.745002	2014-10-14 18:16:00.745002
73	content_carrie_letter_v2.png	image/png	119484	11	User	Ckeditor::Picture	599	312	2014-10-15 18:19:36.290361	2014-10-15 18:19:36.290361
74	njpha_-_lyme_s_disease_november_7_2014.ppt	application/vnd.ms-powerpoint	2737664	11	User	Ckeditor::AttachmentFile	\N	\N	2014-10-17 15:56:23.106605	2014-10-17 15:56:23.106605
75	mweissman_headshot_-_original.jpeg	image/jpeg	185674	11	User	Ckeditor::Picture	853	1280	2014-10-21 02:09:29.497054	2014-10-21 02:09:29.497054
76	mw-membershipnote.jpg	image/jpeg	48248	11	User	Ckeditor::Picture	839	398	2014-10-21 02:42:26.101067	2014-10-21 02:42:26.101067
77	mw-membershipnote.jpg	image/jpeg	62478	11	User	Ckeditor::Picture	633	319	2014-10-21 02:46:40.416167	2014-10-21 02:46:40.416167
78	hiv_today_examining_the_latest_treatment_advances_and_barriers_to_success_2014_compatibility_mode.pdf	application/pdf	871734	11	User	Ckeditor::AttachmentFile	\N	\N	2014-10-27 14:02:08.552339	2014-10-27 14:02:08.552339
79	menopause_herbals_2014_-_handout_compatibility_mode.pdf	application/pdf	302843	11	User	Ckeditor::AttachmentFile	\N	\N	2014-10-27 20:42:36.892721	2014-10-27 20:42:36.892721
81	rmannino.jpg	image/jpeg	48174	11	User	Ckeditor::Picture	896	768	2014-12-14 22:14:26.634478	2014-12-14 22:14:26.634478
82	compoundinglogo-k.jpg	image/jpeg	24003	11	User	Ckeditor::Picture	608	170	2015-02-16 07:48:57.611662	2015-02-16 07:48:57.611662
83	compoundinglogo-color.png	image/png	16245	11	User	Ckeditor::Picture	608	170	2015-02-17 13:37:30.962835	2015-02-17 13:37:30.962835
84	annual_convention_banner.jpg	image/jpeg	25237	\N	\N	Ckeditor::Picture	1502	140	2015-02-19 17:08:51.750277	2015-02-19 17:08:51.750277
85	oct_event_2015_banner.jpg	image/jpeg	19499	11	User	Ckeditor::Picture	1502	140	2015-02-19 18:50:02.634514	2015-02-19 18:50:02.634514
86	oct_event_2015_banner.jpg	image/jpeg	25249	11	User	Ckeditor::Picture	1502	140	2015-02-19 18:51:32.501116	2015-02-19 18:51:32.501116
87	pcpc_logo_sm.jpg	image/jpeg	639202	11	User	Ckeditor::Picture	497	300	2015-02-25 05:07:04.821802	2015-02-25 05:07:04.821802
89	orginal_njvma_program_logo_ii.jpg	image/jpeg	25228	11	User	Ckeditor::Picture	390	337	2015-02-25 15:14:57.855513	2015-02-25 15:14:57.855513
90	pharmmutual.jpg	image/jpeg	16489	11	User	Ckeditor::Picture	338	168	2015-02-25 15:53:10.930381	2015-02-25 15:53:10.930381
91	rdc_logo_-_no_words.jpg	image/jpeg	257410	11	User	Ckeditor::Picture	3600	1800	2015-02-25 15:53:12.430258	2015-02-25 15:53:12.430258
92	paradigmn.jpg	image/jpeg	3469	11	User	Ckeditor::Picture	85	95	2015-03-03 15:59:59.526971	2015-03-03 15:59:59.526971
93	program_confirmation_letter-new_jersey.jpg	image/jpeg	3851	11	User	Ckeditor::Picture	220	60	2015-03-03 16:15:34.281497	2015-03-03 16:15:34.281497
94	tonic_i.jpg	image/jpeg	9845	11	User	Ckeditor::Picture	417	152	2015-03-09 23:22:55.680385	2015-03-09 23:22:55.680385
95	tonic_tag_ii.jpg	image/jpeg	28230	11	User	Ckeditor::Picture	1039	142	2015-03-09 23:38:07.010272	2015-03-09 23:38:07.010272
96	instagram.png	image/png	32590	11	User	Ckeditor::Picture	225	225	2015-03-17 13:47:27.665308	2015-03-17 13:47:27.665308
\.


--
-- Name: ckeditor_assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('ckeditor_assets_id_seq', 96, true);


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY pages (id, page_title, url_alias, template_id, meta_keywords, meta_description, page_content, parent_page_id, created_at, updated_at, order_num, include_in_header_menu, include_in_footer_menu, is_redirect, redirect_url, is_members_only, is_homepage, meta_title, is_private) FROM stdin;
45	Overview	 Overview Membership	\N				5	2014-04-21 15:24:12.868886	2014-05-08 15:58:39.128378	1	t	t	t	/membership	f	f		\N
11	Student Chapter	student-chapter	\N	NJPHA, student, pharmacy student, student chapter	Pharmacy students can join the New Jersey Pharmacists Association at a greatly reduced rate, yet receive all the benefits of full membership. 	<h1>Pharmacy Students&nbsp;&ndash;&nbsp;Welcome!</h1>\r\n\r\n<p>You&rsquo;re the future of our profession, which is why NJPhA created a special, {% link_pg link , false , , , 7 , reduced-rate membership plan%} to get you involved in Association activities and {% link_pg link , false , , , 12 , networking with your peers %}.</p>\r\n\r\n<p>NJPhA believes in preserving the past, honoring the present, and shaping the future, so we&rsquo;re very pleased to be represented on campus at colleges and schools of pharmacy.</p>\r\n\r\n<ul>\r\n\t<li>Rutgers University &ndash; <a href="http://pharmacy.rutgers.edu/">Ernest Mario School of Pharmacy</a></li>\r\n\t<li><a href="http://www.fdu.edu/academic/pharmacy">Farleigh Dickinson University School of Pharmacy</a></li>\r\n\t<li>University of the Sciences in Philadelphia &ndash; <a href="http://www.usciences.edu/academics/collegesdepts/pharmpracticeadmin/pharmd">Philadelphia College of Pharmacy</a></li>\r\n\t<li><a href="http://www.temple.edu/pharmacy/" target="_blank">Temple University School of Pharmacy</a></li>\r\n\t<li>Saint John&rsquo;s University &ndash; <a href="http://www.stjohns.edu/academics/schools-and-colleges/college-pharmacy-and-health-sciences">College of Pharmacy and Health Sciences</a></li>\r\n\t<li>Long Island University Pharmacy - <a href="http://www.liunet.edu/Pharmacy">The Arnold and Marie Schwartz College of Pharmacy and Health Science at Long Island University</a>&nbsp;</li>\r\n\t<li>Thomas Jefferson University &ndash;<a href="http://www.jefferson.edu/university/pharmacy.html">Jefferson School of Pharmacy</a></li>\r\n</ul>\r\n\r\n<h2>Student rates, full-scale activities</h2>\r\n\r\n<p>Our student chapter locations introduce you to a community of pharmacy students who live in or plan to practice in New Jersey. Students are welcome at <strong>ALL</strong> NJPhA events, including {% link_pg link , false , , , 15 , Legislative Day %} in Trenton, {% link_pg link , false , , , 17 , regional meetings&nbsp;%}, {% link_pg link , false , , , 16 , continuing education activities%}, {% link_pg link , false , , , 14 , March Madness%} and the {% link_pg link , false , , , 13 , Annual Meeting and Convention%}. Student members can also submit articles for publication in New Jersey&rsquo;s peer-reviewed {% link_pg link , false , , , 24 , pharmacy journal%}.</p>\r\n\r\n<p>You&rsquo;ll also receive the pharmacy-student-generated newsletter, which highlights the student activities and programs throughout all the student chapters.</p>\r\n\r\n<p>Not a member? Student rates make it easy to {% link_pg link , false , , , 7 , join NJPhA %}.</p>\r\n\r\n<p>{% link_pg button, false, _self, btn-large, 7, Join Now %}</p>\r\n	5	2014-04-09 18:47:33.150829	2014-05-08 18:41:36.748832	5	t	f	f		f	f	NJPHA Student Chapter	\N
47	Overview	continuing-education-overview	\N				16	2014-04-21 15:32:18.128292	2014-04-21 16:06:52.75707	1	t	t	t	/continuing-education	f	f		\N
44	About Us	about-us	\N				1	2014-04-21 14:46:30.686158	2014-04-21 15:15:40.306724	1	t	t	t	/about	f	f		\N
46	Event Calendar	event-calendar	\N	 			12	2014-04-21 15:27:55.882174	2014-05-08 20:59:42.979722	1	t	t	t	/events	f	f	 	\N
48	Overview	overview	\N				30	2014-04-21 15:53:23.992112	2014-04-21 15:53:23.992112	1	t	t	t	/political-action	f	f		\N
49	Overview	overview	\N				23	2014-04-21 15:56:24.148395	2014-04-21 15:56:24.148395	1	t	t	t	/resources	f	f		\N
27	Annual Report	annual-report	\N	NJPhA Annual Report	Visit NJPhA.org to access several types of pharmacy and healthcare resources. Members can access the Annual Report of the New Jersey Pharmacists Association.  	<h1>Annual Report</h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>{% members_only %}</p>\r\n\r\n<p>2013 was a busy and productive year for NJPhA and it&rsquo;s members. <a href="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/attachments/37/annual_report_2013_v2.pdf">Download the Annual Report</a> to learn what NJPhA accomplished and what plans and objectives are in store for 2014.</p>\r\n\r\n<p>{% endmembers_only %}</p>\r\n\r\n<p>{% non_members_only %} 2013 was a busy and productive year for NJPhA and it&rsquo;s members. NJPhA members may download the annual report after they {% link_pg link , false , , , 33 , log in%}. If you&#39;re not a member, you can {% link_pg link , false , , , 7 , join now%} and then access the report.</p>\r\n\r\n<p>{% endnon_members_only %}</p>\r\n	23	2014-04-09 20:41:26.033499	2014-05-08 20:53:24.704378	5	t	t	f		f	f	Annual Report	\N
1	About	about	\N	About NJPhA, NJPhA, new jersey pharmacists association 	The New Jersey Pharmacists Association (NJPHA) advances the profession of pharmacy through education and advocacy to help members provide optimal care to those they serve.	<h1>About Us</h1>\r\n\r\n<p>It&rsquo;s not about us. NJPhA is about <strong>you</strong> and your <strong>patients</strong>.<br />\r\n<br />\r\nEstablished in 1870 as The New Jersey Pharmaceutical Association and renamed the New Jersey Pharmacists Association (NJPhA) in 1996, the Association&rsquo;s mission is to advance the profession of pharmacy, enabling our members to provide optimal care to those they serve.</p>\r\n\r\n<h2>How the NJPhA works for you</h2>\r\n\r\n<ul>\r\n\t<li><strong>Advocate</strong>&nbsp;&nbsp;<br />\r\n\tWe work at all levels of government to protect the interest of you and your patients, <em>including </em>state and federal legal representation</li>\r\n\t<li><strong>Educate</strong> &nbsp;<br />\r\n\tWe organize local Continuing Education programs and identify other training opportunities to keep you informed and your skills current</li>\r\n\t<li><strong>Communicate&nbsp;</strong><br />\r\n\tNJPhA shares a rich collection of technical and career resources, including the online version of the <em>New Jersey Journal of Pharmacy</em></li>\r\n</ul>\r\n\r\n<h2>A legacy of pharmacy leadership</h2>\r\n\r\n<p>NJPhA was one of the first state pharmacy associations to affiliate with the American Pharmacists Association (APhA), and 4 NJPhA presidents eventually went on to lead APhA.* If you&rsquo;re a member, consider {% link_pg link , false , , , 3 , taking on a leadership role %} or {% link_pg link , false , , , 4 , join a committee %}. If you&rsquo;re not a member, {% link_pg link , false , , , 7, join today %}.</p>\r\n\r\n<p>Without an active membership, it will be difficult for NJPhA to impact the growing list of challenges that your practice and patients face today and need to prepare for tomorrow.</p>\r\n\r\n<p><span style="font-size:12px;"><em>*George Beringer, Jr., Charles Holzhauzer, Charles Holton and Robert Fischelis</em></span></p>\r\n	\N	2014-04-08 18:26:07.174209	2014-05-08 16:17:01.159183	1	t	t	f		f	f	About	\N
8	Payment Confirmation	payment-confirmed	\N			<p><img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/6/content_logo.png" style="width: 165px; height: 44px;" /></p>\r\n\r\n<p>New Jersey Pharmacist Association Membership Payment<br />\r\n760 Alexander Road<br />\r\nPO Box 1<br />\r\nPrinceton, NJ 08543-0001</p>\r\n\r\n<p>Thank you for joining NJPhA. If you have any questions, please contact <a href="ksingletary@njpharma.org">Karen Singletary</a>.</p>\r\n\r\n<p>Thank you,</p>\r\n\r\n<p><img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/5/content_carrie_signature.png" style="width: 101px; height: 34px;" /><br />\r\nCarrie Corboy, RPh, PharmD, CCP<br />\r\nPresident</p>\r\n	7	2014-04-09 18:17:17.183281	2014-04-15 18:07:41.541333	2	f	f	f		\N	\N	\N	\N
22	Sponsored Topics	sponsored-topics	\N			<h1><strong>[Topic Headline]</strong></h1>\r\n\r\n<p>NJPhA works with commercial pharmaceutical partners to bring you contemporary information related to disease management, therapeutic strategy and other issues relevant to patient care and to your practice.</p>\r\n\r\n<p>This article&hellip;[insert brief summary here]</p>\r\n\r\n<p>[Article begins here. Use subheads liberally. See here for <a href="http://www.gskoncology.com/supporting-oncology-nurses/issues.html">an example</a>.]</p>\r\n	16	2014-04-09 20:22:29.250444	2014-04-21 15:47:33.272889	7	f	f	f		f	f		\N
3	NJPhA Leadership	leadership	\N	NJPHA, New Jersey Pharmacist, Leadership, njpha leader	NJPhA seeks more leaders to help guide pharmacy continuing education, pharmacy advocacy and other programs for pharmacists, pharmacy technicians and the profession. 	<h1>NJPhA Leadership</h1>\r\n\r\n<p>There&rsquo;s a lot going on within the Association&mdash;broadening educational programming, strengthening ties with pharmacy schools in New Jersey and beyond, maximizing our {% link_pg link , false , , , 30 , effectiveness in Trenton%}, and more&mdash;and we&rsquo;ve tried to create a responsive leadership structure that rapidly disseminates information throughout the regions.</p>\r\n\r\n<p>The voice of the {% link_pg link , false , , , 2 , regions&nbsp;%}, {% link_pg link , false , , , 21, Academies%} and {% link_pg link , false , , , 4 , committees&nbsp;%} funnels through the Board of Trustees, whose members are responsible for relaying information back to these groups. Your CEO, <a href="mailto:ebarry@njpharma.org">Elise Barry</a>, and a hard-working support team oversee daily operations of the Association and conceive short- and long-term strategy.</p>\r\n\r\n<h2>Leadership structure<br />\r\n&nbsp;</h2>\r\n\r\n<p><img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/3/content_organizationstructure.png" style="width: 475px; height: 629px;" /></p>\r\n\r\n<h2>Talk to us</h2>\r\n\r\n<p>We don&rsquo;t have all the answers, but with your help, NJPhA leadership will know the important questions. Use the email links below to tell us what you think or what you need on any issue that matters to you and your patients. We very much want to hear from you.</p>\r\n\r\n<h2>Join us</h2>\r\n\r\n<p>NJPhA has a full slate of activities for 2014, but it takes minds and hands to get things done. {% link_pg link , false , , , 4 , Join a committee%}, apply for a trustee position, run for a regional line position, or take a lead role within an Academy. Your colleagues will help you learn the ropes&mdash;no experience necessary&mdash;only a desire to help better the lot of pharmacists and their patients.</p>\r\n\r\n<p>Not sure how to get started? Click a name below to contact that person by email.</p>\r\n\r\n<div class="row">\r\n<div class="col-xs-4"><img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/18/content_carrie.jpg" style="width: 125px; height: 187px;" /><br />\r\nPast President and Chairman of the Board &ndash; <a href="mailto:rxn95@yahoo.com">Carrie Corboy, RPh, PharmD, CCP</a></div>\r\n\r\n<div class="col-xs-4"><img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/21/content_moriah.jpg" style="width: 125px; height: 187px;" /><br />\r\nPresident &ndash; <a href="mailto:moriahjaye@gmail.com">Moriah Weissman, RPh, PharmD, CCP</a></div>\r\n\r\n<div class="col-xs-4"><img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/70/original_ruth_marrietta.jpg" style="width: 200px; height: 187px;" /><br />\r\nFirst Vice President &ndash; <a href="mailto:ramar040@optonline.net">Ruth Marietta, RPh</a></div>\r\n</div>\r\n\r\n<div class="row">\r\n<div class="col-xs-4"><img alt="" height="160" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/81/original_rmannino.jpg" width="171" /><br />\r\nSecond Vice President &ndash; <a href="mailto:ron@interchem.org">Ronald J. Mannino, RPh</a></div>\r\n\r\n<div class="col-xs-4"><img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/20/content_john.jpg" style="width: 125px; height: 187px;" /><br />\r\nTreasurer &ndash; <a href="mailto:john.colaizzi@walgreens.com">John Colaizzi, Jr. , PharmD, CCP</a></div>\r\n</div>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Board of Trustees</h2>\r\n\r\n<div class="row">\r\n<div class="col-xs-4">\r\n<p><strong>Region 1:</strong> <a href="mailto:njpha@njpharma.org?subject=Att%3A%20S.%20Peritore">Salvatore Peritore</a><br />\r\n<strong>Alternate:</strong><a href="mailto:njpha@njpharma.org?subject=L.%20Spinelli">&nbsp;</a><a href="mailto:njpha@njpharma.org">Lou Spinelli</a></p>\r\n\r\n<p><strong>Region 2: </strong><a href="mailto:njpha@njpharma.org?subject=Att%3A%20S.%20Fishman">Sandy Fishman</a><br />\r\n<strong>Alternate:&nbsp;</strong><a href="mailto:njpha@njpharma.org?subject=Att%3A%20E.%20Fishman">Eileen Fishman</a></p>\r\n\r\n<p><strong>Region 3:</strong> <a href="mailto:njpha@njpharma.org?subject=Att%3A%20S.%20Gooen">Steve Gooen</a><br />\r\n<strong>Alternate:</strong> <a href="mailto:njpha@njpharma.org?subject=C.%20Silvestri">Carmela Silvestri</a></p>\r\n</div>\r\n\r\n<div class="col-xs-4">\r\n<p><strong>Region 4:</strong> <a href="mailto:njpha@njpharma.org?subject=Att%3A%20T.%20Qi">Tony Qi</a><br />\r\n<strong>Alternate:</strong> <a href="mailto:njpha@njpharma.org?subject=Att%3A%20S.%20Moore">Sandra Moore</a></p>\r\n\r\n<p><strong>Region 5:</strong> <a href="mailto:njpha@njpharma.org?subject=Att%3A%20M.%20Taylor">Mark Taylor</a><br />\r\n<strong>Alternate:</strong> <a href="mailto:njpha@njpharma.org">Pending</a></p>\r\n\r\n<p><strong>Region 6:</strong> <a href="mailto:njpha@njpharma.org?subject=Att%3A%20A.%20Obianwu">Azuka Obianwu</a><br />\r\n<strong>Alternate:</strong> <a href="mailto:njpha@njpharma.org?subject=Att%3A%20D.%20Regan">Pending</a></p>\r\n</div>\r\n</div>\r\n\r\n<p><strong>Academy of Consultant Pharmacists:</strong> <a href="mailto:njpha@njpharma.org?subject=Att%3A%20S.%20Zlotnick">Steve Zlotnick</a></p>\r\n\r\n<p><strong>Academy of Compounding Pharmacists: </strong><a href="mailto:njpha@njpharma.org?subject=Att%3A%20S.%20Rudner">Shara Rudner</a></p>\r\n\r\n<p><strong>Academy of Disaster Management Pharmacists:</strong> <a href="mailto:njpha@njpharma.org?subject=Att%3A%20A.%20Aronovitz">Alan Aronovitz</a></p>\r\n\r\n<p><strong>Student Representative:</strong><br />\r\n<strong>Alternate:</strong></p>\r\n	1	2014-04-08 18:44:56.828842	2015-02-12 20:42:02.778674	3	t	t	f		f	f	NJPhA Leadership	\N
17	Regional Programs/Live CE	regional-programs	\N	pharmacy continuing ed, pharmacy ceu, pharmacy uan	NJPhA regions host live continuing education programs for pharmacists and pharmacy technicians. Continuing ed credits are available. Pharmacy students are also welcome. 	<h1>Live Continuing Education</h1>\r\n\r\n<p>The 6 regions that comprise NJPhA play critical roles by hosting several gatherings throughout the year, among them, continuing education programs. Association members can attend programs in any regions&mdash;not just those sessions hosted by your local chapter. In addition, NJPhA hosts several statewide programs each year.</p>\r\n\r\n<p>This page lists the programs scheduled in the near future. You can also use the {% link_pg link , false , , , 12 , Event Calendar %} to see what programs are being offered by the different regions. Continuing education programs are organized throughout the year, so if a region doesn&rsquo;t currently list upcoming programming, check back soon.&nbsp;<span style="line-height: 1.6;">&nbsp; &nbsp; &nbsp;</span></p>\r\n\r\n<hr />\r\n<p><strong style="line-height: 1.6;"><em>Please note</em>: &nbsp;</strong></p>\r\n\r\n<p>Cancellation Policy&nbsp;&ndash;&nbsp;If you need to cancel your registration, please notify NJPhA as soon as possible. Timely notification of a cancellation may allow another person to participate in your place. Seats are reserved. Registrants will receive a refund less a $10 processing fee per registration if canceled one week prior to the event date. No refund for cancellation will be issued once the program begins. All Refunds will be processed after the meeting.</p>\r\n\r\n<p><em><img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/8/content_acpe.jpg" style="margin: 4px 3px; width: 50px; height: 50px; float: left;" /><span style="font-size: 12px;"> The New Jersey Pharmacists Association is accredited by the Accreditation Council for Pharmacy Education as a provider of continuing pharmacy education. Proof of your participation will be submitted to mycpemonitor.net within 45 days subject to documented attendance and completion of online evaluation materials.</span></em></p>\r\n\r\n<hr />\r\n<h2>NJPhA presents March Madness 2015 - Registration is now OPEN!</h2>\r\n\r\n<h4>Annunciation Center, College of St. Elizabeth 2 Convent Road Morristown, NJ 07960</h4>\r\n\r\n<p>{% link_pg button, false, _self, btn-large, http://njpharmacists.org/events/event-info#id=182&amp;cid=955&amp;wid=201, Register %}</p>\r\n\r\n<h2><a id="Pharmacists &amp; Patient Centered Diabetes Care" name="Pharmacists &amp; Patient Centered Diabetes Care"></a>Certificate Programs Throughout the State</h2>\r\n\r\n<h3>March 14 - Compounding Essentials - NEW NJPhA Certificate Training Program</h3>\r\n\r\n<h3><font color="#000000"><span style="line-height: 115%; font-family: &quot;Tahoma&quot;,&quot;sans-serif&quot;; font-size: 9pt; mso-fareast-font-family: &quot;Times New Roman&quot;; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: AR-SA; mso-bidi-font-weight: bold;">Annunciation Center, College of St. Elizabeth </span><span style="line-height: 115%; font-family: &quot;Tahoma&quot;,&quot;sans-serif&quot;; font-size: 9pt; mso-fareast-font-family: &quot;Times New Roman&quot;; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: AR-SA;">2 Convent Road Morristown, NJ 07960</span></font></h3>\r\n\r\n<p><img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/83/original_compoundinglogo-color.png" style="width: 268px; height: 75px;" /><img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/88/original_original_stamp_acpe_ii.jpg" style="width: 110px; height: 95px;" /><img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/89/original_orginal_njvma_program_logo_ii.jpg" style="width: 116px; height: 100px;" /></p>\r\n\r\n<p>{% link_pg button, false, _self, btn-large,<a href="http://njpharmacists.org/events/event-info#id=183&amp;cid=955&amp;wid=201" id="ctl00_RightContent_UcEventDetail1_UcEventSelectedDetail_hlEventURL" target="_blank">http://njpharmacists.org/events/event-info#id=183&amp;cid=955&amp;wid=201</a>, Register %}</p>\r\n\r\n<h3>March 14 - Preparing for a Consultant Pharmacist Career - NEW NJPhA Certificate Training Program</h3>\r\n\r\n<h3><span style="font-size: 12px;">Annunciation Center, College of St. Elizabeth 2 Convent Road Morristown, NJ 07960</span></h3>\r\n\r\n<h3><img alt="" height="74" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/87/original_pcpc_logo_sm.jpg" width="123" /><img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/88/original_original_stamp_acpe_ii.jpg" style="width: 116px; height: 100px;" /></h3>\r\n\r\n<p>{% link_pg button, false, _self, btn-large,<a href="http://njpharmacists.org/events/event-info#id=185&amp;cid=955&amp;wid=201" id="ctl00_RightContent_UcEventDetail1_UcEventSelectedDetail_hlEventURL" target="_blank">http://njpharmacists.org/events/event-info#id=185&amp;cid=955&amp;wid=201</a>, Register %}</p>\r\n\r\n<h3>March 14 - Delivering Medication Therapy Management Services</h3>\r\n\r\n<h4><font color="#000000"><span style="line-height: 115%; font-family: &quot;Tahoma&quot;,&quot;sans-serif&quot;; font-size: 9pt; mso-fareast-font-family: &quot;Times New Roman&quot;; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: AR-SA; mso-bidi-font-weight: bold;">Annunciation Center, College of St. Elizabeth </span><span style="line-height: 115%; font-family: &quot;Tahoma&quot;,&quot;sans-serif&quot;; font-size: 9pt; mso-fareast-font-family: &quot;Times New Roman&quot;; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: AR-SA;">2 Convent Road Morristown, NJ 07960</span></font></h4>\r\n\r\n<p><font color="#000000"><span style="line-height: 115%; font-family: &quot;Tahoma&quot;,&quot;sans-serif&quot;; font-size: 9pt; mso-fareast-font-family: &quot;Times New Roman&quot;; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: AR-SA;"><img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/44/original_mtm_logo.jpg" style="width: 100px; height: 93px;" />&nbsp;&nbsp; <img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/15/original_apha.jpg" style="width: 332px; height: 85px;" /></span></font></p>\r\n\r\n<p>{% link_pg button, false, _self, btn-large,<a href="http://njpharmacists.org/events/event-info#id=180&amp;cid=955&amp;wid=201" id="ctl00_RightContent_UcEventDetail1_UcEventSelectedDetail_hlEventURL" target="_blank"><font color="#0066cc">http://njpharmacists.org/events/event-info#id=180&amp;cid=955&amp;wid=201</font></a>, Register %}</p>\r\n\r\n<h3>March 14 - Pharmacy Based Immunization Delivery</h3>\r\n\r\n<h4><font color="#000000"><span style="line-height: 115%; font-family: &quot;Tahoma&quot;,&quot;sans-serif&quot;; font-size: 9pt; mso-fareast-font-family: &quot;Times New Roman&quot;; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: AR-SA; mso-bidi-font-weight: bold;">Annunciation Center, College of St. Elizabeth </span><span style="line-height: 115%; font-family: &quot;Tahoma&quot;,&quot;sans-serif&quot;; font-size: 9pt; mso-fareast-font-family: &quot;Times New Roman&quot;; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: AR-SA;">2 Convent Road Morristown, NJ 07960</span></font></h4>\r\n\r\n<p><font color="#000000"><span style="line-height: 115%; font-family: &quot;Tahoma&quot;,&quot;sans-serif&quot;; font-size: 9pt; mso-fareast-font-family: &quot;Times New Roman&quot;; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: AR-SA;"><img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/46/original_immunization_final.jpg" style="width: 100px; height: 100px;" />&nbsp; <img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/15/original_apha.jpg" style="width: 332px; height: 85px;" /></span></font></p>\r\n\r\n<p>{% link_pg button, false, _self, btn-large,<a href="http://njpharmacists.org/events/event-info#id=181&amp;cid=955&amp;wid=201" id="ctl00_RightContent_UcEventDetail1_UcEventSelectedDetail_hlEventURL" target="_blank"><font color="#0066cc">http://njpharmacists.org/events/event-info#id=181&amp;cid=955&amp;wid=201</font></a>, Register %}</p>\r\n\r\n<h3>March 14 - Preparing for a Consultant Pharmacist Career</h3>\r\n\r\n<h4><font color="#000000"><span style="line-height: 115%; font-family: &quot;Tahoma&quot;,&quot;sans-serif&quot;; font-size: 9pt; mso-fareast-font-family: &quot;Times New Roman&quot;; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: AR-SA; mso-bidi-font-weight: bold;">Annunciation Center, College of St. Elizabeth </span><span style="line-height: 115%; font-family: &quot;Tahoma&quot;,&quot;sans-serif&quot;; font-size: 9pt; mso-fareast-font-family: &quot;Times New Roman&quot;; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: AR-SA;">2 Convent Road Morristown, NJ 07960</span></font></h4>\r\n\r\n<p>{% link_pg button, false, _self, btn-large,XXX=201, Register %}</p>\r\n\r\n<p style="text-align: center;"><a href="#click a course" style="text-align: center; line-height: 20.79px;"><em>Back to top</em></a></p>\r\n\r\n<h2><a id="CCP Exam" name="CCP Exam"></a><span style="line-height: 1.2;">Certified Consultant Pharmacist Exam</span></h2>\r\n\r\n<p>NJPhA provides a preparation class&nbsp; several times annually for individuals who are interested in taking the CCP exam. The dates vary, so {% link_pg link , false , , , 12 , check the Events Calendar%} for the next available session.</p>\r\n\r\n<p>If you have questions specific to the CCP exam, contact&nbsp;<a href="mailto:bobandbobbi@comcast.net">Robert Fusco</a>, Execuitve Director, Joint Board for Certification of Consultant Pharmacist. You can&nbsp;<a href="http://www.njccp.org">download the application</a>&nbsp;for the exam from the CCP website.</p>\r\n\r\n<p style="text-align: center;"><em style="text-align: center;"><a href="#click a course">Back to top</a></em></p>\r\n\r\n<hr />\r\n<h2><img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/9/content_region_1.png" style="width: 100px; height: 94px; line-height: 1.2;" />&nbsp;&nbsp;<span style="line-height: 1.2;">Region 1</span></h2>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<h3>April 8, 2015 - Save the Date!</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4>Topic to be announced</h4>\r\n\r\n<p>{% link_pg button, false, _self, btn-large,XXX=201, Register %}</p>\r\n\r\n<h3>May 6, 2015 - Save the Date!</h3>\r\n\r\n<h4>Topic to be announced</h4>\r\n\r\n<p>{% link_pg button, false, _self, btn-large,XXX=201, Register %}</p>\r\n\r\n<h3>September 9, 2015 - Save the Date!</h3>\r\n\r\n<h4>Topic to be announced</h4>\r\n\r\n<p>{% link_pg button, false, _self, btn-large,XXX=201, Register %}</p>\r\n\r\n<h3>October 7, 2015 - Save the Date!</h3>\r\n\r\n<h4>Topic to be announced</h4>\r\n\r\n<p>{% link_pg button, false, _self, btn-large,XXX=201, Register %}</p>\r\n\r\n<h3>November&nbsp;4, 2015 - Save the Date!</h3>\r\n\r\n<h4>Topic to be announced</h4>\r\n\r\n<p>{% link_pg button, false, _self, btn-large,XXX=201, Register %}</p>\r\n\r\n<h3>December&nbsp;2, 2015 - Save the Date!</h3>\r\n\r\n<h4>Topic to be announced</h4>\r\n\r\n<p>{% link_pg button, false, _self, btn-large,XXX=201, Register %}</p>\r\n\r\n<p style="text-align: center;"><a href="#click a course" style="text-align: center; line-height: 20.79px;"><em>Back to top</em></a></p>\r\n\r\n<hr />\r\n<div>\r\n<div>\r\n<h2 id="_com_2" uage="JavaScript"><img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/10/content_region_2.png" style="width: 160px; height: 123px; line-height: 1.2;" /><span style="line-height: 1.2;">&nbsp;</span><span style="line-height: 1.2;">Region 2</span></h2>\r\n\r\n<hr /></div>\r\n</div>\r\n\r\n<h3>April 23, 2015 - Save the Date!</h3>\r\n\r\n<h4>Topic to be announced</h4>\r\n\r\n<p>{% link_pg button, false, _self, btn-large, XXX=201, Register %}</p>\r\n\r\n<h3>September&nbsp;24, 2015 - Save the Date!</h3>\r\n\r\n<h4>Topic to be announced</h4>\r\n\r\n<p>{% link_pg button, false, _self, btn-large,XXX=201, Register %}</p>\r\n\r\n<h3>November 5, 2015 - Save the Date!</h3>\r\n\r\n<h4>Topic to be announced</h4>\r\n\r\n<p>{% link_pg button, false, _self, btn-large,XXX=201, Register %}</p>\r\n\r\n<p style="text-align: center;"><a href="#click a course" style="text-align: center;"><em>Back to top</em></a></p>\r\n\r\n<hr />\r\n<h2><img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/11/content_region_3.png" style="width: 160px; height: 132px;" />&nbsp;<span style="line-height: 1.2;">Region 3</span></h2>\r\n\r\n<hr />\r\n<h3>March 4, 2015 - HIV Today: Examining the Latest Treatment Advances and Barriers to Success</h3>\r\n\r\n<div>\r\n<p>{% link_pg button, false, _self, btn-large, <a href="http://njpharmacists.org/events/event-info#id=164&amp;cid=955&amp;wid=201">http://njpharmacists.org/events/event-info#id=175&amp;cid=955&amp;wid=201</a>, Register %}</p>\r\n\r\n<h3>May 3, 2015 - Save the Date!</h3>\r\n\r\n<h4>Topic to be announced</h4>\r\n\r\n<p>{% link_pg button, false, _self, btn-large,XXX=201, Register %}</p>\r\n\r\n<h3>September 16, 2015 - Save the Date!</h3>\r\n\r\n<h4>Topic to be announced</h4>\r\n\r\n<p>{% link_pg button, false, _self, btn-large,XXX=201, Register %}</p>\r\n</div>\r\n\r\n<p style="text-align: center;"><a href="#click a course"><em>Back to top</em></a></p>\r\n\r\n<hr />\r\n<h2><img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/12/content_region_4.png" style="width: 160px; height: 147px;" />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span style="line-height: 1.2;">Region 4</span></h2>\r\n\r\n<hr />\r\n<h3>April&nbsp;14, 2015 - Save the Date!</h3>\r\n\r\n<h4>Topic to be announced</h4>\r\n\r\n<p>{% link_pg button, false, _self, btn-large,XXX=201, Register %}</p>\r\n\r\n<h3>June 9, 2015 - Save the Date!</h3>\r\n\r\n<h4>Topic to be announced</h4>\r\n\r\n<p>{% link_pg button, false, _self, btn-large,XXX=201, Register %}</p>\r\n\r\n<h3>November 10, 2015 - Save the Date!</h3>\r\n\r\n<h4>Topic to be announced</h4>\r\n\r\n<p>{% link_pg button, false, _self, btn-large,XXX=201, Register %}</p>\r\n\r\n<p style="text-align: center;"><a href="#click a course"><em>Back to top</em></a></p>\r\n\r\n<hr />\r\n<h2><img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/13/content_region_5.png" style="width: 170px; height: 115px;" />&nbsp;&nbsp;<span style="line-height: 1.2;">Region 5</span></h2>\r\n\r\n<hr />\r\n<h3>Wednesday &nbsp;March 25, 2015 - Smoking Cessation and its Effect on Hypertension, Diabetes and Hyperlipidemia</h3>\r\n\r\n<h4>{% link_pg button, false, _self, btn-large, <a href="http://njpharmacists.org/events/event-info#id=187&amp;cid=955&amp;wid=201" id="ctl00_RightContent_UcEventDetail1_UcEventSelectedDetail_hlEventURL" target="_blank"><font color="#0066cc">http://njpharmacists.org/events/event-info#id=187&amp;cid=955&amp;wid=201</font></a>, Register %}</h4>\r\n\r\n<h3>May 27, 2015 - Save the Date!</h3>\r\n\r\n<h4>Topic to be announced</h4>\r\n\r\n<p>{% link_pg button, false, _self, btn-large,XXX=201, Register %}</p>\r\n\r\n<h3>August 5, 2015 - Save the Date!</h3>\r\n\r\n<h4>Topic to be announced</h4>\r\n\r\n<p>{% link_pg button, false, _self, btn-large,XXX=201, Register %}</p>\r\n\r\n<p style="text-align: center;"><a href="#click a course" style="text-align: center;"><em>Back to top</em></a></p>\r\n\r\n<hr />\r\n<h2><img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/14/content_region_6.png" style="width: 165px; height: 114px;" />&nbsp; Region 6</h2>\r\n\r\n<hr />\r\n<h3><span style="line-height: 1.2;">February 18, 2015 - Unbreak My Heart: HFrEF and HFpEF</span></h3>\r\n\r\n<p>{% link_pg button, false, _self, btn-large,<a href="http://njpharmacists.org/events/event-info#id=174&amp;cid=955&amp;wid=201" id="ctl00_RightContent_UcEventDetail1_UcEventSelectedDetail_hlEventURL" target="_blank"><font color="#0066cc">http://njpharmacists.org/events/event-info#id=174&amp;cid=955&amp;wid=201</font></a>, Register %}</p>\r\n\r\n<h3>April 8, 2015 - The Role of SGLT-2 Inhibitors in the Management of Diabetes</h3>\r\n\r\n<p>{% link_pg button, false, _self, btn-large,<a href="http://njpharmacists.org/events/event-info#id=177&amp;cid=955&amp;wid=201" id="ctl00_RightContent_UcEventDetail1_UcEventSelectedDetail_hlEventURL" target="_blank"><font color="#0066cc">http://njpharmacists.org/events/event-info#id=177&amp;cid=955&amp;wid=201</font></a>, Register %}</p>\r\n\r\n<h3>June 24, 2015 - Save the Date!</h3>\r\n\r\n<h4>Topic to be announced</h4>\r\n\r\n<p>{% link_pg button, false, _self, btn-large,XXX=201, Register %}</p>\r\n\r\n<p><span style="line-height: 20.79px;">We&#39;re always adding new presentations, so check the {% link_pg link , false , , , 12 , Event Calendar %} for the most current schedule.</span></p>\r\n\r\n<p style="text-align: center;"><em><a href="#click a course">Back to top</a></em></p>\r\n\r\n<hr />\r\n<div>&nbsp;</div>\r\n	16	2014-04-09 19:20:51.379885	2015-03-06 18:56:46.510029	2	t	f	f		f	f	Live Continuing Ed	\N
50	Event Information	event-info	\N			<script src="http://memberservices.membee.com/feeds/Events/EventScript.ashx?cid=955&wid=201" type="text/javascript"></script>	12	2014-04-22 15:56:35.209945	2014-04-22 15:57:57.712064	0	f	f	f		f	f		\N
32	NJPhA PAC 	njpha-pac	\N	pharmacy legislation, pharmacy political action, New Jersey pharmacy	Learn about the New Jersey Pharmacists Association Political Action Committee and their activities regarding pharmacy legislation in New Jersey. 	<h1>NJPhA Political Action Committee</h1>\r\n\r\n<p>The NJPhA Political Action Committee (PAC) is a voluntary, bipartisan voice that advances the interests of NJPhA members and pharmacy practice before the New Jersey Legislature. Its purpose is to establish pharmacy practice and pharmacists as a viable political force. To that end, NJPhA PAC has helped gain approval for many {% link_pg link , false , , , 31 , pharmacy-related legislative actions%} in the New Jersey Legislature.</p>\r\n\r\n<p>But NJPhA PAC doesn&rsquo;t stop there.</p>\r\n\r\n<h2>Service beyond pharmacy advocacy</h2>\r\n\r\n<p>In addition to building relationships with legislators, NJPhA PAC supports pharmacy educational and research objectives; teaches members about the legislative process; and sponsors {% link_pg link , false , , , 15 , Legislative Day%}, an opportunity for NJPhA members to &nbsp;interact with legislators.</p>\r\n\r\n<h2>Effective advocacy costs money</h2>\r\n\r\n<p>We need your financial support.</p>\r\n\r\n<p>It&rsquo;s that simple.</p>\r\n\r\n<p>The sums need not be huge. For the cost of one movie theater ticket, you can help our profession grow and improve its future.</p>\r\n\r\n<h2>How to donate</h2>\r\n\r\n<ul>\r\n\t<li>{% link_pg link , false , , , 34 , Donate online %}</li>\r\n\t<li>Mail a check payable to NJPhA PAC to this address</li>\r\n</ul>\r\n\r\n<p style="margin-left:1.0in;">NJPhA PAC<br />\r\n760 Alexander Road, PO Box 1<br />\r\nPrinceton, NJ 08543-0001</p>\r\n\r\n<ul>\r\n\t<li>Schedule automatic contributions with a credit card\r\n\t<ul>\r\n\t\t<li>Please <a href="mailto:njpha@njpharma.org?subject=Donation">contact NJPhA</a>&nbsp;(609.275.4246) for details</li>\r\n\t</ul>\r\n\t</li>\r\n</ul>\r\n\r\n<p>Please note that donations to NJPhA PAC are political contributions and are not deductible for income tax purposes.</p>\r\n	30	2014-04-10 15:15:22.630582	2014-05-08 20:36:47.697825	3	t	t	f		f	f	NJPhA Political Action Committee	\N
25	Career Center	career-center	\N		Access helpful pharmacy resources at njpha.org. NJPhA members can access the NJPhA pharmacy career center online.	<h1>NJPhA Career Center</h1>\r\n\r\n<p>Hopefully you&rsquo;re satisfied and secure in your current role, but it&rsquo;s good to know that NJPhA members have a helpful resource should the time come for a career move. Make the NJPhA Career Center your first stop in the search for a new opportunity.</p>\r\n\r\n<p>You&rsquo;ll find a database of opportunities that can be searched by several criteria, eg, keyword, location, proximity, with the option to program searches that will automatically notify you with relevant opportunities.</p>\r\n\r\n<p>{% members_only %}</p>\r\n\r\n<p>{% link_pg button , false , _self, btn-mini, http://njpha.associationcareernetwork.com/Common/HomePage.aspx ,Start Your Search Now%}</p>\r\n\r\n<p>{% endmembers_only %}</p>\r\n\r\n<p>{% non_members_only %}</p>\r\n\r\n<p>Access to the Career Center requires NJPhA membership. If you&#39;re a member, &nbsp;just {% link_pg link , false , , , 33 , log in%} to begin your search. If you&rsquo;re not a member, you can {% link_pg link , false , , , 7 , join now%}.&nbsp;</p>\r\n\r\n<p>{% endnon_members_only %}</p>\r\n\r\n<p>&nbsp;</p>\r\n	23	2014-04-09 20:29:25.449003	2014-05-08 20:43:47.579028	3	t	t	f		f	f		\N
31	Advocacy and Legislation	advocacy	\N	Pharmacy legislation, pharmacy bills, pharmacy advocacy	See what NJPhA advocacy has accomplished with pharmacy legislation in New Jersey. Then see what pharmacy legislation is pending and being monitored by NJPhA.	<h1>Advocacy</h1>\r\n\r\n<p>Disease management. Medication dispensing. Reimbursement.</p>\r\n\r\n<p>These are just a few aspects of the pharmacy profession that are being debated, written into legislation, and voted on in the New Jersey legislature. Thanks to your support, NJPhA maintains an {% link_pg link , false , , , 32 , active political presence%} in our state capitol to monitor the discussions and represent the voice of pharmacists in New Jersey.</p>\r\n\r\n<p>But the converse also holds true. Without your moral, vocal, and financial support, advocacy isn&rsquo;t possible, so please {% link_pg link , false , , , 32 , make a contribution%} to the NJPhA Political Action Committee (PAC).</p>\r\n\r\n<p>Here&rsquo;s a sample of what NJPhA has done for New Jersey pharmacists and their patients.</p>\r\n\r\n<h2>NJPhA legislative achievements</h2>\r\n\r\n<ul>\r\n\t<li>Permitting properly qualified pharmacists to administer flu vaccine to pediatric patients<sup>1</sup></li>\r\n\t<li>Permitting qualified pharmacists to immunize patients 18 years and older for all types of immunizations<sup>2</sup></li>\r\n\t<li>Providing for collaborative practice between physicians and pharmacists</li>\r\n\t<li>Modernization of the practice of pharmacy to reflect the current training and education of pharmacists under the Pharmacy Practice Act</li>\r\n\t<li>Two laws providing for choice in selecting a pharmacy. Mandatory mail order is not permitted for New Jersey State regulated plans</li>\r\n\t<li>Enabling pharmacists to be reimbursed as diabetes educators</li>\r\n\t<li>Providing for pharmacy coupons to be used by senior citizens 62 years or older</li>\r\n\t<li>Providing for the prompt payment of prescription claims for New Jersey state-regulated health insurance plans</li>\r\n\t<li>Providing for limitations on the recoupment or recapture of payments for pharmacy claims for New Jersey state-regulated health insurance plans no more than 18 months from date of service</li>\r\n\t<li>Requiring all New Jersey insurance cards to indicate whether coverage is self-insured or insured</li>\r\n\t<li>Providing pharmacies with a mutually agreeable time for pharmacy audits by insurers</li>\r\n\t<li>Providing for uniformity in prescription benefits cards</li>\r\n\t<li>Establishing the Pharmaceutical Assistance to Aged and Disabled Program (PAAD) and Senior Gold (SG) Program</li>\r\n</ul>\r\n\r\n<p style="margin-left: 40px;"><sup>1 </sup>Patients aged 12-17 years by physician standing order, prescription or government programs and to patients 7-11 years of age by prescription</p>\r\n\r\n<p><sup>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; 2</sup> Pursuant to physician standing orders, prescriptions, or government sponsored programs</p>\r\n\r\n<hr />\r\n<h2>Upcoming pharmacy legislation</h2>\r\n\r\n<p>Here follows pharmacy legislation currently being debated in the Trenton legislature that NJPhA is monitoring closely. Click View Summary for a synopsis of the legislation. For complete information, click the bill number.</p>\r\n\r\n<hr />\r\n<p><strong><a href="http://www.njleg.state.nj.us/2014/Bills/A1000/622_I1.HTM">Bill A-622</a></strong>: Prohibits sale of Products containing Dextromethorphan to Persons under 18 Years of age</p>\r\n\r\n<p>{% sliding_div View Summary %}</p>\r\n\r\n<p>No person, either directly or indirectly by an agent or an employee, shall sell or offer to sell to a person under 18 years of age any product containing dextromethorphan.&nbsp;</p>\r\n\r\n<p>The establishment of all of the following shall constitute a defense to any prosecution brought pursuant of subsection a. A person, who violates the provisions of this bill, including an employee of a retail establishment who actually sells a product containing dextromethorphan to a person under 18 years of age, will be fined not more than $750. If the retail establishment is part of a chain with two or more locations in the State, the violation is to be assessed against the particular retail establishment and not the chain.</p>\r\n\r\n<p>{% endsliding_div %}</p>\r\n\r\n<hr />\r\n<p><a href="http://www.njleg.state.nj.us/2012/Bills/A0500/428_I1.HTM"><strong>Bill 689</strong></a>: Prohibits sale of products containing dextromethorphan to minors under 18 years of age</p>\r\n\r\n<p>{% sliding_div View Summary %}</p>\r\n\r\n<p>This bill would prohibit the sale of, or offer to sell, any product containing dextromethorphan to a person under 18 years of age. The purpose of the bill is to address the problem of abuse by teenagers of various over-the-counter cold remedies, which, when taken in sufficient doses, can produce hallucinogenic effects and have been reported to cause permanent brain damage, coma, and in some cases, death.&nbsp;&nbsp;</p>\r\n\r\n<p>&nbsp;A person who violates the provisions of this bill would be subject to a civil penalty of $250 for the first violation, $500 for the second violation, and $1,000 for the third and each subsequent violation. The penalties provided in the bill are the same as those provided for the sale of tobacco products to persons under 18 years of age under N.J.S.A.2A:170-51.4. The penalty is to be collected pursuant to the &quot;Penalty Enforcement Law of 1999,&quot; N.J.S.A.2A:58-10 et seq., in a summary proceeding before the municipal court having jurisdiction.</p>\r\n\r\n<p>{% endsliding_div %}</p>\r\n\r\n<hr />\r\n<p><a href="http://legiscan.com/NJ/text/A711/id/926734/New_Jersey-2014-A711-Introduced.html" style="line-height: 1.6;"><strong>Bill A-711</strong></a><span style="line-height: 1.6;">: Proof of ID for dispensation of certain prescription medications</span></p>\r\n\r\n<p>{% sliding_div View Summary %}</p>\r\n\r\n<p>This bill would require patients and their designated caregivers to provide a current and valid photo identification card when picking up prescriptions for narcotic medications, which include opium and opiates, opium and opiate derivatives, and certain stimulants.</p>\r\n\r\n<p>A designated caregiver would not be authorized to pick up a prescription for a narcotic drug on behalf of a patient unless the caregiver is at least 18 years of age, the patient identifies the caregiver at the time the prescription is issued, the practitioner issuing the prescription transmits the caregiver&rsquo;s name along with the prescription, and the caregiver&rsquo;s name appears on the prescription. In the case of a patient who is a minor, the patient&rsquo;s parent, resource family parent, or legal guardian would be identified as the designated caregiver except that, in the practitioner&rsquo;s discretion, another relative who is at least 18 years of age could be identified as the patient&rsquo;s designated caregiver.&nbsp;&nbsp;</p>\r\n\r\n<p>{% endsliding_div %}</p>\r\n\r\n<hr />\r\n<p><a href="http://www.njleg.state.nj.us/2014/Bills/A2500/2477_I1.HTM"><strong>Bill A-2477</strong></a><strong>: </strong>Biosimilars&nbsp;&ndash;&nbsp;Permits pharmacists to substitute a biosimilar biological product under certain circumstances</p>\r\n\r\n<p>{% sliding_div View Summary %}</p>\r\n\r\n<p>The &ldquo;Patient Protection and Affordable Care Act,&rdquo; Pub.L.111-148, amended the federal Public Health Service Act to create an abbreviated licensure pathway for biological products demonstrated to be biosimilar to, or interchangeable with, biological products licensed by the federal Food and Drug Administration (FDA). This bill allows for the substitution of these products by pharmacists, provided the conditions set forth in the bill are met.</p>\r\n\r\n<p>Specifically, the bill directs the Commissioner of Health to maintain, and make available to each pharmacy practice site in the State without charge, a list of biosimilar biological products approved by the FDA to be interchangeable with a prescribed biological reference product. A pharmacist may substitute such a product for a prescribed biological product if the prescriber has not indicated that there be no substitution by initialing the prescription blank next to &ldquo;do not substitute. A pharmacist who dispenses an interchangeable biosimilar product is to notify the patient in writing that the dispensed biological product has been approved by the FDA as an interchangeable biosimilar biological product, and notify the prescribing practitioner of the substitution within five business days after dispensing. The pharmacist is to record, on the prescription label and dispensing record, the product name of the interchangeable biosimilar biological product, followed by the words: &ldquo;Substituted for&rdquo; and the name of the biological reference product for which the prescription was written, as well as the manufacturer of the interchangeable biosimilar biological product. Records of substitutions are to be maintained for at least five years after the dispensing date.</p>\r\n\r\n<p>The bill provides immunity from liability for a pharmacist who makes such substitutions in compliance with the bill to the same extent that immunity would be provided for dispensing the prescribed biological reference product. The bill incorporates the definitions used in relevant federal law for the terms &ldquo;biological product,&rdquo; &ldquo;biosimilar,&rdquo; &ldquo;biological reference product,&rdquo; and &ldquo;interchangeable.&rdquo; Generally, &ldquo;biological products&rdquo; are made from various sources, including human, animal or microorganism, and are intended to treat medical conditions, or prevent or diagnose diseases. &ldquo;Biosimilar&rdquo; means that data show that a product is &ldquo;highly similar&rdquo; to an already-approved biological product. &ldquo;Reference product&rdquo; refers to the single biological product against which a biological product is evaluated in an application to be licensed as biosimilar or interchangeable. The bill also amends the definitions of &ldquo;drug&rdquo; in R.S.24:1-1 and &ldquo;drug product&rdquo; in section 5 of P.L.1977, c.240 (C.24:6E-4) to clarify that those terms do not include &ldquo;biological product.&rdquo; The bill takes effect on the first day of the second month next following the date of enactment.</p>\r\n\r\n<p>{% endsliding_div %}</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n	30	2014-04-10 15:11:53.545875	2014-05-08 20:24:54.266072	2	t	t	f		f	f	Pharmacy Advocacy & Legislation	\N
28	Leader Materials	leader-materials	\N				23	2014-04-09 20:42:33.396439	2014-04-24 15:03:50.045907	6	f	f	f		f	f		\N
40	(Global) Member Registration	registration	\N			<div class="membeeWrapper"><script src="http://memberservices.membee.com/feeds/Profile/ProfileScript.ashx?cid=955&pid=701" type="text/javascript"></script></div>	43	2014-04-18 01:29:19.650917	2014-05-15 16:02:20.980187	0	f	f	t	/membership/join-renew	f	f		\N
23	Resources	resources	\N	NJ Pharmacist, pharmacy resource	Access the NJPhA Resources page for helpful local, state and federal pharmacy links, member access to the Career Center and New Jersey Journal of Pharmacy and more. 	<h1>Resources</h1>\r\n\r\n<p>Would you like to view the latest issue of {% link_pg link , false , , , 24 ,&nbsp;<em>The New Jersey Journal of&nbsp;Pharmacy</em>%} or see what&rsquo;s on the {% link_pg link , false , , , 27 , NJPhA agenda for 2014%}, or are you looking for {% link_pg link , false , , , 26 , links to state or federal pharmacy organizations%} or other pharmacy-related groups?</p>\r\n\r\n<p>Along with a searchable and responsive {% link_pg link , false , , , 25 , career opportunity database%}, the NJPhA Resource Center gives you access to a variety of materials for pharmacists in all settings.</p>\r\n\r\n<p>Look around, and if you need help finding information, don&rsquo;t hesitate to {% link_pg link , false , , , 29 , contact us%}.</p>\r\n	\N	2014-04-09 20:24:23.89306	2015-02-25 15:58:06.735511	6	t	t	f		f	f	NJPhA Resources	\N
24	Journal	journal	\N	New Jersey Journal of Pharmacy, New Jersey Pharmacy, Pharmacy journal	Access helpful pharmacy resources at njpha.org. NJPhA members can access the New Jersey Journal of Pharmacy online. 	<h1>The New Jersey Journal of Pharmacy</h1>\r\n\r\n<p>The quarterly Journal is the peer reviewed collection of timely information and insight created for pharmacists in all settings&mdash;community, hospital, consulting, and industry. Authored by peers, you can access information whose value goes beyond New Jersey borders.</p>\r\n\r\n<h2>Broad collection of pharmacy topics</h2>\r\n\r\n<p>You&rsquo;ll find information that features contemporary issues in disease management, details and feedback on new medication, continuing education activities, and a practice spotlight section that highlights successful, innovative practices and shares tips for reproducing their success.</p>\r\n\r\n<h2>Submit an article</h2>\r\n\r\n<p>Have an idea for an article or a practice that you&#39;d like to spotlight?&nbsp;<a href="mailto:rutu.p.parikh@gmail.com?subject=NJ%20Pharmacy%20Journal%20Article&amp;body=Dear%20NJPhA%2C%0A%0AI%20have%20an%20idea%20for%20a%20future%20article%20(described%20below)%20that%20I%20would%20like%20to%20discuss%20with%20you.%20%0A%0APlease%20contact%20me.%0A%0AThank%20you.%0A">Contact us</a>&nbsp;so we can discuss publishing them in future issues. For detailed infomation on creating articles, <a href="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/attachments/43/njpha_journal_author_guidelines_april_2014.pdf">download the author and style guidelines</a>. </p>\r\n\r\n<p>Here are the issue topics and the submission deadlines for the remainder of 2014.</p>\r\n\r\n<ul>\r\n\t<li>Endocrinology&nbsp;&ndash;&nbsp;Winter 2014; deadline:&nbsp;September 8</li>\r\n</ul>\r\n\r\n<h2>In the current issue</h2>\r\n\r\n<p>Members can view these articles online after {% link_pg link , false , , , 33, logging in %}. If you&rsquo;re not a member, you can {% link_pg link , false , , , 7, join now&nbsp;%}.</p>\r\n\r\n<p>{% members_only %}</p>\r\n\r\n<ul>\r\n\t<li>{% link_pg link, false, journal, , http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/attachments/67/29897_summer_final.pdf, President&#39;s Letter %}</li>\r\n\t<li>{% link_pg link, false, journal, , http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/attachments/67/29897_summer_final.pdf, From The Editors&#39; Desks %}</li>\r\n\t<li>{% link_pg link, false, journal, , http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/attachments/67/29897_summer_final.pdf,&nbsp;Message from the CEO: Be Ready for What is Ahead %}</li>\r\n\t<li>{% link_pg link, false, journal , , http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/attachments/67/29897_summer_final.pdf,&nbsp;Awards %}</li>\r\n\t<li>{% link_pg link, false, journal, , http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/attachments/67/29897_summer_final.pdf,&nbsp;Clinical Overview of Lorcaserin​&nbsp;%}</li>\r\n\t<li>{% link_pg link, false, journal, , http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/attachments/67/29897_summer_final.pdf,&nbsp;Aptiom&reg;: New Drug Approved for Partial Seizures&nbsp;%}</li>\r\n\t<li>{% link_pg link, false, journal, , http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/attachments/67/29897_summer_final.pdf,&nbsp;Vortioxetine: A Novel Multimodal Antidepressant​&nbsp;%}</li>\r\n\t<li>{% link_pg link, false, journal, , http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/attachments/67/29897_summer_final.pdf,&nbsp;Practice Spotlight&nbsp;%}</li>\r\n\t<li>{% link_pg link, false, journal, , http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/attachments/67/29897_summer_final.pdf,&nbsp;Hanover Township Brown Bag Program&nbsp;%}</li>\r\n\t<li>{% link_pg link, false, journal, , http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/attachments/67/29897_summer_final.pdf,&nbsp;The Impact of Pharmacists in Discharge Planning&nbsp;%}</li>\r\n\t<li>{% link_pg link, false, journal, , http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/attachments/67/29897_summer_final.pdf,&nbsp;New Website Password Reminder&nbsp;%}</li>\r\n\t<li>{% link_pg link, false, journal, , http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/attachments/67/29897_summer_final.pdf,&nbsp;Continuing Education: Management of Postpartum Depression&nbsp;%}</li>\r\n\t<li>{% link_pg link, false, journal, , http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/attachments/67/29897_summer_final.pdf,&nbsp;Continuing Education: Therapeutic Actions and the Genetic Code: Examples of the Application of Pharmacogenetics&nbsp;%}</li>\r\n\t<li>{% link_pg link, false, journal, , http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/attachments/67/29897_summer_final.pdf, Continuing Education: FDA Safety Warnings and Prescribing Updates &ndash; Zolpidem, Valproate, Ketoconazole and Acetaminophen​&nbsp;%}</li>\r\n</ul>\r\n\r\n<p><span style="line-height: 1.6;"><span style="line-height: 1.6;">​</span></span><span style="line-height: 1.6;">{% endmembers_only %}</span></p>\r\n\r\n<p>{% non_members_only %}</p>\r\n\r\n<ul>\r\n\t<li>President&rsquo;s Letter</li>\r\n\t<li>From The Editor&rsquo;s Desks</li>\r\n\t<li>Message from the CEO: Be Ready for What is Ahead</li>\r\n\t<li>Awards</li>\r\n\t<li>Clinical Overview of Lorcaserin</li>\r\n\t<li>Aptiom&reg;: New Drug Approved for Partial Seizures</li>\r\n\t<li>Vortioxetine: A Novel Multimodal Antidepressant</li>\r\n\t<li>Practice Spotlight</li>\r\n\t<li>Cardiovascular Safety Warning for Azithromycin</li>\r\n\t<li>Sports-related Concussions: What Pharmacists Need To Know</li>\r\n\t<li>Practice Spotlight</li>\r\n\t<li>Hanover Township Brown Bag Program</li>\r\n\t<li>The Impact of Pharmacists in Discharge Planning</li>\r\n\t<li>New Website Password Reminder</li>\r\n\t<li>Continuing Education: Management of Postpartum Depression</li>\r\n\t<li>Continuing Education:<span style="line-height: 1.6;">Therapeutic Actions and the Genetic Code:&nbsp;</span><span style="line-height: 1.6;">Examples of the Application of Pharmacogenetics</span></li>\r\n</ul>\r\n\r\n<p>{% endnon_members_only %}</p>\r\n\r\n<h2>Archived journals</h2>\r\n\r\n<p><a href="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/attachments/66/29226_fall-winter_low_res-final.pdf" target="_blank">Fall/Winter 2013</a></p>\r\n\r\n<p><a href="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/attachments/35/29527_spring2014_low-res-final.pdf">Spring 2014</a></p>\r\n	23	2014-04-09 20:28:02.563181	2015-03-03 15:26:21.136986	2	t	t	f		f	f	EJournal	\N
9	Renew	renew	\N	NJPHA membership, NJ pharmacist	Renewing NJPhA membership is easy and can be done online. Membership provides discounts on continuing ed programs and access to member-only website content. 	<p>Sorry for the inconvenience, but the Renew link is under repair. However, you can complete your renewal by using the&nbsp; &#39;Register for the First Time&#39; form.&nbsp; Your existing record and the new record you create through this form will be merged together to bring your record up to date.&nbsp; It&#39;s below--just scroll down.</p>\r\n\r\n<p>Please call the office if you have any questions (609-275-4246).</p>\r\n	7	2014-04-09 18:20:03.00797	2015-01-12 19:56:52.072839	2	f	f	f		f	f	Renew Membership	\N
20	Certificate	certificate	\N	pharmacy continuing ed, pharmacy certification	Sign up for NJPhA and APhA pharmacy continuing ed certification programs. Topics cover a broad array of pharmacy areas and practice types. 	<h1>APhA Certificate Programs</h1>\r\n\r\n<p>NJPhA is the licensed provider of the American Pharmacists Associations (APhA) Certificate programs in New Jersey.&nbsp; Each certificate program, which &nbsp;NJPhA offers 2 to 3 times per year across the state does more than enhance critical pharmacy expertise&mdash;also helps you advance the care of your patients</p>\r\n\r\n<p>Each program below includes links to the APhA for additional information. If you still have questions, don&rsquo;t hesitate to <a href="mailto:njpha@njpharma.org?subject=APhA%20Certificate%20Programs">contact us</a> or the <a href="http://www.pharmacist.com/apha-accreditation-information">education office at APhA</a>.</p>\r\n\r\n<hr />\r\n<h2>Delivering Medication Therapy Management Services</h2>\r\n\r\n<p><strong>Date and Location:</strong> March 14 - Annunciation Center, College of St. Elizabeth 2 Convent Road Morristown, NJ 07960</p>\r\n\r\n<p>{% link_pg button, false, _self, btn-large,http://njpharmacists.org/events#id=180&amp;cid=955&amp;wid=201&amp;type=Cal, Register %}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n\r\n<p><strong>Description</strong></p>\r\n\r\n<p>This program explores the pharmacist&rsquo;s role in providing medication therapy management services (MTM) to patients while teaching pharmacists the essential skills to become a successful MTM practitioner. The certificate training program enhances clinical expertise in evaluating complicated medication regimens, identifying medication-related problems, and making recommendations to patients, caregivers, and health care professionals.</p>\r\n\r\n<p>If you need more information, visit the <a href="http://www.pharmacist.com/delivering-medication-therapy-management-services-0">medication therapy management program</a> page at the APhA website.</p>\r\n\r\n<p>{% sliding_div Click to view the program&#39;s objectives.&nbsp;%}</p>\r\n\r\n<ul>\r\n\t<li>Advance public health and patient care through improved medication use</li>\r\n\t<li>Provide training to enhance pharmacists&rsquo; ability to effectively provide MTM services</li>\r\n\t<li>Motivate increased numbers of pharmacists to establish MTM services</li>\r\n\t<li>Communicate benchmark practices for providing MTM services</li>\r\n</ul>\r\n\r\n<p>{% endsliding_div %}</p>\r\n\r\n<p><strong>Course delivery</strong></p>\r\n\r\n<p>There are 3 components to the program. All must be completed to obtain credit.</p>\r\n\r\n<ul>\r\n\t<li>Self-study activity and pre-seminar exercise</li>\r\n\t<li>Live interactive seminar</li>\r\n\t<li>Post-seminar exercise</li>\r\n</ul>\r\n\r\n<p><strong>Credit</strong></p>\r\n\r\n<ul>\r\n\t<li>Self-study component\r\n\t<ul style="list-style-type: circle;">\r\n\t\t<li>Contact hours:&nbsp;12 (1.2 CEU)</li>\r\n\t\t<li>ACPE Universal Program Number: 0202-9999-14-158-H04-P</li>\r\n\t</ul>\r\n\t</li>\r\n\t<li>Live seminar component\r\n\t<ul style="list-style-type: circle;">\r\n\t\t<li>Contact hours: 8 (0.8 CEU)</li>\r\n\t\t<li>ACPE Universal Program Number: 0202-9999-14-159-L04-P</li>\r\n\t</ul>\r\n\t</li>\r\n\t<li>Post-seminar exercise\r\n\t<ul style="list-style-type: circle;">\r\n\t\t<li>Contact hours: 3 (0.3 CEU)</li>\r\n\t\t<li>ACPE Universal Program Number: 0202-9999-14-160-H04-P</li>\r\n\t</ul>\r\n\t</li>\r\n</ul>\r\n\r\n<p><strong>Technology requirements</strong></p>\r\n\r\n<ul>\r\n\t<li>Internet connectivity and Adobe Acrobat Reader are required</li>\r\n</ul>\r\n\r\n<p><span style="font-size: 12px;"><em>Delivering Medication Therapy Management Services&nbsp;</em>was originally developed by the American Pharmacists Association and the American Society of Consultant Pharmacists.</span></p>\r\n\r\n<p><em><img alt="" height="66" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/15/content_apha.jpg" style="float: left;" width="258" /></em></p>\r\n\r\n<p><img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/44/original_mtm_logo.jpg" style="width: 70px; height: 65px;" /></p>\r\n\r\n<hr />\r\n<h2>The Pharmacist &amp; Patient-Centered Diabetes Care</h2>\r\n\r\n<p><strong>Date and Location:</strong> Check back for future program date</p>\r\n\r\n<p><strong>Description</strong></p>\r\n\r\n<p style="margin-left: 2.25pt;">This program is a newly revised, intensive educational experience designed to equip pharmacists with the knowledge, skills, and confidence needed to provide effective, evidence-based diabetes care. Five self-study modules provide comprehensive instruction in current diabetes concepts and standards of care. The live seminar incorporates case studies and hands-on skills training focused on the situations most likely to be encountered&mdash;as well as the services most needed&mdash;in community and ambulatory care practice settings. Participants will gain experience evaluating and adjusting drug therapy regimens for patients with type 1 and type 2 diabetes, counseling patients about lifestyle interventions, analyzing and interpreting self-monitoring of blood glucose results, and assessing the overall health status of patients to identify needed monitoring and interventions.</p>\r\n\r\n<p>If you need more information, visit the <a href="http://www.pharmacist.com/pharmacist-patient-centered-diabetes-care">diabetes care program</a> at the APhA website.</p>\r\n\r\n<p>{% sliding_div Click to view the program&#39;s objectives.&nbsp;%}</p>\r\n\r\n<ul>\r\n\t<li>Provide comprehensive instruction in current standards of care for patients with diabetes</li>\r\n\t<li>Increase pharmacists&rsquo; confidence in serving as the drug therapy expert on the diabetes health care team</li>\r\n\t<li>Refresh pharmacists&rsquo; knowledge of the pathophysiology of diabetes and the acute and long‐term complications of the disease</li>\r\n\t<li>Familiarize pharmacists with important concepts in nutrition, exercise, and weight control that contribute to optimal diabetes care</li>\r\n\t<li>Develop hands-on training in diabetes-related devices and physical assessment skills relevant to optimal diabetes care</li>\r\n\t<li>Introduce pharmacists to the many varied ways in which they can help to improve health outcomes among patients with diabetes</li>\r\n</ul>\r\n\r\n<p>{% endsliding_div %}</p>\r\n\r\n<p><strong>Course delivery</strong></p>\r\n\r\n<p>There are 2 components to the program. All must be completed to obtain credit.</p>\r\n\r\n<ul>\r\n\t<li>A web-based, self-study learning reinforcement exercises</li>\r\n\t<li>A live training seminar that reviews blood pressure testing, self-injection techniques, diabetic foot exam, and blood glucose testing</li>\r\n</ul>\r\n\r\n<p><strong>Credit</strong></p>\r\n\r\n<ul>\r\n\t<li>Live seminar component\r\n\t<ul style="list-style-type: circle;">\r\n\t\t<li>Contact hours: 8 (0.8 CEU)</li>\r\n\t\t<li>ACPE Universal Program Number: 202-999-12-107-L04-P</li>\r\n\t\t<li>Successful completion of the live seminar component involves passing the final exam with a grade of 70% or higher and demonstrating competency in blood pressure testing, self-injection techniques, diabetic foot exam, and blood glucose testing</li>\r\n\t</ul>\r\n\t</li>\r\n\t<li>Web-based, self-study component\r\n\t<ul style="list-style-type: circle;">\r\n\t\t<li>Contact hours :&nbsp;15 (1.5 CEU)</li>\r\n\t\t<li>ACPE Universal Program Number: 202-999-12-108-H04-P</li>\r\n\t\t<li>Successful completion of the self-study component involves passing the self-study assessment with a grade of 70% or higher</li>\r\n\t</ul>\r\n\t</li>\r\n</ul>\r\n\r\n<p><strong>Technology requirements</strong></p>\r\n\r\n<ul>\r\n\t<li>Internet connectivity and Adobe Acrobat Reader are required</li>\r\n</ul>\r\n\r\n<p><span style="font-size: 12px;"><em style="line-height: 1.6;">&quot;Pharmacist &amp; Patient-Centered Diabetes Care&quot;&nbsp;</em><span style="line-height: 1.6;">was developed jointly by the American Pharmacists Association and is co-sponsored by the American Association of Diabetes Educators.</span></span></p>\r\n\r\n<p><em><img alt="" height="61" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/15/content_apha.jpg" style="float: left;" width="239" /></em></p>\r\n\r\n<p><img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/45/original_diabeteslogo_small.jpg" style="width: 183px; height: 40px; line-height: 1.6; margin-top: 10px; margin-bottom: 10px;" /></p>\r\n\r\n<hr />\r\n<h2>Pharmacy-Based Immunization Delivery</h2>\r\n\r\n<p><strong>Date and Location:</strong> March 14 - Annunciation Center, College of St. Elizabeth 2 Convent Road Morristown, NJ 07960</p>\r\n\r\n<p>{% link_pg button, false, _self, btn-large,<a href="http://njpharmacists.org/events/event-info#id=181&amp;cid=955&amp;wid=201" target="_blank">http://njpharmacists.org/events/event-info#id=181&amp;cid=955&amp;wid=201</a>, Register %}</p>\r\n\r\n<p><strong>Description</strong></p>\r\n\r\n<p>This program is an innovative and interactive training program that teaches pharmacists the skills necessary to become a primary source for vaccine information and administration. The program teaches the basics of immunology and focuses on practice implementation and legal/regulatory issues.</p>\r\n\r\n<p>If you need more information, visit the <a href="http://www.pharmacist.com/pharmacy-based-immunization-delivery">immunization delivery program</a> page at the APhA website.</p>\r\n\r\n<p>{% sliding_div Click to view the program&#39;s objectives.&nbsp;%}</p>\r\n\r\n<ul>\r\n\t<li>Provide comprehensive immunization education and training</li>\r\n\t<li>Provide pharmacists with the knowledge, skills, and resources necessary to establish and promote a successful immunization service</li>\r\n\t<li>Teach pharmacists to identify at-risk patient populations needing immunizations</li>\r\n\t<li>Teach pharmacists to administer immunizations in compliance with legal and regulatory standards</li>\r\n</ul>\r\n\r\n<p>{% endsliding_div %}</p>\r\n\r\n<p><strong>Course delivery</strong></p>\r\n\r\n<p>There are three components to the program. All three must be completed to obtain credit.</p>\r\n\r\n<ul>\r\n\t<li>Self-study modules with case studies and an assessment exam</li>\r\n\t<li>Live seminar with a final exam</li>\r\n\t<li>Hands-on assessment of intramuscular and subcutaneous injection technique</li>\r\n</ul>\r\n\r\n<p><strong>Credit</strong></p>\r\n\r\n<ul>\r\n\t<li>Self-study component\r\n\t<ul style="list-style-type: circle;">\r\n\t\t<li>Contact hours : 12 (1.2 CEU)</li>\r\n\t\t<li>ACPE Universal Program Number: 202-999-11-136-H01-P</li>\r\n\t</ul>\r\n\t</li>\r\n\t<li>Live seminar\r\n\t<ul style="list-style-type: circle;">\r\n\t\t<li>Contact hours: 8 (0.8 CEU)</li>\r\n\t\t<li>ACPE Universal Program Number: 202-999-11-135-L01-P</li>\r\n\t</ul>\r\n\t</li>\r\n</ul>\r\n\r\n<p><strong>Technology requirements</strong></p>\r\n\r\n<ul>\r\n\t<li>Internet connectivity and Adobe Acrobat Reader are required</li>\r\n</ul>\r\n\r\n<p><em><span style="font-size: 12px;">&quot;Pharmacy-Based Immunization Delivery&quot; was developed by the American Pharmacists Association.</span></em><br />\r\n<img alt="" height="64" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/15/content_apha.jpg" width="250" /><img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/46/original_immunization_final.jpg" style="width: 55px; height: 55px;" /></p>\r\n\r\n<hr />\r\n<p><em><img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/8/content_acpe.jpg" style="width: 50px; height: 50px; float: left;" /><span style="font-size: 12px;">The American Pharmacists Association is accredited by the Accreditation Council for Pharmacy Education as a provider of continuing pharmacy education</span></em><span style="font-size: 12px;">.</span></p>\r\n	16	2014-04-09 20:15:52.058604	2015-02-25 03:33:35.867042	5	t	t	f		f	f	NJPhA Certificate Continuing Ed	\N
16	Continuing Education	continuing-education	\N	NJPHA, pharmacy continuing ed 	Learn about NJPhA pharmacy continuing ed programs throughout the state. Education programs are designed for pharmacists, pharmacy technicians and students.	<h1>Continuing Education Programs</h1>\r\n\r\n<p><span style="font-size:14px;">All aspects of pharmacy practice&mdash;medical, legal, and financial&mdash;are changing rapidly. To help you stay current, NJPhA is expanding your opportunity to enroll in credit-based and noncredit educational programs.</span></p>\r\n\r\n<p><span style="font-size:14px;">You can attend NJPhA programs offered around the state throughout the year, or {% link_pg link , false , , , 17 , programs within your local NJPhA region%} or at any region throughout the state. We&rsquo;ve also teamed with APhA to offer their {% link_pg link , false , , , 20 , certification programs%}. All these venues also provide great networking opportunities.</span></p>\r\n\r\n<p><span style="font-size:14px;">If you can&rsquo;t travel to a meeting, live and pre-recorded {% link_pg link , false , , , 18 , webinars%} on a variety of topics will also be available soon, along with other {% link_pg link , false , , , 19 , home-study based programs&nbsp;%}.</span></p>\r\n\r\n<p><span style="font-size:14px;">And to keep you on the leading edge, you can attend a specialty interest {% link_pg link , false , , , 21 , NJPhA Academy program%}. These groups are created by NJPhA members, so if you see an educational need not addressed by our programs, propose the creation of a new Academy.</span></p>\r\n	\N	2014-04-09 19:10:40.758429	2014-05-08 19:20:11.171378	4	t	t	f		f	f	Continuing Education Programs	\N
21	Academies	academies	\N	NJPHA, pharmacy forum, pharmacy academy	Join an NJPhA Pharmacy Academy to learn best practices in key pharmacy areas. Academies exist for disaster management pharmacists, and for compounding and consultant pharmacists. 	<h1>Academies</h1>\r\n\r\n<p>NJPhA academies are your special-interest forums to learn about the latest issues affecting your patients and your practice.<br />\r\n<br />\r\n<em>Who can join them?</em> Pharmacists, technicians, and students who are NJPhA members in good standing.<br />\r\n<br />\r\n<em>Who proposes topics for new Academies?</em> YOU DO.<br />\r\n<br />\r\nIf you have a specialty area that you&#39;d like to see become an academy, just&nbsp;<a href="mailto:njpha@njpharma.org?subject=Academy%20Proposal">let us know</a>. And remember to share your idea with your colleagues and peers&mdash;Academies of at least 50 people earn a representative seat on the Board of Trustees.</p>\r\n\r\n<h2>How to join an Academy</h2>\r\n\r\n<p>You can join an academy by {% link_pg link , false , , , 33 , logging in%}, accessing your member profile, and selecting the desired Academies.</p>\r\n\r\n<h2>Academy of Disaster Management Pharmacists</h2>\r\n\r\n<p>The mission is to promote the health and safety of New Jersey residents by preparing pharmacists and pharmacy technicians to respond to naturally occurring disasters and outbreaks, chemical, biological, radiological, nuclear, and explosive events, and other health and homeland security threats and emergencies.</p>\r\n\r\n<h2>Academy of Compounding Pharmacists</h2>\r\n\r\n<p>This Academy&rsquo;s mission is to provide a forum for New Jersey Compounding Pharmacists to address certain specific key issues related to compounding and the protection of compounding in New Jersey.</p>\r\n\r\n<h2>Academy of Consultant Pharmacists</h2>\r\n\r\n<p>This Academy advances the discipline and practice of pharmacy consulting for the benefit of its members and the patients who they service. The objective is to provide members with resources to ensure clinical competency and regulatory awareness through the development and dissemination of professional knowledge.</p>\r\n	16	2014-04-09 20:20:46.83202	2014-05-08 19:53:53.940842	6	t	t	f		f	f	NJPhA Academies	\N
42	(Global) Member Profile	member-profile	\N			<div class="membeeWrapper"><script src="http://memberservices.membee.com/feeds/Profile/ProfileScript.ashx?cid=955&pid=601" type="text/javascript"></script></div>\r\n	43	2014-04-18 02:59:36.446865	2014-04-21 19:55:07.736451	0	f	f	f		t	f		\N
41	(Global) Member Reset Password	reset-password	\N			<div class="membeeWrapper"><!--Paste this in your page where you would like the reset be displayed--><script src='https://memberservices.membee.com/feeds/Login/ReAssocScript.ashx?appid=1062&clientid=955' type='text/javascript'></script></div>\r\n	43	2014-04-18 02:45:49.043245	2014-04-20 23:21:07.817992	0	f	f	f		f	f	\N	\N
18	Webinars	webinar-ce-programs	\N	NJPHA webinar, pharmacy webinar	New Jersey Pharmacists Association hosts webinars on a variety of pharmacy topics designed for pharmacists, pharmacy technicians and pharmacy students. Topics will cover all forms of pharmacy practice. 	<h1>NJPhA Webinars</h1>\r\n\r\n<p>As part of the NJPhA effort to keep you informed with the most current pharmacy-related news and {% link_pg link , false , , , 16 , educational programming%}, we&rsquo;ll be hosting numerous seminars throughout the year. Topics haven&rsquo;t been finalized yet, so please check back or <a href="mailto:njpha@njpharma.org?subject=Webinar%20Notice&amp;body=Dear%20NJPhA%2C%0A%0APlease%20notify%20me%20when%20webinars%20will%20take%20place.%20%0A%0AThank%20you.%0A">email us</a> and we&rsquo;ll contact you when webinars become available.</p>\r\n\r\n<p>In the meantime, you can use the {% link_pg link , false , , , 12 , Event Calendar%} and the {% link_pg link , false , , , 23 , Resources %} section to learn about and register for the latest educational programming and networking opportunities.</p>\r\n	16	2014-04-09 19:25:00.586648	2014-05-08 19:31:03.864084	3	t	t	f		f	f	NJPhA Webinars	\N
34	(Global) Donate	donate	\N				43	2014-04-11 18:44:09.340738	2014-05-27 01:39:42.950367	0	f	f	t	http://njpharmacists.org/events/event-info#id=106&cid=955&wid=201	f	f		\N
19	Home Study	home-study	\N	pharmacy continuing ed, pharmacy home study	Learn about NJPhA home-study-based continuing ed programs. Earn CEU credits for pharmacy programs covering several topics for pharmacists and pharmacy technicians. 	<h1>Home Study Programs</h1>\r\n\r\n<p>To help you obtain continuing education credit as conveniently as possible, NJPhA provides an ongoing and expanding collection of coursework that can be completed from home. As indicated below, some programs are available to NJPhA members only.</p>\r\n\r\n<p>If you have any questions about the home study programs, please contact the office.</p>\r\n\r\n<h2>Important credit information</h2>\r\n\r\n<p><strong><em>Please note:</em></strong> If you completed the home study when the original issue of the journal was released, you can not obtain credit for completing it again online. Credit issued to an individual by the course UAN number once.&nbsp; Please carefully review your&nbsp;&nbsp; education record on CPE Monitor before enrolling in a home study program.</p>\r\n\r\n<hr />\r\n<h3 style="text-align: center;"><a id="click a course" name="click a course"></a>Click a course title for more information:</h3>\r\n\r\n<p style="text-align: center;"><a href="#Anemia">Anemia: Disease Basics, Treatment and Appropriate Use of ESAs</a></p>\r\n\r\n<p style="text-align: center;"><a href="#Melanoma">Melanoma-Targeted Therapy: Focus on Mekinist and Tafinlar&nbsp;</a></p>\r\n\r\n<p style="text-align: center;"><a href="#Phytosterols">Phytosterols and Cardiovascular Health</a></p>\r\n\r\n<p style="text-align: center;"><a href="#Cardiovascular">The Cardiovascular Effects of Stimulants in Children and Adults With Attention-Deficit and Hyperactivity Disorder (ADHD):&nbsp;A Closer Look Into the Controversy</a></p>\r\n\r\n<p style="text-align: center;"><a href="#Abuse">Prescription Drug Abuse</a></p>\r\n\r\n<p style="text-align: center;"><a href="#Liver">Liver Disorders:&nbsp; Part II: Adjusting Medications in Hepatic Dysfunction</a></p>\r\n\r\n<p style="text-align: center;"><a href="#Needle">Where Does This Used Needle Go?</a></p>\r\n\r\n<hr />\r\n<h3><a id="Anemia" name="Anemia"></a>Anemia: Disease Basics, Treatment and Appropriate Use of ESAs</h3>\r\n\r\n<h5>Mona T. Thompson, R.Ph., PharmD</h5>\r\n\r\n<p>(<em>Members only. A $5 fee payable to the Ohio Pharmacists Association must be submitted when applying for CEU credit</em><em style="line-height: 1.6;">.</em><span style="line-height: 1.6;">)</span></p>\r\n\r\n<p><strong>Audience</strong></p>\r\n\r\n<ul>\r\n\t<li>Pharmacists only</li>\r\n</ul>\r\n\r\n<p><strong>Credit</strong></p>\r\n\r\n<ul>\r\n\t<li>Contact hours: 1.5 (0.15 CEU)</li>\r\n\t<li>UAN: 0129-0000-13-006-H01-P</li>\r\n</ul>\r\n\r\n<p><strong>Release Date</strong> : June 15, 2013&nbsp; <strong>Expiration Date:</strong> June 15, 2016</p>\r\n\r\n<p><strong>Goal </strong><br />\r\nThe goal of this lesson is to provide a basic background on anemia to include pathophysiology, epidemiology, and associated laboratory studies in the diagnosis of anemia; common types of anemia and their causes; and treatment options in adults.</p>\r\n\r\n<p>{% sliding_div Click to view the program&#39;s objectives.&nbsp;%}</p>\r\n\r\n<p>At the completion of this activity, pharmacists will be able to</p>\r\n\r\n<ul>\r\n\t<li>Demonstrate an understanding of the epidemiology, pathophysiology, and associated laboratory&nbsp;<span style="line-height: 1.6;">studies in the diagnosis of anemia</span></li>\r\n\t<li><span style="line-height: 1.6;">Recognize the general characteristics and causes for select types&nbsp;</span></li>\r\n\t<li>Identify the general adult treatment options for anemia types, as well as key prescribing and counseling points for the entities discussed</li>\r\n\t<li>Demonstrate an understanding of the current recommendations for the use of erythropoietin stimulating agents (ESAs)</li>\r\n</ul>\r\n\r\n<p>{% endsliding_div %}</p>\r\n\r\n<p>{% non_members_only %}</p>\r\n\r\n<p>Only members may register for this program, so please {% link_pg link , false , , , 33 , log in%}. Not a member?&nbsp;<span style="line-height: 22.39px; font-size: 14px;">&nbsp;{% link_pg link , false , , , 7 , Join NJPhA%}&nbsp;</span>now.</p>\r\n\r\n<p>{% endnon_members_only %}</p>\r\n\r\n<p>{% members_only %}</p>\r\n\r\n<p>{% link_pg button, false, _self, btn-large,/events/event-info#id=115&amp;cid=955&amp;wid=201, Register %}<br />\r\n<span style="line-height: 1.6;">​{% endmembers_only %}</span></p>\r\n\r\n<p style="text-align: center;"><a href="#click a course" style="text-align: center; line-height: 1.6;"><em>Back to top</em></a></p>\r\n\r\n<hr />\r\n<h3><span style="line-height: 1.6;"><a id="Melanoma" name="Melanoma"></a>Melanoma-Targeted Therapy: Focus on Mekinist and Tafinlar&nbsp;</span></h3>\r\n\r\n<h4><span style="line-height: 1.6;">Thomas A. Gossel, R.Ph., Ph.D., Professor Emeritus, Ohio Northern University, Ada, Ohio</span></h4>\r\n\r\n<div>(<em>Members only. A $5 fee payable to the Ohio Pharmacists Association must be submitted when applying for CEU credit</em><em style="line-height: 1.6;">.</em><span style="line-height: 1.6;">)</span></div>\r\n\r\n<p><strong>Audience</strong></p>\r\n\r\n<ul>\r\n\t<li>Pharmacists only</li>\r\n</ul>\r\n\r\n<p><strong>Credit</strong></p>\r\n\r\n<ul>\r\n\t<li>Contact hours: 1.5 (0.15 CEU)</li>\r\n\t<li>UAN: 0129-0000-13-010-H01P</li>\r\n</ul>\r\n\r\n<p><strong>Release Date:&nbsp;</strong>October 15, 2013<strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Expiration Date: </strong>October 15, 2016</p>\r\n\r\n<p><strong>Goal&nbsp;</strong></p>\r\n\r\n<div>The goal of this lesson is to provide information on melanoma and its treatment with targeted therapy, with focus on two new drugs, dabrafenib (Tafinlar&reg; ) and trametinib (Mekinist&trade;).</div>\r\n\r\n<div>\r\n<p>{% sliding_div Click to view the program&#39;s objectives.&nbsp;%}</p>\r\n\r\n<p>At the completion of this activity, pharmacists will be able to</p>\r\n\r\n<ul>\r\n\t<li>Recognize signs, symptoms, and key features of melanoma, including information on its prevalence;</li>\r\n\t<li><span style="line-height: 1.6;">Recognize important therapeutic uses for the new drugs and projected benefits over other approved medications for melanoma;</span></li>\r\n\t<li>Select the indication(s), pharmacologic action(s), clinical application(s), and the mode and other considerations for administration of the drugs;</li>\r\n\t<li>Demonstrate an understanding of adverse effects and toxicity, warnings, precautions, contraindications, and significant drug-drug interactions reported for each agent</li>\r\n\t<li>Choose important patient information to convey to patients and/or their caregivers</li>\r\n</ul>\r\n\r\n<p>{% endsliding_div %}</p>\r\n\r\n<p>{% non_members_only %}</p>\r\n\r\n<p>Only members may register for this program, so please&nbsp;{% link_pg link , false , , , 33 , log in%}. Not a member?&nbsp;<span style="line-height: 22.39px; font-size: 14px;">&nbsp;{% link_pg link , false , , , 7 , Join NJPhA%}&nbsp;</span>now.</p>\r\n\r\n<p>{% endnon_members_only %}</p>\r\n\r\n<p>{% members_only %}</p>\r\n</div>\r\n\r\n<div>{% link_pg button, false, _self, btn-large,/events/event-info#id=116&amp;cid=955&amp;wid=201, Register %}</div>\r\n\r\n<div><span style="line-height: 1.6;">​{% endmembers_only %}</span></div>\r\n\r\n<div style="text-align: center;"><a href="#click a course" style="text-align: center;"><em>Back to top</em></a></div>\r\n\r\n<hr />\r\n<h3><a id="Phytosterols" name="Phytosterols"></a>Phytosterols and Cardiovascular Health</h3>\r\n\r\n<h4>Thomas A. Gossel, R.Ph., Ph.D., Professor Emeritus, Ohio Northern University, Ada, Ohio</h4>\r\n\r\n<h4>J. Richard Wuest, R.Ph., PharmD, Professor Emeritus, University of Cincinnati, Cincinnati, Ohio</h4>\r\n\r\n<p>(<em>Members only. A $5 fee payable to the Ohio Pharmacists Association must be submitted when applying for CEU credit</em><em style="line-height: 1.6;">.</em><span style="line-height: 1.6;">)</span></p>\r\n\r\n<p><strong>Audience</strong></p>\r\n\r\n<ul>\r\n\t<li>Pharmacists only</li>\r\n</ul>\r\n\r\n<p><strong>Credit</strong></p>\r\n\r\n<ul>\r\n\t<li>Contact hours: 1.5 (0.15 CEU)</li>\r\n</ul>\r\n\r\n<ul>\r\n\t<li>UAN: 0129-0000-12-009-H01P</li>\r\n</ul>\r\n\r\n<p><strong>Release Date: </strong>September 15, 2012 &nbsp;&nbsp; <strong>Expiration Date: </strong>September 15, 2015</p>\r\n\r\n<p><strong>Goal&nbsp;</strong><br />\r\nThe goal of this lesson is to educate pharmacists on phytosterols (plant sterols), their mechanisms of action in reducing blood cholesterol levels, and implications for their use in promoting cardiovascular health.</p>\r\n\r\n<p>{% sliding_div Click to view the program&#39;s objectives.&nbsp;%}</p>\r\n\r\n<p>At the completion of this activity, pharmacists will be able to</p>\r\n\r\n<ul>\r\n\t<li>Define the term phytosterol and list specific types</li>\r\n\t<li><span style="line-height: 1.6;">Explain the mechanisms of action by which phytosterols act to reduce blood levels of low-density lipoprotein cholesterol</span></li>\r\n\t<li>Identify natural dietarysources of phytosterols</li>\r\n\t<li>Select the effective dose of phytosterols for reduction of cholesterol and avoidance of adverse effects</li>\r\n\t<li>Demonstrate an understanding of information and resources to convey to patients about phytosterols</li>\r\n</ul>\r\n\r\n<p>{% endsliding_div %}</p>\r\n\r\n<p>{% non_members_only %}</p>\r\n\r\n<p>Only members may register for this program, so please&nbsp;{% link_pg link , false , , , 33 , log in%}. Not a member?&nbsp;<span style="line-height: 22.39px; font-size: 14px;">&nbsp;{% link_pg link , false , , , 7 , Join NJPhA%}&nbsp;</span>now.</p>\r\n\r\n<p>{% endnon_members_only %}</p>\r\n\r\n<p>{% members_only %}</p>\r\n\r\n<p>{% link_pg button, false, _self, btn-large,/events/event-info#id=117&amp;cid=955&amp;wid=201 , Register %}<br />\r\n<span style="line-height: 1.6;">​{% endmembers_only %}</span></p>\r\n\r\n<p style="text-align: center;"><a href="#click a course" style="text-align: center;"><em>Back to top</em></a></p>\r\n\r\n<hr />\r\n<h3><a id="Cardiovascular" name="Cardiovascular"></a>The Cardiovascular Effects of Stimulants in Children and Adults With Attention-Deficit and Hyperactivity Disorder (ADHD): A Closer Look Into the Controversy</h3>\r\n\r\n<h4>Asha Gupta, PharmD, RPh</h4>\r\n\r\n<p><em>(Members, free. Nonmembers, $15.)</em></p>\r\n\r\n<p>Members must {% link_pg link , false , , , 33 , log in%} to obtain the members fee. Not a member? {% link_pg link , false , , , 7 , Join the Association%}.</p>\r\n\r\n<p><strong>Audience</strong></p>\r\n\r\n<ul>\r\n\t<li>Pharmacists and pharmacy technicians</li>\r\n</ul>\r\n\r\n<p><strong style="line-height: 1.6;">Credit</strong></p>\r\n\r\n<ul>\r\n\t<li>Contact hours: 1.0 (0.1 CEU)</li>\r\n\t<li>UAN number:&nbsp;0136-0000-13-052-H04-P;&nbsp;0136-0000-13-052-H94-T</li>\r\n</ul>\r\n\r\n<p><strong>Release Date:&nbsp; </strong>October 22, 2013 &nbsp; <strong>Expiration Date: </strong>October 22, 2016</p>\r\n\r\n<p><strong>Activity Type:&nbsp; </strong>Knowledge-based</p>\r\n\r\n<p><strong>Goal</strong></p>\r\n\r\n<p><span style="color: rgb(80, 0, 80); line-height: normal; font-family: arial, sans-serif;">This program will review current thinking regarding thje identification of symptoms associated with attention-deficit and hyperactivity disorder. Discussions will also review the use of stimulants as a treatment for this population.</span></p>\r\n\r\n<p>{% sliding_div Click to view the program&#39;s objectives.&nbsp;%}</p>\r\n\r\n<p>After participating in this activity, the pharmacist shall be able to:</p>\r\n\r\n<ul>\r\n\t<li>Describe the symptoms of attention-deficit and hyperactivity disorder (ADHD)</li>\r\n\t<li>Review treatment options for ADHD</li>\r\n\t<li>Assess results from studies of stimulant use in children and adults</li>\r\n\t<li>Discuss cardiovascular effects associated with stimulant use in children and adults</li>\r\n</ul>\r\n\r\n<p>After participating in this activity, the pharmacy technician shall be able to:</p>\r\n\r\n<ul>\r\n\t<li>Describe the symptoms of attention-deficit and hyperactivity disorder (ADHD)</li>\r\n\t<li>Identify treatment options for ADHD</li>\r\n\t<li>List cardiovascular effects associated with stimulant use in children and adults</li>\r\n</ul>\r\n\r\n<p>{% endsliding_div %}</p>\r\n\r\n<p>{% link_pg button, false, _self, btn-large,/events/event-info#id=118&amp;cid=955&amp;wid=201 , Register %}</p>\r\n\r\n<p style="text-align: center;"><a href="#click a course" style="text-align: center;"><em>Back to top</em></a></p>\r\n\r\n<hr />\r\n<h3><a id="Abuse" name="Abuse"></a>Prescription Drug Abuse</h3>\r\n\r\n<h4>Michele Pisano, PharmD, CGP</h4>\r\n\r\n<h4>Assistant Professor, St. John&#39;s University College of Pharmacy and Health Sciences, Queens, NY</h4>\r\n\r\n<p>**The author has no financial or other relevant relationships to disclose.</p>\r\n\r\n<p><em>(Members, free. Nonmembers, $15.)</em></p>\r\n\r\n<p>Members must {% link_pg link , false , , , 33 , log in%} to obtain the members fee. Not a member? {% link_pg link , false , , , 7 , Join the Association%}.</p>\r\n\r\n<p><strong>Audience</strong></p>\r\n\r\n<ul>\r\n\t<li>Pharmacists only</li>\r\n</ul>\r\n\r\n<p><strong>Credit </strong></p>\r\n\r\n<ul>\r\n\t<li>Contact hours &ndash; 1.0 (0.1 CEU)</li>\r\n\t<li>UAN: 0136-0000-13-059-H04-P</li>\r\n</ul>\r\n\r\n<p><strong>Release Date:&nbsp; </strong>January 10, 2014 &nbsp; <strong>Expiration Date</strong>: January 10, 2017</p>\r\n\r\n<p><strong>Activity Type:&nbsp; </strong>Knowledge-based</p>\r\n\r\n<p><strong>Goal</strong></p>\r\n\r\n<p>The program will describe the demographics of prescription drug abuse, and various methods of drug diversion.&nbsp; The role of the pharmacist in prescription drug abuse will be explored, including a discussion on the patient charactieristics associated with drug diversion. The program will also include the prescription monitoring programs and I-Stop program.</p>\r\n\r\n<p>{% sliding_div Click to view the program&#39;s objectives.&nbsp;%}</p>\r\n\r\n<p>After participating in this activity, pharmacists will be able to:</p>\r\n\r\n<ul>\r\n\t<li>\r\n\t<p>Describe the demographics of prescription drug abuse</p>\r\n\t</li>\r\n\t<li>\r\n\t<p><span style="line-height: 1.6;">Describe methods of drug diversion</span></p>\r\n\t</li>\r\n\t<li>\r\n\t<p><span style="line-height: 1.6;">Recognize patient characteristics that may suggest drug diversion</span></p>\r\n\t</li>\r\n\t<li>\r\n\t<p>Describe the role of the pharmacist in prescription drug abus</p>\r\n\t</li>\r\n\t<li>\r\n\t<p><span style="line-height: 1.6;">Explain prescription drug monitoring programs and I-STOP&nbsp;</span></p>\r\n\t</li>\r\n</ul>\r\n\r\n<p>{% endsliding_div %}</p>\r\n\r\n<p>{% link_pg button, false, _self, btn-large,/events/event-info#id=119&amp;cid=955&amp;wid=201, Register %}</p>\r\n\r\n<p style="text-align: center;"><a href="#click a course" style="text-align: center;"><em>Back to top</em></a></p>\r\n\r\n<hr />\r\n<h3><a id="Liver" name="Liver"></a>Liver Disorders: &nbsp;Part II: Adjusting Medications in Hepatic Dysfunction</h3>\r\n\r\n<h4>Lauren M. Hynicka, Pharm.D., BCPS, Assistant Professor of Pharmacotherapy at the University of Maryland School of Pharmacy</h4>\r\n\r\n<p>(<em>Members, free. Nonmembers, $15.</em>)</p>\r\n\r\n<p>Members must {% link_pg link , false , , , 33 , log in%} to obtain the members fee. Not a member? {% link_pg link , false , , , 7 , Join the Association%}.</p>\r\n\r\n<p><strong>Audience</strong></p>\r\n\r\n<ul>\r\n\t<li>Pharmacists only</li>\r\n</ul>\r\n\r\n<p><strong>Credit </strong></p>\r\n\r\n<ul>\r\n\t<li>Contact hours &ndash; 1.0 (0.1 CEU)</li>\r\n\t<li>UAN 0136-0000-12-059-H01-P</li>\r\n</ul>\r\n\r\n<p><strong>Release Date: </strong>September 27, 2012 &nbsp; <strong>Expiration Date: </strong>September 27, 2015</p>\r\n\r\n<p><strong>Activity Type:</strong> Knowledge-based</p>\r\n\r\n<p><strong>Goal</strong></p>\r\n\r\n<p>This program will review the issues surround adjusting medications in patients with hepatic dysfunction. Discussions will include assessing case severity and dose modifications within the population being treated for hepatic disease.</p>\r\n\r\n<p>{% sliding_div Click to view the program&#39;s objectives.&nbsp;%}</p>\r\n\r\n<p>After participating in this activity, pharmacists will be able to:</p>\r\n\r\n<ul>\r\n\t<li>\r\n\t<p>Identify scoring systems used to assess the severity of liver disease</p>\r\n\t</li>\r\n\t<li>\r\n\t<p><span style="line-height: 1.6;">Given an actual or simulated case of a patient with liver disease, determine the severity classification</span></p>\r\n\t</li>\r\n\t<li>\r\n\t<p><span style="line-height: 1.6;">Recognize medications that require dosage adjustment in patients with liver dysfunction and provide dosing recommendations based on the severity of disease</span><span style="line-height: 1.6;">&nbsp;</span></p>\r\n\t</li>\r\n</ul>\r\n\r\n<p>{% endsliding_div %}</p>\r\n\r\n<p>{% link_pg button, false, _self, btn-large,/events/event-info#id=120&amp;cid=955&amp;wid=201 , Register %}</p>\r\n\r\n<p style="text-align: center;"><a href="#click a course" style="text-align: center;"><em>Back to top</em></a></p>\r\n\r\n<hr />\r\n<h3><a id="Scalp" name="Scalp"></a></h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<h3><a id="Needle" name="Needle"></a>Where Does This Used Needle Go?</h3>\r\n\r\n<h4>Kerri Musselman, PharmD, Virginia Commonwealth University School of Pharmacy</h4>\r\n\r\n<h4>Brigitte Sicat, PharmD, Virginia Commonwealth University School of Pharmacy</h4>\r\n\r\n<h4>Michelle Herbert Thomas, PharmD, Richmond Apothecaries, Inc.</h4>\r\n\r\n<h4>Spencer E Harpe, PharmD, PhD, MPH, Virginia Commonwealth University School of Pharmacy; Virginia Commonwealth University School of Medicine</h4>\r\n\r\n<p>(<em>Members, free. Nonmembers, $15</em>.)</p>\r\n\r\n<p>Members must {% link_pg link , false , , , 33 , log in%} to obtain the members fee. Not a member? {% link_pg link , false , , , 7 , Join the Association%}.&nbsp;&nbsp;</p>\r\n\r\n<p><strong>Audience</strong></p>\r\n\r\n<ul>\r\n\t<li>Pharmacists and pharmacy technicians</li>\r\n</ul>\r\n\r\n<p><strong style="line-height: 1.6;">Credit</strong></p>\r\n\r\n<ul>\r\n\t<li>Contact hours &ndash; 10 (1 CEU)</li>\r\n\t<li>0136-0000-12-068-H04-P; 0136-0000-12-068-H04-T</li>\r\n</ul>\r\n\r\n<p><strong>Release Date:&nbsp;&nbsp; </strong>December 10, 2012 &nbsp;&nbsp; <strong>Expiration Date: </strong>December 10, 2015</p>\r\n\r\n<p><strong>Activity Type:&nbsp;&nbsp; </strong>Knowledge -Based</p>\r\n\r\n<p><strong>Goal &nbsp;</strong></p>\r\n\r\n<p>This program will review and compare current patient practices for the proper disposal of proper sharps and the use of barriers by patients and those at increased risk for accidental needle sticks.</p>\r\n\r\n<p>{% sliding_div Click to view the program&#39;s objectives.&nbsp;%}</p>\r\n\r\n<p>After participating in this activity, pharmacists and pharmacy technicians will be able to:</p>\r\n\r\n<ul>\r\n\t<li>\r\n\t<p>Discuss the importance of proper disposal and list the problems of current disposal methods.</p>\r\n\t</li>\r\n\t<li>\r\n\t<p>Identify individuals in the community who are at increased risk for accidental needle sticks</p>\r\n\t</li>\r\n\t<li>\r\n\t<p><span style="line-height: 1.6;">Compare and contrast the different options available for disposal and recommend an option for a patient.</span></p>\r\n\t</li>\r\n</ul>\r\n\r\n<p>{% endsliding_div %}</p>\r\n\r\n<p>{% link_pg button, false, _self, btn-large,/events/event-info#id=122&amp;cid=955&amp;wid=201, Register %}</p>\r\n\r\n<p style="text-align: center;"><a href="#click a course" style="text-align: center;"><em>Back to top</em></a></p>\r\n\r\n<hr />\r\n<h3><a id="Hypertension" name="Hypertension"></a></h3>\r\n\r\n<p><em style="color: rgb(51, 51, 51); line-height: 20.79px; font-family: adelle-sans, arial, sans-serif; font-size: 13px; background-color: rgb(255, 255, 255);"><img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/8/content_acpe.jpg" style="width: 50px; height: 50px; margin-top: 5px; margin-bottom: 5px; float: left; cursor: default;" /><span style="font-size: 12px;">The New Jersey Pharmacists Association is accredited by the Accreditation Council for Pharmacy Education as a provider of continuing pharmacy education. Proof of participation&nbsp;will be submitted to mycpemonitor.net within 60 days subject to documented attendance and completion of online evaluation materials.</span></em></p>\r\n	16	2014-04-09 19:43:03.300561	2015-02-13 00:34:26.758681	4	t	t	f		f	f	Pharmacy Home Study Programs	\N
2	Regional Organization	regional-organization	\N	NJPhA, org chart, NJPhA organization, NJPhA region	Learn about the regional organization of NJPhA and how it benefits pharmacists, pharmacy technicians, and the patients whom they serve.	<h1>NJPhA Regional Organization</h1>\r\n\r\n<p>NJPhA is organized into 6 geographic regions that host {% link_pg link , false , , , 16 , continuing education%} programs and networking events, and communicate Association and industry news discussed by {% link_pg link , false , , , 3 , NJPhA leadership &nbsp;%}&mdash; the Board of Trustees, the CEO, and line officers. We organized locally to minimize your travel and to make it easeir for you to have maximum input on the issues and the activities most relevant to where you practice.</p>\r\n\r\n<p>But as usual, the sum of the parts is greater than the whole, so leadership works with regions to ensure that one very strong, unified voice {% link_pg link , false , , , 30 , represents you and your patients&nbsp;%} in Trenton and beyond.</p>\r\n\r\n<h2>Look beyond your NJPhA region</h2>\r\n\r\n<p>There&rsquo;s nothing stopping you from participating in activities hosted by regions other than yours. With over 30 regional education programs during 2013 and more planned for this year, we hope that you&rsquo;ll {% link_pg link , false , , , 12 , see what activities are going on%} in regions outside of your home base.</p>\r\n\r\n<h2>Find your region</h2>\r\n\r\n<p>You can use the map below to identfy your region based on the county where you live.</p>\r\n\r\n<p><img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/2/content_nj_map.jpg" style="width: 427px; height: 632px;" /></p>\r\n	1	2014-04-08 18:35:38.61216	2014-05-08 15:38:18.23807	2	t	t	f		f	f	NJPhA Regional Organization	\N
5	Membership	membership	\N	NJPHA, New Jersey Pharmacist, NJ pharmacist	Membership in NJPhA has many benefits: live, online, and remote pharmacy continuing education, access to the New Jersey Journal of Pharmacy, pharmacy awards and more. 	<h1>NJPhA Membership</h1>\r\n\r\n<p>Nobody has to tell you that the pace of pharmacy change is quickening, with no slowdown in sight. We&rsquo;re here to help keep you informed, enhance the quality of your professional life, and to represent your interests and those of your patients.</p>\r\n\r\n<p>{% link_pg link , false , , , 7 , Joining NJPhA %} helps the entire pharmacy community by</p>\r\n\r\n<ul>\r\n\t<li>Advocating &ndash; on legislative and regulatory issues important to your practice and your patients</li>\r\n\t<li>Educating &ndash; you, your peers, and the public</li>\r\n\t<li>Communicating &ndash; create and share a rich library of industry news, best practices, and more</li>\r\n</ul>\r\n\r\n<p>Your {% link_pg link , false , , , 6 , benefits%} include early notification and discounts for continuing education programs sponsored by the Association and access to programs offered by APhA and other thought leaders. As a member ({%link_pg link, false , , , 11,student members%} included), you can nominate a peer or mentor for a {% link_pg link , false , , , 10 , service award%} to be presented at the Association&rsquo;s Annual Meeting and Convention.</p>\r\n\r\n<p>Help the entire pharmacy community in New Jersey<strong>. &nbsp;</strong>{% link_pg button, false, _self, btn-small, 7, Join today %}</p>\r\n\r\n<p>Members, and specifically the diversity of members, are the lifeblood of any Association, and that includes NJPhA, so&nbsp;<a href="mailto:njpha@njpharma.org?subject=Membership%20">tell us</a> what you value about your membership and what we can improve.</p>\r\n\r\n<p>Help us spread the word about the Association so we can p<span style="line-height: 1.6;">reserve the past, honor the present, and shape the future of Pharmacy in New Jersey.</span></p>\r\n	\N	2014-04-09 15:24:10.156365	2014-05-08 16:03:48.248755	2	t	t	f		f	f	NJPhA Membership	\N
15	Legislative Day	legislative-day	\N	NJpharmacist, legislature, pharmacy legislation	Attend NJPhA Legislative Day to speak with state legislators & other officials involved in creating the bills that affect pharmacists, pharmacy technicians, and their patients.	<h1 style="margin-left: 6.75pt;">Legislative Day<strong>&nbsp;</strong></h1>\r\n\r\n<p style="margin-left: 6.75pt;">Every day, legislation affecting you, your practice and your patients is debated in Trenton or Washington, one of the reasons<span class="marker">&nbsp;</span>{% link_pg link , false , , , 32 , NJPhA PAC%}&nbsp;<span class="marker">i</span>s working hard on our behalf.</p>\r\n\r\n<p style="margin-left: 6.75pt;">To foster greater member involvement, NJPhA provides opportunities for you to get involved in the process first hand.</p>\r\n\r\n<h2 style="margin-left: 6.75pt;">Legislative Day 2014</h2>\r\n\r\n<p style="margin-left: 6.75pt;">On March 20th, your peers&mdash;pharmacists, pharmacy technicians, and students&mdash;met at Trenton&rsquo;s Lafayette Yard Hotel and at the New Jersey State House for discussions that covered the entire pharmacy spectrum. The groups, as guests of NJPhA, met with legislative leaders such as Speaker of the General Assembly Vincent Prieto; Majority Leader Louis Greenwald; Budget Chair Gary Shaer; and Assembly Republican Leader Jon Bramnick. The group also toured the State House and sat in on a legislative session.</p>\r\n\r\n<p style="margin-left: 6.75pt;">The meetings were friendly, but all business. Opinions were shared, questions were answered, and answers were questioned on a range of pharmacy issues.</p>\r\n\r\n<h2 style="margin-left: 6.75pt;">Legislative Day 2015</h2>\r\n\r\n<p>&nbsp;&nbsp; Details are coming - check back for the confirmed date!</p>\r\n\r\n<p style="margin-left: 6.75pt;">If you couldn&rsquo;t make it to Legislative Day, don&rsquo;t worry. We&rsquo;re lining up more legislative activities all year round. Just {% link_pg link , false , , , 12 , check the Event Calendar %}&nbsp;or contact your member peers to learn about future programming.</p>\r\n\r\n<p style="margin-left: 6.75pt;">&nbsp;</p>\r\n	12	2014-04-09 19:09:05.565391	2015-02-13 00:18:30.74488	4	t	t	f		f	f	NJPhA Legislative Day	\N
26	Important Links	important-links	\N	Pharmacy links, pharmacy resources, pharmacy resources online, Internet pharmacy resources	Access a list of helpful pharmacy and healthcare online resources at the website of the New Jersey Pharmacists Association. This and other helpful resources at njpha.org.	<h1>Important Links</h1>\r\n\r\n<p>Here&rsquo;s a collection of resources that NJPhA members find useful.</p>\r\n\r\n<p>Do you have favorites that you&#39;d like to see on this ist?&nbsp;<a href="mailto:njpha@njpharm.org?subject=Links%20for%20Resource%20Section" style="line-height: 1.6;">Tell us</a><span style="line-height: 1.6;">&nbsp;about them.&nbsp;</span></p>\r\n\r\n<h2>Pharmacy organizations&nbsp;</h2>\r\n\r\n<ul>\r\n\t<li><a href="http://www.amcp.org">Academy of Managed Care Pharmacy (AMCP) </a></li>\r\n\t<li><a href="http://www.pharmacist.com">American Pharmacists Association (APhA)</a></li>\r\n\t<li><a href="http://www.ameripharm.com">American Pharmacy Alliance (APA)</a></li>\r\n\t<li><a href="https://www.ascp.com">American Society of Consultant Pharmacists (ASCP)</a></li>\r\n\t<li><a href="http://www.ashp.org/default.aspx">American Society of Health-System Pharmacists (ASHP)</a></li>\r\n\t<li><a href="http://www.iacprx.org">International Academy of Compounding Pharmacists (IACP) </a></li>\r\n\t<li><a href="http://www.naspa.us">National Alliance of State Pharmacy Associations (NASPA)</a></li>\r\n\t<li><a href="http://www.nacds.org">National Association of Chain Drug Stores (NACDS)</a></li>\r\n\t<li><a href="http://www.ncpanet.org">National Community Pharmacists Association (NCPA) </a></li>\r\n\t<li><a href="http://www.njshp.org">New Jersey Society of Health-System Pharmacists (NJSHP)</a></li>\r\n\t<li><a href="http://www.nabp.net/">National Association of Boards fo Pharmacy</a></li>\r\n</ul>\r\n\r\n<h2>Federal institutions</h2>\r\n\r\n<ul>\r\n\t<li><a href="http://www.cdc.gov">Centers For Disaster Control &amp; Prevention (CDC) </a></li>\r\n\t<li><a href="http://www.cdc.gov/vaccines">Vaccines and Immunizations</a></li>\r\n\t<li><a href="http://www.cms.gov">Centers for Medicare and Medicaid Services (CMS)</a></li>\r\n\t<li><a href="http://www.ftc.gov">Federal Trade Commission (FTC)</a></li>\r\n\t<li><a href="http://www.fda.gov">Food and Drug Administration (FDA) </a></li>\r\n\t<li><a href="http://www.justice.gov/dea/index.shtml">US Drug Enforcement Administration (DEA)</a></li>\r\n\t<li><a href="http://www.socialsecurity.gov">US Social Security Administration</a></li>\r\n</ul>\r\n\r\n<h2>State institutions</h2>\r\n\r\n<ul>\r\n\t<li><a href="http://www.state.nj.us/health/">NJ Department of Health</a></li>\r\n\t<li><a href="http://www.njconsumeraffairs.gov/pharm/">NJ Division of Consumer Affairs; Board of Pharmacy</a></li>\r\n</ul>\r\n\r\n<h2>Other references</h2>\r\n\r\n<ul>\r\n\t<li><a href="http://www.aacp.org/Pages/Default.aspx">American Associations of Colleges of Pharmacy (AACP)</a></li>\r\n\t<li><a href="http://www.aapcc.org">American Association of Poison Control Centers</a></li>\r\n\t<li><a href="http://www.bpsweb.org">Board of Pharmacy Specialties (BPS) </a></li>\r\n\t<li><a href="http://www.bt.cdc.gov">CDC Emergency Preparedness and Response</a></li>\r\n\t<li><a href="http://www.cms.gov/Regulations-and-Guidance/HIPAA-Administrative-Simplification/HIPAAGenInfo/index.html?redirect=/HIPAAGenInfo">HIPAA </a></li>\r\n\t<li><a href="http://www.nih.gov">National Institutes of Health (NIH)</a></li>\r\n\t<li><a href="https://www.ptcb.org">Pharmacy Technician Certification Board</a></li>\r\n\t<li><a href="http://www.pccarx.com">Professional Compounding Centers of America, Inc. (PCCA)</a></li>\r\n\t<li><a href="http://www.usp.org">US Pharmacopeia (USP)</a></li>\r\n\t<li><a href="http://www.who.int/en">World Health Organization&nbsp; (WHO) </a></li>\r\n\t<li><a href="http://www.americanmedicinechest.com/?p=locations&amp;find_state=New+Jersey&amp;find_county=&amp;find_miles=5&amp;find_zipcode=&amp;submit=Go">American Medicine Chest</a></li>\r\n</ul>\r\n	23	2014-04-09 20:34:37.295002	2014-05-08 20:49:57.940712	4	t	t	f		f	f	Pharmacy Links	\N
30	Political Action	political-action	\N	pharmacy legislation, pharmacy political, NJ pharmacy, New Jersey pharmacy	Learn about the political advocacy activities of the New Jersey Pharmacists Association (NJPhA) and the NJPhA Political Action Committe (NJPhA-PAC). 	<h1>Political Action</h1>\r\n\r\n<p>The &ldquo;A&rdquo; in &ldquo;NJPhA&rdquo; doesn&rsquo;t stand for &ldquo;Advocacy,&rdquo; but it could, and a broad range of advocacy at that.</p>\r\n\r\n<p>To ensure that the voice of pharmacists in all practice settings and the needs of their patients are heard clearly in Trenton and Washington, {% link_pg link , false , , , 31 , we advocate energetically on your behalf%} before the New Jersey Legislature and other special interest groups and solicit grass-roots support at the federal level.</p>\r\n\r\n<p>The stronger the Association, the more effective the {% link_pg link , false , , , 32, advocacy effort%}. If you&rsquo;re not an NJPhA member, {% link_pg link , false , , , 7 , join today%}, and please consider a {% link_pg link , false , , , 32, donation%}&nbsp;to support the effort.</p>\r\n\r\n<p>There truly is strength in numbers. &nbsp;</p>\r\n	\N	2014-04-10 15:00:53.387764	2014-05-08 20:19:33.598494	5	t	t	f		f	f	NJPhA Political Action	\N
4	Committees	committees	\N	NJPhA Committees, NJ pharmacy, nj pharmacist	Join an NJPhA committee helps the Association advance pharmacy in New Jersey. NJPhA committees also provide many networking opportunities in all branches of pharmacy.	<h1>NJPhA Committees</h1>\r\n\r\n<p>Nobody has to tell you that the pharmacy profession is changing at an ever-increasing rate, and to keep pace, NJPhA has to evolve. But for this to happen, we need input, advice, and guidance from members like you.</p>\r\n\r\n<h2>Helping your profession. And Yourself.</h2>\r\n\r\n<p>Participating in an NJPhA committee takes time, but the benefits are many&mdash;enhancing leadership skills, steering direction of the Association, networking, early awareness of industry trends, and guiding the actions to address them. On top of this is knowing that your efforts continue to make the Association relevant and meaningful to your colleagues and your profession today and into the future.</p>\r\n\r\n<p>To participate in a committee, contact one of the committee chairs below or <a href="mailto:njpha@njpharma.org?subject=Committee%20Question">get in touch with the NJPhA office</a>.</p>\r\n\r\n<h2>2015 Committees</h2>\r\n\r\n<p><strong>Continuing Education</strong><br />\r\nRecommend and review {% link_pg link , false , , , 16 , educational-program &nbsp;%} content<br />\r\nChair: <a href="mailto:marysol.bishara@gmail.com">Monica Alaigh</a>, PharmD</p>\r\n\r\n<p><strong>Journal</strong><br />\r\nMaintain oversight of and provide advice to the editorial staff of {% link_pg link , false , , , 24 , <em>The New Jersey Journal of Pharmacy</em> %}&nbsp;<br />\r\nChair:&nbsp;<a href="mailto:leibfried2@hotmail.com">Maria Leibfried</a> , BS, PharmD, BCNSP, CCP</p>\r\n\r\n<p><strong>Government and Public Affairs</strong><br />\r\nReview, track, and prioritize proposed {% link_pg link , false , , , 30 , legislation and regulatory proposals%}<br />\r\nCo-chairs: <a href="mailto:linda_gooen@alumni.rutgers.edu">Harold Bobrow</a>, RPh and <a href="mailto:linda_gooen@alumni.rutgers.edu">Loretta Brickman</a>, RPh</p>\r\n\r\n<p><strong>Finance</strong><br />\r\nProvide financial oversight of the organization<br />\r\nChair: <a href="mailto:john.colaizzi@walgreens.com">John Colaizzi Jr</a>, PharmD, CCP</p>\r\n\r\n<p><strong>Professional Affairs</strong><br />\r\nReview professional issues affecting all areas of pharmacy practice<br />\r\nChair: <a href="mailto:ramar040@optonline.net">Eileen Fishman</a>, RPh</p>\r\n\r\n<p><strong>Permanent Organization</strong><br />\r\nConsider all propositions related to the amendment of the Constitution and by-laws<br />\r\nChair: <a href="mailto:ccpconsu@aol.com">Steve Zlotnick</a>, PharmD, CCP</p>\r\n\r\n<p><strong>Membership</strong><br />\r\nGuide membership services, recruitment, and retention initiatives<br />\r\nChair: <a href="mailto:c.posusney@yahoo.com">Ronald Manino</a>, RPh</p>\r\n\r\n<p><strong>Convention</strong><br />\r\nPlan, organize, and execute the {% link_pg link , false , , , 13 , Annual Meeting and Convention%} and {% link_pg link , false , , , 14 , March Madness%}<br />\r\nChair: <a href="mailto:moriahjaye@gmail.com">Ruth Marietta</a>, RPh, CCP</p>\r\n\r\n<p><strong>Student Practitioner</strong><br />\r\nIdentifies methods to strengthen {% link_pg link , false , , , 11 , Association relationships with pharmacy students &nbsp;%}<br />\r\nChair: <a href="mailto:G.Earl@usp.edu">Margaret Alabi</a>, PharmD</p>\r\n	1	2014-04-09 15:21:07.95248	2015-02-18 22:56:09.954357	4	t	t	f		f	f	NJPhA Committees	\N
29	Contact Us	contact-us	\N	NJPhA contact, NJPhA contact information	Access the contact information for the New Jersey Pharmacists Association. Includes map, phone and email information.	<div class="row">\r\n<div class="col-xs-8">\r\n<h1>Contact Us</h1>\r\n\r\n<h2>Call. Email. Write. Visit.</h2>\r\n\r\n<p>We want to hear from you. Often.<br />\r\nWith best wishes,</p>\r\n\r\n<ul>\r\n\t<li><a href="mailto:ebarry@njpharma.org">Elise M. Barry</a>, M.S., CFRE - Chief Executive Officer</li>\r\n\t<li>Administrative and Continuing Education Coordinator</li>\r\n</ul>\r\n</div>\r\n</div>\r\n\r\n<hr />\r\n<p style="text-align: center;"><strong style="text-align: center;">NJPhA Headquarters</strong><br style="text-align: center;" />\r\n<span style="text-align: center;">760 Alexander Road, PO Box 1</span><br style="text-align: center;" />\r\n<span style="text-align: center;">Princeton, NJ 08543-0001</span><br style="text-align: center;" />\r\n<span style="text-align: center;">Tel: 609-275-4246</span><br style="text-align: center;" />\r\n<span style="text-align: center;">Fax: 609-275-4066</span><br style="text-align: center;" />\r\n<span style="text-align: center;">Email:&nbsp;</span><a href="mailto:njpha@njpharma.org" style="text-align: center;">njpha@njpharma.org</a></p>\r\n\r\n<p style="text-align: center;"><iframe frameborder="0" height="450" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3042.0290958683513!2d-74.63611829999999!3d40.319511799999994!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c3e0da1a4726ff%3A0xc25da7e20fdcf642!2s760+Alexander+Rd!5e0!3m2!1sen!2sus!4v1397247290619" style="border:0" width="600"></iframe></p>\r\n	\N	2014-04-09 20:46:25.766277	2015-02-12 20:42:56.775293	7	t	t	f		f	f	Contact Us	\N
10	Awards	awards	\N	Pharmacy award, pharmacist award	NJPhA members can nominate peers or colleagues to receive one of several awards that reflect their contribution to pharmacy in New Jersey. 	<h1>NJPhA Awards</h1>\r\n\r\n<p><span style="font-size:14px;">Who inspires you? A neighborhood pharmacist who donated medication to a family working through hard times?</span></p>\r\n\r\n<p><span style="font-size:14px;">A pharmacy school instructor who helped you master that topic you initially thought was impossible to comprehend?</span></p>\r\n\r\n<p><span style="font-size:14px;">NJPhA provides <strong>members</strong> with an excellent way to thank <strong>fellow NJPhA members</strong>&mdash;who are your colleagues, friends, mentors&mdash;who made a difference in your career. Each year at the Annual Meeting and Convention, NJPhA recognizes <strong>member-nominated award recipients</strong> for their contributions and achievements.</span></p>\r\n\r\n<p><span style="font-size:14px;">Few things are more gratifying than peer-recognition. Who will you nominate today?</span></p>\r\n\r\n<h2>The awards</h2>\r\n\r\n<table class="table table-bordered" style="text-align:left;">\r\n\t<thead>\r\n\t\t<tr>\r\n\t\t\t<th style="width:217px">\r\n\t\t\t<h4 style="text-align: center;"><strong>Award Name</strong></h4>\r\n\t\t\t</th>\r\n\t\t\t<th style="width:422px">\r\n\t\t\t<h4 style="text-align: center;"><strong>Award Description</strong></h4>\r\n\t\t\t</th>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style="width: 217px;">\r\n\t\t\t<p>Rosario J. Mannino Award</p>\r\n\t\t\t</td>\r\n\t\t\t<td style="width: 422px;">\r\n\t\t\t<p>This award honors President-Emeritus Rosario J. Mannino, and is given for meritorious service to the profession of pharmacy and the New Jersey Pharmacists Association.</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style="width: 217px;">\r\n\t\t\t<p>Bowl of Hygeia<br />\r\n\t\t\t<span style="font-size:11px;">Sponsored by APhA Foundation and NASPA</span></p>\r\n\t\t\t</td>\r\n\t\t\t<td style="width: 422px;">\r\n\t\t\t<p>Sponsored by National Alliance of State Pharmacy Associations (NASPA) to a living, NJ licensed pharmacist who has compiled an outstanding record of community service that, apart from the practice of pharmacy, reflects well on the profession.</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style="height: 77px; width: 217px;">\r\n\t\t\t<p>Andrew J. Preston Political Action Award</p>\r\n\t\t\t</td>\r\n\t\t\t<td style="height: 77px; width: 422px;">\r\n\t\t\t<p>Sponsored by past President and PAC Chairman Andrew J. Preston, this award is presented to an NJPhA member exhibiting&nbsp; outstanding effort in the political arena to benefit the profession and our patients.</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style="width: 217px;">\r\n\t\t\t<p>Donald J. Wernick Academic Achievement Award</p>\r\n\t\t\t</td>\r\n\t\t\t<td style="width: 422px;">\r\n\t\t\t<p>Presented to an academician who has performed outstanding service for our profession&nbsp; and NJPhA.</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style="width: 217px;">\r\n\t\t\t<p>Frederick B. Kilmer Award &nbsp;</p>\r\n\r\n\t\t\t<p>&nbsp;</p>\r\n\t\t\t</td>\r\n\t\t\t<td style="width: 422px;">\r\n\t\t\t<p>Dr. Kilmer, a former NJPhA president, established the concept of research at J&amp;J that became a standard for much of the pharmaceutical industry. He was a prodigious writer who valued articulate writing as a means of improving the pharmacy profession and the health of our citizenry.</p>\r\n\r\n\t\t\t<p>Though Dr. Kilmer&#39;s bequest to recognize excellence in pharmacy writing by a member was depleted many years ago,&nbsp; the award has been given since 1938.&nbsp; All members, with the exception of educators and laboratory workers, are eligible.</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style="width: 217px;">\r\n\t\t\t<p>NASPA Excellence in Innovation Award<br />\r\n\t\t\t<span style="font-size:11px;">Sponsored by Upsher-Smith</span></p>\r\n\t\t\t</td>\r\n\t\t\t<td style="width: 422px;">\r\n\t\t\t<p>Sponsored by NASPA, this award is given to a practicing pharmacist within New Jersey who has demonstrated innovative pharmacy practice resulting in improved patient care.</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style="width: 217px;">\r\n\t\t\t<p>Jesse Gaynor Award</p>\r\n\t\t\t</td>\r\n\t\t\t<td style="width: 422px;">\r\n\t\t\t<p style="margin-left:4.5pt">Presented to a consultant pharmacist who has shown meritorious service and dedication to the practice of pharmacy.</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style="width: 217px;">\r\n\t\t\t<p>Mortar &amp; Pestle Award</p>\r\n\t\t\t</td>\r\n\t\t\t<td style="width: 422px;">\r\n\t\t\t<p>Authorized by the Board of Trustees, the Mortar &amp; Pestle Award is given to an individual who is not a pharmacist, but who by virtue of his or her activity, has contributed to the profession of pharmacy and the public-at-large.</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style="width: 217px;">\r\n\t\t\t<p>William H. McNeill Award</p>\r\n\t\t\t</td>\r\n\t\t\t<td style="width: 422px;">\r\n\t\t\t<p>This award recognizes outstanding community service work by an NJPhA member in the preceding year or years.</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style="width: 217px;">\r\n\t\t\t<p>Pharmacist Mutual Distinguished Young Pharmacist Award</p>\r\n\t\t\t</td>\r\n\t\t\t<td style="width: 422px;">\r\n\t\t\t<p>Presented to an outstanding pharmacist who has worked for the profession of pharmacy and who graduated in the past ten years.&nbsp;</p>\r\n\r\n\t\t\t<p>This award is presented to a pharmacist who best meets the following guidelines:</p>\r\n\r\n\t\t\t<ul>\r\n\t\t\t\t<li>Licensed to practice New Jersey</li>\r\n\t\t\t\t<li>Current membership in NJPhA</li>\r\n\t\t\t\t<li>Practices retail, institutional, managed care, or consulting pharmacy in the year selected</li>\r\n\t\t\t\t<li>Participation in national pharmacy associations, professional programs, state association activities, and/or community service</li>\r\n\t\t\t</ul>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style="width: 217px;">\r\n\t\t\t<p>Pharmaceutical Industry Award</p>\r\n\t\t\t</td>\r\n\t\t\t<td style="width: 422px;">\r\n\t\t\t<p>Presented to a representative of the pharmaceutical industry who has advanced the profession through educational efforts or support to the profession</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style="width: 217px;">\r\n\t\t\t<p>Independent Pharmacist of the Year Award</p>\r\n\t\t\t</td>\r\n\t\t\t<td style="width: 422px;">\r\n\t\t\t<p>Supported by Buy-SellaPharmacy, this award is presented to a practicing pharmacist who has demonstrated exemplary service to his/her patients and the community.</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style="width: 217px;">\r\n\t\t\t<p>Cardinal Health Generation Rx Champions Award</p>\r\n\t\t\t</td>\r\n\t\t\t<td style="width: 422px;">\r\n\t\t\t<p>Presented to a pharmacist in recognition of efforts to prevent prescription drug abuse, and for outstanding service to the pharmacy community to raise awareness of this serious public health problem.</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style="width: 217px;">\r\n\t\t\t<p>Sidney B. Gilman &nbsp;Pharmacy Technician Award</p>\r\n\t\t\t</td>\r\n\t\t\t<td style="width: 422px;">\r\n\t\t\t<p>Presented to an NJPhA Pharmacy Technician member in recognition of Individual excellence and outstanding service to the pharmacy profession.</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t</thead>\r\n</table>\r\n\r\n<h3><span style="font-size: 14px; line-height: 16.799999237060547px;">&nbsp;</span></h3>\r\n\r\n<h2>How to nominate</h2>\r\n\r\n<p><span style="font-size:14px;">Select the appropriate award from the list above, complete the online form below, and click SUBMIT. Several worthy candidates are nominated annually for each award, so please include as much supporting information as is appropriate.</span></p>\r\n\r\n<h4><span style="font-size:14px;"><strong>Instructions</strong></span></h4>\r\n\r\n<ul>\r\n\t<li><span style="font-size:14px;">All fields must be completed legibly; incomplete nominations will not be considered</span></li>\r\n\t<li><span style="font-size:14px;">Only nominations submitted on this form will be considered</span></li>\r\n\t<li><span style="font-size:14px;">Only one nomination per form (to nominate the same person for multiple awards, you must complete multiple forms)</span></li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>{% award_nomination_form %}</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n	5	2014-04-09 18:32:34.800054	2014-07-19 23:36:16.95523	4	t	t	f		f	f	NJPhA Awards	\N
43	Home	home	\N	NJPHA, New Jersey Pharmacist, NJ pharmacist	Official home page for the New Jersey Pharmacists Association (NJPhA), whose education and advocacy efforts support pharmacists and their patients. 	<div class="row">\r\n<div class="col-xs-3">{% link_pg link , false , _self , , 12 , <img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/51/original_home_calendar_new.png" style="width: 223px; height: 111px; margin-top: 22px; margin-bottom: 22px;" /> %}</div>\r\n\r\n<div class="col-xs-3">{% link_pg link , false , _self , , 16 , <img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/52/original_home_education_new.png" style="width: 223px; height: 111px; margin-top: 22px; margin-bottom: 22px;" /> %}</div>\r\n\r\n<div class="col-xs-3">{% link_pg link , false , _self , , 30 ,<img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/54/original_home_political_new.png" style="width: 223px; height: 111px; margin-top: 22px; margin-bottom: 22px;" /> %}</div>\r\n\r\n<div class="col-xs-3">{% link_pg link ,false , _self ,, 11 ,<img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/57/original_home_student_new.png" style="width: 223px; height: 111px; margin-top: 22px; margin-bottom: 22px;" /> %}</div>\r\n</div>\r\n\r\n<div class="row">\r\n<div class="col-xs-12" style="margin-bottom:17px">{% link_pg link ,false , _self ,, 13 ,<a href="http://njpharmacists.org/events/annual-convention"><img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/86/original_oct_event_2015_banner.jpg" style="width: 952px; height: 88px;" /></a>%}</div>\r\n</div>\r\n\r\n<div class="row container">\r\n<div class="col-xs-6">\r\n<div class="col-xs-12 home-left-panel  col-centered">\r\n<h2>Continuing Ed. Opportunities</h2>\r\n\r\n<ul>\r\n\t<li>Melanoma-Targeted Therapy: Focus on Mekinist and Tafinlar &nbsp;&nbsp;</li>\r\n\t<li>Prescription Drug Abuse &nbsp;</li>\r\n\t<li>Hypertension Therapy Update</li>\r\n\t<li>The Pharmacist &amp; Patient-Centered Diabetes Care</li>\r\n\t<li>Pharmacy-Based Immunization Delivery</li>\r\n</ul>\r\n\r\n<p align="center">{% link_pg button, false, _self, btn-lg, 16, More Education Programs %}</p>\r\n</div>\r\n&nbsp;\r\n\r\n<div class="col-xs-12 home-right-panel col-centered">\r\n<h2>Legislation We Monitor</h2>\r\n\r\n<ul>\r\n\t<li>Prohibiting the sale of products containing dextromethorphan to persons under 18 years of age</li>\r\n\t<li>Requiring proof of ID when certain prescription medications are dispensed</li>\r\n\t<li>Permitting pharmacists to substitute a biosimilar biological product under certain circumstances&nbsp;</li>\r\n</ul>\r\n\r\n<p align="center">{% link_pg button, false, _self, btn-lg, 31, More Legislation News %}</p>\r\n</div>\r\n</div>\r\n\r\n<div class="col-xs-6">\r\n<div class="col-xs-12 home-right-panel col-centered"><iframe allowtransparency="true" frameborder="0" scrolling="no" src="//www.facebook.com/plugins/likebox.php?href=https%3A%2F%2Fwww.facebook.com%2FNJPhA&amp;width=400&amp;height=532&amp;colorscheme=light&amp;show_faces=false&amp;header=false&amp;stream=true&amp;show_border=false&amp;appId=181996265257356" style="border:none; overflow:hidden; width:400px; height:532px;"></iframe></div>\r\n</div>\r\n</div>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n	\N	2014-04-19 02:16:15.888196	2015-02-19 18:52:52.687945	0	f	f	f	/	f	t	Home Page New Jersey Pharmacists Association	\N
33	(Global) Member Log In	member-login	\N			<div class="membeeWrapper"><script type='text/javascript'>\r\ncreate_dynamic_membee_script('https://memberservices.membee.com/feeds/Login/LoginFrameScript.ashx?clientid=955&appid=1062&destURL=http://njpharmacists.org/process_login');\r\n</script></div>\r\n	43	2014-04-11 18:43:48.218116	2014-05-27 01:39:22.797957	0	f	f	f		f	f	Member Login	\N
6	Benefits	benefits	\N	NJPHA, New Jersey Pharmacist, NJ pharmacist	Join NJPhA to access many benefits, such as discounts on live and remote pharmacy continuing education, online access to the NJ Journal of Pharmacy, and more.	<h1>NJPhA Benefits</h1>\r\n\r\n<p>As a member, you&rsquo;ll automatically be notified by email about {% link_pg link , false , , , 31 , legislative updates%}, continuing education programs (with member-only discounts), specialty training and best-practice discussions, full online access to {% link_pg link , false , , , 24 , <em>The New Jersey Journal of Pharmacy</em>%}, an active {% link_pg link , false , , , 25 , career center%} and more.</p>\r\n\r\n<p>But the benefits don&rsquo;t stop with you. When you join NJPhA, you&rsquo;re helping others in your profession and the people that they serve.</p>\r\n\r\n<p>Here&rsquo;s how.</p>\r\n\r\n<h2>Help your patients</h2>\r\n\r\n<ul>\r\n\t<li>Support initiatives to increase immunization rates in New Jersey</li>\r\n\t<li>Establish collaborative practice models to better manage disease states and increase wellness visits</li>\r\n</ul>\r\n\r\n<h2>Help your profession</h2>\r\n\r\n<ul>\r\n\t<li>Advocate CMS Provider status for pharmacists</li>\r\n\t<li>Write articles or provide peer reviews for {% link_pg link , false , , , 24 , ​<em>The New Jersey Journal of Pharmacy</em>%}</li>\r\n</ul>\r\n\r\n<h2>Increase your knowledge</h2>\r\n\r\n<ul>\r\n\t<li>Training opportunities that connect theory and practice.\r\n\t<ul>\r\n\t\t<li>Association-sponsored {% link_pg link , false , , , 17 , regional continuing education%} programs</li>\r\n\t\t<li>Live and pre-recorded {% link_pg link , false , , , 18 , webinars%}</li>\r\n\t\t<li>{% link_pg link , false , , , 20 , Specialty Certificate%} Programs with member discounts</li>\r\n\t\t<li>Free continuing education via {% link_pg link , false , , , 24, ​<em>The New Jersey Journal of Pharmacy</em>%}&nbsp;</li>\r\n\t\t<li>Specialized-topic {% link_pg link , false , , , 21 , Academy forums%}\r\n\t\t<ul>\r\n\t\t\t<li>Consulting, Compounding, Disaster Management</li>\r\n\t\t</ul>\r\n\t\t</li>\r\n\t</ul>\r\n\t</li>\r\n</ul>\r\n\r\n<h2>Expand your network</h2>\r\n\r\n<ul>\r\n\t<li>{% link_pg link , false , , , 13 , Annual Meeting and Convention%}</li>\r\n\t<li>{% link_pg link , false , , , 14 , March Madness training and networking%}</li>\r\n\t<li>{% link_pg link , false , , , 17 , Regional gatherings%}</li>\r\n\t<li>{% link_pg link , false , , , 4 , Proactive committees%}</li>\r\n\t<li>Expansive <a href="https://www.facebook.com/NJPhA">Facebook</a> and <a href="https://www.linkedin.com/groups?gid=2804149">LinkedIn</a> communities</li>\r\n</ul>\r\n\r\n<p>{% link_pg button, false, _self, btn-large, 7, Join Now%}</p>\r\n\r\n<p><strong>&nbsp;</strong></p>\r\n	5	2014-04-09 16:11:58.852952	2014-05-27 03:24:04.011676	2	t	t	f		f	f	NJPhA Membership Benefits 	\N
54	(Global) eBilling	ebilling	\N			<script src="http://memberservices.membee.com/feeds/EBilling/EBillingScript.ashx?cid=955" type="text/javascript"></script>	43	2014-09-24 17:25:55.515081	2014-09-24 17:26:34.844523	0	f	f	f		f	f		\N
13	Annual Meeting & Convention	annual-convention	\N	NJ pharmacy, nj pharmacist, annual meeting, pharmacy convention	Come to the NJPhA Annual Meeting & Convention Sept 19-21 in Asbury Park. Continuing education, networking and fun events for pharmacists, pharmacy technicians and pharmacy students. 	<h1>Annual Meeting and Convention</h1>\r\n\r\n<p><strong>Planning is Underway for Fall 2015!</strong></p>\r\n\r\n<p><strong>Save the Date!</strong></p>\r\n\r\n<p><strong>Harrah&#39;s Atlantic City - </strong><strong>October 16-18, 2015</strong></p>\r\n\r\n<p>If you have ideas and suggestions, don&#39;t hestitate to let our Convention Committee know while the event is in the planningn stage.&nbsp; Call the office at 609-275-4246.<br />\r\n<br />\r\n&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n	12	2014-04-09 18:55:37.211072	2015-02-13 00:13:18.365874	2	t	t	f		f	f	NJPhA Annual Meeting & Convention	\N
56	CE Calendar	CE-Calendar	\N				16	2014-11-19 14:58:20.586928	2014-11-19 16:45:09.307252	1	t	t	t	http://njpharmacists.org/events#cid=955&wid=201	f	f		\N
57	Sponsors	corporate-event-sponsors	\N			<h1>Corporate Sponsors</h1>\r\n\r\n<p><a href="http://www.rdcdrug.com/"><img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/91/original_rdc_logo_-_no_words.jpg" style="width: 350px; height: 175px;" /></a></p>\r\n\r\n<p><a href="http://www.phmic.com/Pages/Home.aspx"><img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/90/original_pharmmutual.jpg" style="width: 200px; height: 99px;" /></a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h1>Event Sponsors</h1>\r\n\r\n<h2>&nbsp;<img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/93/original_program_confirmation_letter-new_jersey.jpg" style="width: 220px; height: 60px;" /><img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/92/original_paradigmn.jpg" style="width: 85px; height: 95px;" />Afternoon Break - March Madness - March 14, 2015</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n	23	2015-03-03 15:41:30.844827	2015-03-03 16:47:11.260127	7	t	t	f		f	f		\N
14	March Madness	march-madness	\N	NJPHA CEU, pharmacy continuing education, New Jersey Pharmacist 	Attend the 2015 NJPhA March Madness event to catch up on your pharmacy continuing education credits. Renewing your license or continuing, March madness helps you fill your CEU folder.	<h1>March Madness</h1>\r\n\r\n<p>Have you kept up with your continuing education credits for the year?</p>\r\n\r\n<p>If not, you&rsquo;re in good company. That&rsquo;s one of the reasons why NJPhA created March Madness&mdash;a one-day program to ensure that you won&#39;t be stuck cramming right before license renewal. And for renewal years, Madness is here to help you catch up.</p>\r\n\r\n<h2>Success in 2014</h2>\r\n\r\n<p>March Madness 2014 was a major success. Many of your peers earned continuing education credits in several important areas.</p>\r\n\r\n<ul>\r\n\t<li>New Drugs Update</li>\r\n\t<li>HIV Pharmacotherapy Update</li>\r\n\t<li>Immunization Update 2014</li>\r\n\t<li>Medication Therapy with Geriatric Residents: Clinical Tips</li>\r\n\t<li>The Management of Melanoma</li>\r\n</ul>\r\n\r\n<p>The Madness also included many opportunities for extensive networking and career development conversations.</p>\r\n\r\n<h2>March Madness 2015</h2>\r\n\r\n<h2>Registration is now OPEN!</h2>\r\n\r\n<p>When: March 14, 2015</p>\r\n\r\n<p>Where: Annunciation Center, College of St. Elizabeth</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2 Convent Road, Morristown, NJ 07960</p>\r\n\r\n<p>Offering immunization update credits, law credits, presentations on anticoagulants, pediatric safety, medication errors, AIDS and more.&nbsp; For additional information, please see the registration page.</p>\r\n\r\n<p>{% link_pg button, false, _self, btn-large,<a href="http://njpharmacists.org/events/event-info#id=182&amp;cid=955&amp;wid=201" id="ctl00_RightContent_UcEventDetail1_UcEventSelectedDetail_hlEventURL" target="_blank"> http://njpharmacists.org/events/event-info#id=182&amp;cid=955&amp;wid=201</a>, Register %}</p>\r\n\r\n<p>Not a member? It&rsquo;s easy to {% link_pg link , false , , , 7 , join NJPhA&nbsp;%}.</p>\r\n\r\n<p>{% link_pg button, false, _self, btn-large, 7, Join Now %}</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/8/content_acpe.jpg" style="width: 61px; height: 61px; margin-right: 10px; margin-left: 10px; float: left;" /><em><span style="font-size: 12px;">The New Jersey Pharmacists Association is accredited by the Accreditation Council for Pharmacy Education as a provider of continuing pharmacy education. Proof of participation will be submitted to mycpemonitor.net after verification of attendance and completion of evaluations materials.</span></em></p>\r\n	12	2014-04-09 19:07:27.541298	2015-02-16 07:21:30.851943	3	t	t	f		f	f	NJPhA March Madness	\N
7	Join/Renew	join-renew	\N	NJPHA membership, New Jersey Pharmacist, NJ pharmacist, pharmacist association	Joining NJPhA is fast and easy. Online registration takes only minutes. Membership provides discounts on continuing ed programs and access to member-only website content. 	<h1>Join NJPhA</h1>\r\n\r\n<p><img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/77/original_mw-membershipnote.jpg" style="width: 633px; height: 319px;" /></p>\r\n\r\n<h2>Register or renew?</h2>\r\n\r\n<p>To join the Association for the first time, just complete the form at the bottom of this page.</p>\r\n\r\n<p>Would you like to renew your membership instead? Terrific!&nbsp;Each year, the NJPhA emails renewal reminders - to all current members -&nbsp;just weeks before&nbsp;renewal date. &nbsp;To renew, simply&nbsp;open the email, click the link, and renew online. It&#39;s that easy.</p>\r\n\r\n<p>If your membership is up for renewal soon, however,&nbsp;and you have not yet received an email from us, please&nbsp;call&nbsp;the office at 609-275-4246&nbsp;and an NJPhA staff member will be certain to forward&nbsp;another renewal reminder to you.</p>\r\n\r\n<p>To check your membership status, {% link_pg link , false , , , 33 , log in%}, click the button, View Profile / Edit Profile, and review the information that&#39;s displayed.</p>\r\n\r\n<h2>Register for the first time</h2>\r\n\r\n<p>Registration is easy. Just complete the form below.</p>\r\n\r\n<p>If you have any questions regarding registration, please contact the office.</p>\r\n\r\n<div class="membeeWrapper"><script src="http://memberservices.membee.com/feeds/Profile/ProfileScript.ashx?cid=955&pid=701" type="text/javascript"></script></div>\r\n\r\n<p><span style="font-size:12px;"><em>*NJPhA dues are not deductible for income-tax purposes. They may be deductible as ordinary and necessary business expenses, subject to restrictions as a result of organization lobbying activities. NJPhA estimates that 19% is the nondeductible portion of your 2015 dues.</em></span></p>\r\n\r\n<p><span style="font-size:12px;"><em>**PAC contributions are not deductible for income tax purposes. Contributions to NJPhA PAC are voluntary and used for political purposes. You may refuse to contribute without reprisal, and the Association will not favor or disfavor any member because of the amount contributed.</em></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n	5	2014-04-09 18:10:41.3969	2015-02-19 18:46:35.827724	3	t	t	f		f	f	Join NJ Pharmacists Association	\N
59	+TONIC Rx Events	tonic_events	\N	+TONIC Rx		<h1>Introducing...</h1>\r\n\r\n<p><img alt="" height="142" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/94/original_tonic_i.jpg" width="392" /></p>\r\n\r\n<p><span style="font-size: 14px;"><sup>+</sup></span>TONIC R<sub>x</sub> is a new concept in pharmacy networking that centers around fun and interesting social and charity events. The more unique the better - be it a trail&#39;s end BBQ, a tree-top adventure course, or a boardwalk bike-a-thon. Come and spend some quality time with us as we work to build a better, stronger pharmacy community in New Jersey.</p>\r\n\r\n<h2>You are invited to the first of many exciting gatherings - Avenue Le Club - April 6!</h2>\r\n\r\n<h3>Where:</h3>\r\n\r\n<p><strong>Avenue Le CLub</strong></p>\r\n\r\n<p>23 Ocean Avenue</p>\r\n\r\n<p>Long Branch, NJ 07740</p>\r\n\r\n<p>732.759.2900</p>\r\n\r\n<h3>When:</h3>\r\n\r\n<p><strong>April 6, 2015</strong></p>\r\n\r\n<p>5 - 7pm</p>\r\n\r\n<h3>Details:</h3>\r\n\r\n<p>Hosted by NJPhA Region 4.&nbsp; $6 - 7&nbsp;Happy Hour drinks.&nbsp;<strong>First 10 guests to arrive will receive one complimentary drink ticket.&nbsp; </strong>Appetizers will be served.</p>\r\n\r\n<h2>At NJPhA, we aim to prove the old adage: <img alt="" height="55" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/95/original_tonic_tag_ii.jpg" width="403" /></h2>\r\n\r\n<p><img alt="" src="http://s3.amazonaws.com/njphasite-dev/ckeditor_assets/pictures/96/original_instagram.png" style="width: 100px; height: 100px;" /></p>\r\n\r\n<p><span aria-hidden="true" style="font: italic 100 300px/normal adelle-sans, serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: italic 100 300px/normal adelle-sans, sans-serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: italic 300 300px/normal adelle-sans, serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: italic 300 300px/normal adelle-sans, sans-serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: italic 400 300px/normal adelle-sans, serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: italic 400 300px/normal adelle-sans, sans-serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: italic 600 300px/normal adelle-sans, serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: italic 600 300px/normal adelle-sans, sans-serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: italic 700 300px/normal adelle-sans, serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: italic 700 300px/normal adelle-sans, sans-serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: 100 300px/normal adelle-sans, serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: 100 300px/normal adelle-sans, sans-serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: 300 300px/normal adelle-sans, serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: 300 300px/normal adelle-sans, sans-serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: 400 300px/normal adelle-sans, serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: 400 300px/normal adelle-sans, sans-serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: 600 300px/normal adelle-sans, serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: 600 300px/normal adelle-sans, sans-serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: 700 300px/normal adelle-sans, serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: 700 300px/normal adelle-sans, sans-serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span></p>\r\n\r\n<p>@njpha #TONICRx</p>\r\n	12	2015-03-09 23:40:17.349284	2015-03-23 18:04:49.673631	5	t	t	f		f	f		\N
12	Events	events	\N	NJPHA calendar, New Jersey Pharmacist, NJ pharmacist events	Access a calendar of pharmacy events and continuing ed programs throughout the state. Events are designed for pharmacists, pharmacy technicians and students.	<h1>NJPhA Events</h1>\r\n\r\n<p>If you&rsquo;re looking to obtain continuing education credits, meet local peers, or catch up on the status of pharmacy legislation that&rsquo;s circulating the hallways of Trenton, the Events Calendar (below) is a great place to start.</p>\r\n\r\n<p>The Calendar lists all the activities scheduled throughout the {% link_pg link , false , , , 2&nbsp;, 6 regions %} of the Association, including education programs, local meetings, and networking events. You can also find information that links to the {% link_pg link , false , , , 14 , March Madness&nbsp;%} education confabs, the {% link_pg link , false , , , 13 , Annual Meeting and Convention%} hosted this at Harrah&#39;s Resort in Atlantic City, and our newest group of social events - {% link_pg link , false , , , 59, +TONIC Rx%}.</p>\r\n\r\n<p>And you can look forward to more opportunities to participate in {% link_pg link , false , , , 15 , NJPhA Legislative Day%}&mdash;a chance to get up close and involved with the legislation and the legislators who create and debate the bills that affect the pharmacy profession in New Jersey. Legislative Day is a great opportunity to do more than just voice an opinion.</p>\r\n\r\n<p>Come to an Association event&mdash;you&rsquo;ll be glad that you did.</p>\r\n\r\n<h2>Bring the event to you &ndash;&nbsp;home study</h2>\r\n\r\n<p>If your schedule has you too busy to attend a program, why not bring the program to you?</p>\r\n\r\n<p>In addition to what you see in the calendar below, NJPhA also povides an ever-expanding variety of {% link_pg link , false , , , 19 ,home study programs%}.</p>\r\n\r\n<h2>Event Calendar</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span aria-hidden="true" style="font: italic 100 300px/normal adelle-sans, serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: italic 100 300px/normal adelle-sans, sans-serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: italic 300 300px/normal adelle-sans, serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: italic 300 300px/normal adelle-sans, sans-serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: italic 400 300px/normal adelle-sans, serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: italic 400 300px/normal adelle-sans, sans-serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: italic 600 300px/normal adelle-sans, serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: italic 600 300px/normal adelle-sans, sans-serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: italic 700 300px/normal adelle-sans, serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: italic 700 300px/normal adelle-sans, sans-serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: 100 300px/normal adelle-sans, serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: 100 300px/normal adelle-sans, sans-serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: 300 300px/normal adelle-sans, serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: 300 300px/normal adelle-sans, sans-serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: 400 300px/normal adelle-sans, serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: 400 300px/normal adelle-sans, sans-serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: 600 300px/normal adelle-sans, serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: 600 300px/normal adelle-sans, sans-serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: 700 300px/normal adelle-sans, serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><span aria-hidden="true" style="font: 700 300px/normal adelle-sans, sans-serif; margin: 0px; padding: 0px; left: -999px; top: -999px; width: auto; height: auto; display: block; white-space: nowrap; position: absolute; font-size-adjust: none; font-stretch: normal;">BESbswy</span><script src="http://memberservices.membee.com/feeds/Events/EventScript.ashx?cid=955&wid=201" type="text/javascript"></script></p>\r\n	\N	2014-04-09 18:51:11.812234	2015-03-18 03:44:31.183784	3	t	t	f		f	f	NJPhA Events	\N
\.


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('pages_id_seq', 59, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY schema_migrations (version) FROM stdin;
20130813175227
20130813191511
20130821145426
20130826141348
20130827210142
20130827211451
20130828142349
20130828163647
20130830143959
20130902031451
20130902033005
20130902134417
20130902161056
20130905165632
20130912142942
20130918142942
20140409031802
20140409032001
20140410210405
20140416194539
20140416194841
20140417182552
20140418035551
20140418143654
20140420021134
20140422040600
20140422201621
20140422202720
20140502164826
20140522144301
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY settings (id, setting_name, setting_value, setting_attachment_file_name, created_at, updated_at, requires_file) FROM stdin;
49	Banner 1 Image	\N	Banner1.jpg	2014-04-18 01:05:47.508809	2014-05-01 15:12:19.332233	t
55	Banner 4 Image	\N	Banner4.jpg	2014-04-18 01:05:47.561652	2014-05-01 15:19:21.273214	t
63	LinkedIn URL	https://www.linkedin.com/groups?gid=2804149	\N	2014-04-22 11:48:37.94418	2014-04-27 18:37:45.736075	f
51	Banner 2 Image	\N	Banner2.jpg	2014-04-18 01:05:47.529646	2014-04-23 15:13:35.050276	t
53	Banner 3 Image	\N	Banner3.jpg	2014-04-18 01:05:47.545508	2014-04-23 15:13:44.111802	t
57	Banner 5 Image	\N	\N	2014-04-18 01:05:47.575249	2014-05-01 19:22:49.687071	t
50	Banner 1 URL	/membership/join-renew	\N	2014-04-18 01:05:47.520319	2014-04-23 15:14:59.316422	f
52	Banner 2 URL	/political-action/advocacy	\N	2014-04-18 01:05:47.536429	2014-04-23 15:17:31.569161	f
54	Banner 3 URL	/continuing-education	\N	2014-04-18 01:05:47.554072	2014-04-23 15:17:57.417097	f
56	Banner 4 URL	/resources	\N	2014-04-18 01:05:47.568581	2014-04-23 15:18:18.400772	f
42	Twitter URL	https://twitter.com/NJPharmA	\N	2014-04-18 01:05:47.409876	2014-04-22 11:56:22.956477	f
43	Facebook URL	https://www.facebook.com/NJPhA	\N	2014-04-18 01:05:47.441153	2014-04-22 11:56:51.425204	f
66	Donation URL	/home/donate	\N	2014-04-30 13:04:52.542019	2014-04-30 13:04:52.542019	\N
62	Global Custom CSS Styling	h1,h2,h3,h4,h5\r\n{\r\n\tfont-weight: 400;\r\n}\r\n\r\nh1\r\n{\r\n\tfont-size:34px;\r\n}\r\n\r\nh2\r\n{\r\n\tfont-size:24px;\r\n}\r\nh3\r\n{\r\n\tfont-size:18px;\r\n}\r\n\r\nh4,h5{\r\n  font-size:14px;\r\n}\r\na, a:visited, a:link{\r\n  color: #4F97A5;\r\n}\r\n\r\n.pg-copy a, .pg-copy a:visited, .pg-copy a:link{\r\n  color: #4F97A5;\r\n}\r\n\r\n.sidebar a.btn, .sidebar a.btn:visited, .sidebar a.btn:link{\r\n  color: #4F97A5;\r\n}\r\n\r\n.sidebar h2{\r\n  color: #851528 !important;\r\n}\r\n\r\n.callout\r\n{\r\n\tpadding-bottom:10px;\r\n}\r\n\r\n.home-content\r\n{\r\n   display: inline-block;\r\n  width: 300px;\r\n  height: 100px;\r\n  margin: 1em;\r\n}\r\n\r\na[name]:not([href]){\r\n  position: relative;\r\n  top: -170px;\r\n  text-decoration: none;\r\n  font-size:0px;\r\n  display:block;\r\n}\r\n\r\n.col-centered{\r\n    float: none;\r\n    margin: 0 auto;\r\n}\r\n\r\n.home-left-panel, .home-right-panel {\r\n  border: 1px solid #b8b8b8;\r\n  border-radius:10px;\r\n}\r\n  \r\n\r\n	\N	2014-04-18 01:05:47.617921	2014-04-30 15:13:20.034415	f
61	Global Footer Text	\N	\N	2014-04-18 01:05:47.608533	2014-04-18 01:05:47.608533	f
58	Banner 5 URL		\N	2014-04-18 01:05:47.581371	2014-11-19 19:35:12.148334	f
64	Banner Ad Image	\N	\N	2014-04-30 12:53:33.463407	2015-03-17 15:51:28.378884	t
65	Banner Ad URL		\N	2014-04-30 12:53:33.487188	2015-03-17 15:51:53.862066	f
\.


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('settings_id_seq', 66, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, first_name, last_name, roles, membee_id) FROM stdin;
24	lindahelmbrecht@comcast.net	$2a$10$LRIr/JRiIYz/Gjcy/LMKTeRZg4Km0AbthPOUk0/n1h2ksT5n.uOHq	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 17:43:51.269311	2014-05-27 17:43:51.269311	Linda	Helmbrecht	WebsiteLogin	430218
25	mwunder@qchek.com	$2a$10$l/TQzP2kix7FWLTjsNzly.jMDxnK0t61ZYDap6RsANC6qGhc5fYm.	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 17:45:46.408435	2014-05-27 17:45:46.408435	Michael	Wunder	WebsiteLogin	430527
26	jamiegomes22@gmail.com	$2a$10$dZuhJKlpbVW0A8tsq1i6Ueobx4fM7.9YOoUXgulusAdsxhO4Kt8G2	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 17:50:29.035478	2014-05-27 17:50:29.035478	Jamie	Gomes	WebsiteLogin	430193
27	mcguffyd@mskcc.org	$2a$10$mltBfzrc3BLs6QY7r.HKdOZpiCG9osbxKx7deYS6n5qVLX2ZwlqLa	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 18:03:28.89472	2014-05-27 18:03:28.89472	Donna	McGuffy	WebsiteLogin	430331
28	karl.v.kadany@gsk.com	$2a$10$UERM8EB8vzb09BATocEaHePrBR5yHDvQNUi4VTPRqqhTiu/gQ8e26	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 18:14:14.837852	2014-05-27 18:14:14.837852	Karl	Kadany	WebsiteLogin	430243
29	jpyuhas1@optimum.net	$2a$10$cuD8AQIX9uKu87OT/NthkeuW76QFoJecn2T4CeyElCDKX3GWyXkwW	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 18:25:07.547838	2014-05-27 18:25:07.547838	Sharon	Yuhas	WebsiteLogin	430536
30	js8312@hotmail.com	$2a$10$HcVeN9vbBTAZplaSCjrx3OxZhOsp/c6KULzDmxKjO2e9oOx/lA26u	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 18:32:15.442216	2014-05-27 18:32:15.442216	Jennifer	Sweeney	WebsiteLogin	430488
31	1426@medicineshoppe.com	$2a$10$qZdZXCgdfrBLg0Ob0W2KqOl4bSLvINEaZ3.6Sm7pdDpK7tK.zNYI.	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 18:35:19.216865	2014-05-27 18:35:19.216865	Anthony	Coppola	WebsiteLogin	430106
32	kncigna@gmail.com	$2a$10$8yGi6o7U71OmfHMYLQnbkuIaAJSC1jkBeHEKFvZJ/WUhQVoKqXpcm	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 18:36:37.518482	2014-05-27 18:36:37.518482	Kristine	Cigna	WebsiteLogin	430093
33	rvi5@embarqmail.com	$2a$10$tTfvR0ycKecscgxE8mPIzOG1lLwhVQUEofn3UolubYqw.kVs3gKyK	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 18:53:51.50533	2014-05-27 18:53:51.50533	Richard	Vaninwegen	WebsiteLogin	430507
34	rockone99@yahoo.com	$2a$10$0IndrSuE5wFp0rdjLhXz2OES2kWnMFQY25AkN5u5t.mzu6.Tu4QQm	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 19:08:09.939511	2014-05-27 19:08:09.939511	David	Miringoff	WebsiteLogin	430344
35	vizzilb2@verizon.net	$2a$10$RY/ykH.Pg1xL0cfJJ4piWu2oGof/KzODlFS4ZqUJx8WcguvluUbMy	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 19:15:31.036172	2014-05-27 19:15:31.036172	Lyn	Batastini-Vizzi	WebsiteLogin	430019
36	ron@interchem.com	$2a$10$vUq3pWr4eNcjQKhXeXP5P.04e0uXtOiUneqH0q7B6BZbHLkzJq.kS	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 19:25:53.709397	2014-05-27 19:25:53.709397	Ronald	Mannino	WebsiteLogin	430319
37	mpete8210@aol.com	$2a$10$rfDrlILBmLWi1x3PjktyzuWUSpwSb1QCU8PTh6kE0ts1YsYoOxtoO	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 19:29:25.641404	2014-05-27 19:29:25.641404	Marlene	Peterson	WebsiteLogin	430399
38	dorislchen@verizon.net	$2a$10$mKzOUKhn46mN1ge3332b1.WWrKH15lO670DY55zmAPdPsjEjeWRni	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 19:30:04.362401	2014-05-27 19:30:04.362401	Doris	Chen	WebsiteLogin	430083
39	wakhtar@mail.usciences.edu	$2a$10$F1vbgMqHPEoKZbj3TVKF6uJKYB0dg2qQMmQVFX7o5jTrQdablN7um	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 19:30:51.200234	2014-05-27 19:30:51.200234	Waqar	Akhtar	WebsiteLogin	429986
40	laurieclark@msn.com	$2a$10$KBSIYQbnbqUvu.iZFO0YL.Zl3wl1NBGeIwanzgRvC.AqJEGNYDXgC	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 19:40:07.110898	2014-05-27 19:40:07.110898	Laurie	Clark	WebsiteLogin	430094
41	ljg226@gmail.com	$2a$10$97Gmi9gelidmJtDqnelY5O8rXrGFN3x11jkYhneOwdXqcBEP5RbUG	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 20:41:21.251738	2014-05-27 20:41:21.251738	Laura	Goldberger	WebsiteLogin	430190
42	bigbensdad@gmail.com	$2a$10$RQeEV5fhHezkRAruqdHDrO1ziIfpqtB3.GmdaPjBioaIUL2EsEtlK	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 20:56:03.547271	2014-05-27 20:56:03.547271	Zachary	Hopkins	WebsiteLogin	430228
43	hchconley@gmail.com	$2a$10$ESFxAUOi7vEinDwqmSUZs.FnjzaKUTety9GUEoft2nT0iX/rBZC56	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 21:02:46.971505	2014-05-27 21:02:46.971505	Helen	Conley	WebsiteLogin	430102
44	rebecca.j.yu@rutgers.edu	$2a$10$85WMOZJRc8C6QsNdOrLfBu0BPCeBQy1rY5c0kQlSDpTyWAL7hF6v.	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 21:03:45.18425	2014-05-27 21:03:45.18425	Rebecca	Yu	WebsiteLogin	430535
45	dloby@embarqmail.com	$2a$10$lKHPcxkQwyz27bkos7SK3e07weZMlmSHWbvIQLGiYP6k9ZnQ9phkO	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 21:15:47.456149	2014-05-27 21:15:47.456149	David	Lobenberg	WebsiteLogin	430302
13	alan.gerstein@verizon.net	$2a$10$yGZwegNkmnh/ek/AyAStJesm9y4dRPRH0wyVcNEooOGdODHLRDNEO	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 11:46:51.781242	2014-05-27 11:46:51.781242	Alan	Gerstein	WebsiteLogin	429921
14	kgoodman@membee.com	$2a$10$QzSCWoM6IJvABsgjiqYr6.x6u7VgDq9gMLg9gxqoNiTigkijMQ87O	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 13:10:17.46488	2014-05-27 13:10:17.46488	Kathy	Goodman	WebsiteLogin	429927
15	moriahjaye@gmail.com	$2a$10$B7aLussIOk.s9xiQWbRAFuMBxmLcXwk47I/0hiPjgmpfPPUoUiEUy	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 13:30:11.501408	2014-05-27 13:30:11.501408	Moriah	Weissman 3	WebsiteLogin	429928
16	fiore.joseph.j@gmail.com	$2a$10$geW8qrAA2Kx0gQusG8dEgOh4PTFhkPAybHY1d42MWlu8ZKc94L1Hm	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 17:28:30.701114	2014-05-27 17:28:30.701114	Joseph	Fiore	WebsiteLogin	430166
17	h4037@aol.com	$2a$10$mWxDB.EOjsEMbHuu0IO2YeNOBdhNIte41mCfNdN0Jb9zp4yHsrPS2	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 17:28:40.543386	2014-05-27 17:28:40.543386	James	Hertel	WebsiteLogin	430220
18	wphcy@aol.com	$2a$10$R6aLyHpPgwUmU2HLrXZcqe4M/wlhkevPoSn0KiSILXuWMbazjrToS	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 17:30:27.301284	2014-05-27 17:30:27.301284	William	Brown	WebsiteLogin	430060
19	jschiffer@abv.com	$2a$10$i9UcxxA5yNENro7Spbq/Fe7VgN6FySB4uTI540jSlGQ71c3.V27fm	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 17:32:09.509204	2014-05-27 17:32:09.509204	James	Schiffer	WebsiteLogin	430440
20	slugocki@fdu.edu	$2a$10$eLS0sh2yxXSayXXrzPwR1e5myw.veeYO7gwWcttDuUbM4pZteEpaS	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 17:32:36.771928	2014-05-27 17:32:36.771928	Malgorzata	Slugocki	WebsiteLogin	430473
21	clintrxi@ix.netcom.com	$2a$10$hd0h5qPrH9U7RM.vRhXwc.rlmqbxBEHujfJSttjxOsoarlRvdg.SO	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 17:37:40.95126	2014-05-27 17:37:40.95126	Clinton	Spaar	WebsiteLogin	430476
22	stevengooen@alumni.rutgers.edu	$2a$10$GWFX94LsQaCBtzQS10pek..ZKZoQN.glDOdn1Ey4meMV9QjYdUjki	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 17:40:33.749645	2014-05-27 17:40:33.749645	Steven	Gooen	WebsiteLogin	430195
23	ijechi@gmail.com	$2a$10$527tvU3mh7UDYNyapdSSFOgmWTFABp8GYhQ1ukjJFMkerqdXK32w2	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 17:43:45.099118	2014-05-27 17:43:45.099118	Ijeoma	Chimezie	WebsiteLogin	430085
46	gilubinsky@gmail.com	$2a$10$htJzSrBI3e6NlrBxorQLp.cb0s21lBr4d04SmaVq5QJambAjNh.Z2	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 21:20:04.886313	2014-05-27 21:20:04.886313	Gregg	Lubinsky	WebsiteLogin	430310
47	dwong07059@optonline.net	$2a$10$NGiLImUqOncCT918OGdgcebNyrVLKsT1VAp0nale6I7mwV1g7Ets.	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 21:47:35.001488	2014-05-27 21:47:35.001488	Delores	Wong	WebsiteLogin	430524
48	mtsbwy@aol.com	$2a$10$ppcXV5NM4ys.TZLmAw.M2eDKDbjy0AboFa89lV043OR34cT9UdPCC	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 22:03:50.884197	2014-05-27 22:03:50.884197	Robert	Schwartz	WebsiteLogin	430445
49	mclrx@comcast.net	$2a$10$85FWjIQYfFTMoumJIB6f/e/JhvA4QlZZ.P5cB1mARaAMVfDDmHEPK	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 22:08:03.069084	2014-05-27 22:08:03.069084	Murray	Lightman	WebsiteLogin	430295
50	rbrown@mail.usciences.edu	$2a$10$SZ4OYnCvv4fsCbkA/hPUPejW1oXN1JepWLPtouq8O.0EXkM8Yh/Si	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 22:09:34.552405	2014-05-27 22:09:34.552405	Ronald William	Brown	WebsiteLogin	430058
51	ggrumet@gmail.com	$2a$10$osZHVq.2j6DiBsRu6nyH4OGG8Kd886l/NzxR6kmFKJQV1lP735Ojm	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 22:10:53.541152	2014-05-27 22:10:53.541152	George	Grumet	WebsiteLogin	430202
52	sayoubpharmd@msn.com	$2a$10$JlSsbCOGsOCqCXFiMjLWSOxO4atUDeMpnrILGmvK4I0ozqPVMc2HW	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 22:58:44.902534	2014-05-27 22:58:44.902534	Samy	Ayoub	WebsiteLogin	430005
53	bon556@aol.com	$2a$10$Mq5IMh0c9Ij8XidYeFAUtuVeBMtcVYKaIK2gkKo07KszyC3QPrVW2	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 23:02:19.618154	2014-05-27 23:02:19.618154	Bonni	Holz	WebsiteLogin	430227
54	dephy_abra@yahoo.com	$2a$10$/TkuXRtWsiz3JIHroUIzveiAVcFwOIXEXMLcWEBc.y.SoKthTJlH2	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 23:09:00.431259	2014-05-27 23:09:00.431259	Defi	Hemanieva Abrasheva	WebsiteLogin	430219
55	kutsop6@aol.com	$2a$10$rHWxg22hwZFCvOIFhTPgcubAdBQhCCoJ9iOjwXN.cwv6gLsBpVA4C	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 23:12:37.338328	2014-05-27 23:12:37.338328	Joseph	Kutsop	WebsiteLogin	430280
59	margarxita@me.com	$2a$10$Cir4mM0tUXYzdSbvtwg7XeAteOs.kjJZel7gyR/oVeX6B2wk93pMq	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 23:51:42.270071	2014-05-27 23:51:42.270071	Margarita	Kotsogiannis	WebsiteLogin	430270
60	bellrx@verizon.net	$2a$10$xrwsvKSUdUeKHd3gTVt4weUSigbS23m/FOHC6Z4EN.dqPZ/bXVw8K	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 23:56:37.80327	2014-05-27 23:56:37.80327	Maribel	DiPrimo	WebsiteLogin	430130
63	ppuleo@comcast.net	$2a$10$WnawMsGRMS5nW0bwtQQQsunvi7xvf2gelBLj0q6f9RaQpxxbDUMey	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 00:08:55.616009	2014-05-28 00:08:55.616009	Peter	Puleo	WebsiteLogin	430412
64	kocsardy@comcast.net	$2a$10$h6Y.5Yk6i0NzWqwTrvvhC.5lLdfPnhjqMHx.nCgdV5wdbQ.ibiuaS	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 00:32:37.978614	2014-05-28 00:32:37.978614	Robert	Kocsardy	WebsiteLogin	430265
69	timnguyenpharmd@gmail.com	$2a$10$JqlPg8eCfiKaxF5S/NHAruPICtDsyOIRbmpN7lz09PDYUDDPNW.Wm	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 01:28:11.435402	2014-05-28 01:28:11.435402	Timothy	Nguyen	WebsiteLogin	430360
73	lbatastini19@comcast.net	$2a$10$YyNbZ.hp69z3kAMvn8FSz.fU7HxKuEUws0MbsQO38ecdZiQ8M.yC2	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 01:58:08.800414	2014-05-28 01:58:08.800414	Lisa	Batastini	WebsiteLogin	430018
79	zok386@aol.com	$2a$10$yI5ys0EfnjWhkSb.Am4NGO0CwoVP2oETMR8HFXJXLuVcSsNsfmaVG	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 04:05:20.23242	2014-05-28 04:05:20.23242	Richard	Kozlowski	WebsiteLogin	430273
81	rnprph@aol.com	$2a$10$s33pKiHt5CCcjJXccFyUPOk8EZxNRhlnn3QIPPf7bV8oolng0dMWm	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 04:24:35.821674	2014-05-28 04:24:35.821674	Robert	Picca	WebsiteLogin	430401
82	jennysklar@gmail.com	$2a$10$QYZUq9jyESw6SZlXaxhh4uNuxL.1GM0mph9lPcXVyyX7xX3ovNFji	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 04:26:29.522901	2014-05-28 04:26:29.522901	Jennifer	Sklar Papile	WebsiteLogin	430471
83	bd_consulting@hotmail.com	$2a$10$MnQP5A3fRbyZ1N/KgSWYZ.3bYup8IZ2VawttWjnec8WY0DMeWvhpC	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 07:44:41.383052	2014-05-28 07:44:41.383052	Loretta	Brickman	WebsiteLogin	430051
56	ajc60@verizon.net	$2a$10$oxqp0bcd38D6T6jVc2qVc.ZQetHpDWHyfpmW7IKHWkfmIp/CZ.35y	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 23:18:58.748089	2014-05-27 23:18:58.748089	Angelo	Cifaldi	WebsiteLogin	430092
57	herbfleishman@yahoo.com	$2a$10$h9L/tW/ssvxuTXvzsn5IM.fCowMC0otbn4aZ4Cya0YzeypyE/g1iS	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 23:36:09.05227	2014-05-27 23:36:09.05227	Herbert	Fleishman	WebsiteLogin	430171
58	ph1912@aol.com	$2a$10$HTPhGBFq2dZFPo.pLUa5Lu.P3vT8EIXc5JJ52DXq6zl/.0ujnjpYO	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 23:46:58.216322	2014-05-27 23:46:58.216322	Carol	Arena	WebsiteLogin	429996
61	a1patel@aol.com	$2a$10$mbZ8vSO/dvK0jafX4hWjROEvh8YXX.8gqZ8cFsLypADC1zY/4igaa	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 23:56:54.928614	2014-05-27 23:56:54.928614	Ashita	Patel	WebsiteLogin	430378
62	barbieandkenk@aol.com	$2a$10$5BYlym4svgsnNLhkYvXsuO99JOXZW3bA11KlKlNgZewBu7Ti64Dja	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 00:04:59.830145	2014-05-28 00:04:59.830145	Kenneth	Kanoff	WebsiteLogin	430247
65	jwcampion1@yahoo.com	$2a$10$tU92GT.tx4K.iG1NkX4nmOYOV/aNBxOIfuiyNk.FS2zeAj0cezWJm	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 00:49:20.898541	2014-05-28 00:49:20.898541	Julie	Campion	WebsiteLogin	430068
66	aldeni3@msn.com	$2a$10$U.EzjPFc55qFVuRL4CN7cOaeNhImonDkr3/fEZvus7xCHyHq6S0eC	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 01:08:07.384204	2014-05-28 01:08:07.384204	Lina	Feliciano	WebsiteLogin	430162
67	salperitore@hotmail.com	$2a$10$SUqS8y2EQmDCn.5PvXbcx.wIsmg3X3kmiKe9ESGswY4nVJ9ZStrwi	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 01:12:29.161061	2014-05-28 01:12:29.161061	Salvatore	Peritore	WebsiteLogin	430397
68	howierx74@gmail.com	$2a$10$.R6VUwG4iSMx1oPr6ySnUOiY9T147nGyZq9mJeY/H2CR23E0P2L2G	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 01:17:55.342374	2014-05-28 01:17:55.342374	Howard	Linwood	WebsiteLogin	430297
70	atararlock@gmail.com	$2a$10$/DX4jlixY//xtQoi84At6.GYunbytAPBGL1mugw.YugS1xzLpIMyC	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 01:29:16.524467	2014-05-28 01:29:16.524467	Atara	Degani	WebsiteLogin	430123
71	punitakhara@yahoo.com	$2a$10$D4qUbvU9482UqQO39.X34OONWjY/md6aidttX/aLVqprlXkSTbpO.	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 01:34:02.564776	2014-05-28 01:34:02.564776	Punita	Khara	WebsiteLogin	430256
72	marv402@comcast.net	$2a$10$rTubSBOY/4iMPwBH8Rd.COtzDqv4l1nIpy6yUsL7lNaAu22eqUjHe	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 01:36:39.982278	2014-05-28 01:36:39.982278	Marvin	Wainwright Jr	WebsiteLogin	430513
74	seifertphcy@aol.com	$2a$10$Xnr1hCiRrrhisk1prFTpo.39r5VjIwpuWzUv01/IFV1d6XSHLuVgO	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 02:08:39.662258	2014-05-28 02:08:39.662258	Nicholas	Picca	WebsiteLogin	430400
75	kma904@verizon.net	$2a$10$0qg3hExRXgW1lqYnF14ME.kJVOLs3WSEirvPYT7Vq75.WXf3PMvfG	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 02:10:48.398142	2014-05-28 02:10:48.398142	Edward	Rucki	WebsiteLogin	430430
76	renatakralj@comcast.net	$2a$10$UFdJt.t4ha0iLUMO56FFYepfeAbv78LBedg8Qr.qBuioi41sYk//S	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 02:20:53.19966	2014-05-28 02:20:53.19966	Renata	Kralj	WebsiteLogin	430274
77	morningstar1029@yahoo.com	$2a$10$uqONSHrSRUwG6MrMBHpzhOrN6B1gsAf6iTyTtV6wEl20a5mQyK34a	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 02:38:12.000917	2014-05-28 02:38:12.000917	Marjorie	Thompson	WebsiteLogin	430500
78	cohenea@comcast.net	$2a$10$DgRSbZwS5eBhOnlKS4rocOvOKzRWNqVus0BCRnIh5EoqLR92Yl.zq	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 03:19:11.673758	2014-05-28 03:19:11.673758	Arlette	Cohen	WebsiteLogin	430095
80	stevenda36@aol.com	$2a$10$Wy7hiXHe.wublrly0n2lx.UMM.MSiKrpPpG.hUkpR0pOSJ.dBk.eO	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 04:16:30.547754	2014-05-28 04:16:30.547754	Steven	Davis	WebsiteLogin	430120
84	onekst@aol.com	$2a$10$h0K3m4EJYZhCDqc6hgfeSepjX5Nz6VorhecbtJqgjFpYzHqUiu5fG	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 08:43:15.22243	2014-05-28 08:43:15.22243	Kathy	Turner-Mathis	WebsiteLogin	430504
85	golfpurit@earthlink.net	$2a$10$1DIcsFUu6ydWA3urbFDkI.gzMekVMpQgJjCXQlh2ZAiQPhxxaVSWK	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 10:15:05.073764	2014-05-28 10:15:05.073764	Chris	Puri	WebsiteLogin	430413
86	cjnrph@hotmail.com	$2a$10$l.2QAZRf2t5etT4XHNtcX.wMKU.W2QpsU6O6MyWvz4n71djASg/cu	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 12:03:13.35497	2014-05-28 12:03:13.35497	Carmen	Nocito	WebsiteLogin	430364
87	pharmacyqueen1@aol.com	$2a$10$H81CoLiV9K7L2Sm5ouo5LOA7iAHZsvfq176P.eSwy6aXn2q2EpOnO	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 12:28:21.901748	2014-05-28 12:28:21.901748	Georgette	Hunt	WebsiteLogin	430230
88	ljjpharmd@hotmail.com	$2a$10$HCRInE4NEUoD20W2fuXdIug2VnzgC20HWqakuW0M3bvE4jU9VAbTS	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 12:50:49.971146	2014-05-28 12:50:49.971146	Lynne	Spiegel	WebsiteLogin	430477
89	john.colaizzi@walgreens.com	$2a$10$l45oSbWErENL62i4OxEZV.LtGxVU5Pu0LkztMjJ4yIx1x.1rrJKbS	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 13:12:13.551256	2014-05-28 13:12:13.551256	John	Colaizzi, Jr.	WebsiteLogin	430099
90	ajaybarthwal@hotmail.com	$2a$10$yxW3WqLwE0ErhONGQJOKreiTEzlZGKOm9QcSTqj9MSX9O5pk4ZJda	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 13:15:41.373944	2014-05-28 13:15:41.373944	Ajay	Barthwal	WebsiteLogin	430017
92	lmalmberg@wedgewoodpharmacy.com	$2a$10$lqP4SoN5dtDiqAkHryi6O.JPmXVj7eLky.8rGzHY8NIF/jmole.Eq	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 13:41:23.597318	2014-05-28 13:41:23.597318	Ludmilla	Malmberg	WebsiteLogin	430318
93	rxlucky@comcast.net	$2a$10$fbdUj7XSoUDiB1f/jYib3.SNJbgtgYN.YOF64xXsF77iWT4p01.em	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 13:42:04.969024	2014-05-28 13:42:04.969024	Matthew	Luckman	WebsiteLogin	430312
94	mariarph@hotmail.com	$2a$10$XwtqGxeJWoOiZc/X9oPu1.v.jcP5aJVV2aESlsu64OzyfKfPhYGdG	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 13:47:27.994779	2014-05-28 13:47:27.994779	Maria	Narcisco-Deutsch	WebsiteLogin	430357
95	acarrr@comcast.net	$2a$10$8ZWMnTiZTaD70MxJlIpHA.WujogYOHcbk7xzAfqwZujCKfZUkJaf6	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 13:58:00.083088	2014-05-28 13:58:00.083088	Anthony	Carrier	WebsiteLogin	430071
97	mary.barna@gmail.com	$2a$10$4v5/0ibTmNvp.HF8.pAz..OPkBU4H4AX8g6CYl7ioBNFtZcWuVlSa	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 17:04:25.823267	2014-05-28 17:04:25.823267	Mary	Bridgeman	WebsiteLogin	430053
98	ritajschwartz@gmail.com	$2a$10$1OomNnXqy8IcLjMkitXDiuM6rPxOx8.lYU9kQumKnAxQGtVMK31Ym	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 19:29:52.386059	2014-05-28 19:29:52.386059	Rita	Schwartz	WebsiteLogin	430444
99	jpsomas@aol.com	$2a$10$YtTxAPlBPb83CVO11V/aBuMqBtCRlh4YwlNKYZMut9byIDwnYA12i	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 21:00:34.711926	2014-05-28 21:00:34.711926	John	Psomas	WebsiteLogin	430410
100	dobbler555@aol.com	$2a$10$pXO3nEJ.ISkQJEpwkWCGeuibXXG/GZE/oFNy2vKic8Pn5MBIy5lhW	\N	\N	\N	0	\N	\N	\N	\N	2014-05-29 00:26:22.668645	2014-05-29 00:26:22.668645	Nicole	Lovullo	WebsiteLogin	430309
101	davefas@comcast.net	$2a$10$dBsNIAmiQRm4Zy5dCOhVkODHCWEb9SAbhRv8zoMZkAXMpzt9JpC9i	\N	\N	\N	0	\N	\N	\N	\N	2014-05-29 00:34:44.27341	2014-05-29 00:34:44.27341	David	Fascia	WebsiteLogin	430161
102	wjprph@aol.com	$2a$10$VkFv8E2E/mSUJiRi660jL.agZfe2FY5HzE92Kl7WuCalwne5XwD4C	\N	\N	\N	0	\N	\N	\N	\N	2014-05-29 00:56:43.196732	2014-05-29 00:56:43.196732	William	Picca	WebsiteLogin	430402
12	ebarry@njpharma.org	$2a$10$66LC6wpGzBDd5c7d.DkmYuLood2WgMrZp76bGHGYTFwy7yZWyhvfa	\N	\N	\N	0	\N	\N	\N	\N	2014-05-27 03:16:19.338945	2014-05-29 01:26:57.924022	Elise	Barry	WebsiteLogin	418542
103	polya1620@hotmail.com	$2a$10$SwHBblhOpXKqO5XTUg9w5OHaS1RNVcMYKWhxacJ1g8SCHZ40ttTKS	\N	\N	\N	0	\N	\N	\N	\N	2014-05-29 01:29:36.330138	2014-05-29 01:29:36.330138	Polina	Shmurak	WebsiteLogin	430460
104	markrx325@hotmail.com	$2a$10$keJHEENyoOChrvEx2MUMWOtEJz.LOjBgkYAmdZcbrc5N0Pk/OhUlO	\N	\N	\N	0	\N	\N	\N	\N	2014-05-29 02:24:22.20761	2014-05-29 02:24:22.20761	Mark	Levine	WebsiteLogin	430293
105	trek2300@comcast.net	$2a$10$wkf60Foy1hiLAeUYeX3SlezH26bevdv0YTsC/xzKj5UIpdhgWGmRW	\N	\N	\N	0	\N	\N	\N	\N	2014-05-29 02:33:36.473702	2014-05-29 02:33:36.473702	Steven	Gilbert	WebsiteLogin	430188
106	sangeetarajesh2000@yahoo.com	$2a$10$/Lv5oEVF05zM8VvjEn7g1efE6jjlgRdhTuVCeyCM.WdientAzLNGO	\N	\N	\N	0	\N	\N	\N	\N	2014-05-29 02:46:24.925802	2014-05-29 02:46:24.925802	Sangeeta	Iyer	WebsiteLogin	430235
107	p11egan@aol.com	$2a$10$.mpdNCF4MtqXPXBxhaCLG.i0EVvu8sv42cWloh9jPLhPLrevTLV7S	\N	\N	\N	0	\N	\N	\N	\N	2014-05-29 12:57:26.509323	2014-05-29 12:57:26.509323	Patricia	Egan	WebsiteLogin	430148
108	ksingletary@njpharma.org	$2a$10$OGv/qRBDxB4/CvwSupI0C.aogL.vEPIYOGeK96/CkbCEK.cCauYxe	\N	\N	\N	0	\N	\N	\N	\N	2014-05-29 13:20:22.423957	2014-05-29 13:20:22.423957	Karen	Singletary	WebsiteLogin	430468
109	herbselig@msn.com	$2a$10$v6B.L4tbJX7fSa5jgh2dmeNfeHO2nse32Spe6/K8NALD2D4HKegc2	\N	\N	\N	0	\N	\N	\N	\N	2014-05-29 13:25:44.228925	2014-05-29 13:25:44.228925	Herbert	Seligman	WebsiteLogin	430450
110	jhartley203@yahoo.com	$2a$10$sAPCZ2SS.KgYGL7Hlcdk0ew95mEytK92qbZtNY9sOfi4tQmRzo6ne	\N	\N	\N	0	\N	\N	\N	\N	2014-05-29 13:31:33.634574	2014-05-29 13:31:33.634574	John	Hartley	WebsiteLogin	430215
111	antrph@verizon.net	$2a$10$VzxjODyyohMroy0hwPGfseyQDrLefprNCMEjfx7wJQXjTsUD2DOeK	\N	\N	\N	0	\N	\N	\N	\N	2014-05-29 13:40:31.236937	2014-05-29 13:40:31.236937	Anthony	Armenti	WebsiteLogin	429997
112	bennyboy3@aol.com	$2a$10$sAcYUtlXUVYf62SfH6RbvuoXVYGikhtYHqTxrgVaW/wW7p4ECNcgK	\N	\N	\N	0	\N	\N	\N	\N	2014-05-29 13:42:35.387261	2014-05-29 13:42:35.387261	Benjamin	Kalemba	WebsiteLogin	430244
114	mkoval820@gmail.com	$2a$10$LwItZY5XeXl3OH5OHYspz..yYypuoF2qRiNAI6RS11PIqUIQphNp2	\N	\N	\N	0	\N	\N	\N	\N	2014-05-29 14:22:15.316023	2014-05-29 14:22:15.316023	Michael	Koval	WebsiteLogin	430271
115	bobm@asrc2.org	$2a$10$NvXbmwK/oApLyV98OXhdNuskVNbF3QWw4jRWpU9.3Sr1SwjE7vXjS	\N	\N	\N	0	\N	\N	\N	\N	2014-05-29 14:32:09.49771	2014-05-29 14:32:09.49771	Robert	Mayer	WebsiteLogin	430326
117	cpedersens@yahoo.com	$2a$10$Qal/SaQnBSKZVYG.7G1r0OUWY1ZbPy12yPW19789rGtYVRtU/km72	\N	\N	\N	0	\N	\N	\N	\N	2014-05-29 20:01:48.291549	2014-05-29 20:01:48.291549	Catherine	Pedersen	WebsiteLogin	430394
121	flojo8528@aol.com	$2a$10$ez.1sFypMjMPdaVGeUtcy.FwBSU3iSpSMMPe6u6qHvLrmuBNjslES	L3xpLxx4JN2VNR84mJNJ	\N	\N	2	2014-12-25 23:57:46.366748	2014-12-25 23:57:14.471561	69.127.232.193	69.127.232.193	2014-06-04 10:52:09.177997	2014-12-25 23:57:46.966755	Florence	Ojo	WebsiteLogin	430610
113	njaco47@aol.com	$2a$10$V6lsMDPobbX9TaFqky4NwOlTAC42GOb.f9jpkc25Ywpd.W2NvhX7C	\N	\N	\N	0	\N	\N	\N	\N	2014-05-29 13:45:01.605153	2014-05-29 13:45:01.605153	Nancy	Jacoby	WebsiteLogin	430237
116	tczip@comcast.net	$2a$10$2ptD4A2SCh7sUMJyi9cL8OOzUwqEx3rwj.wAEEVdBQOpilRujJVwK	\N	\N	\N	0	\N	\N	\N	\N	2014-05-29 15:38:50.119111	2014-05-29 15:38:50.119111	Thomas	Caruso	WebsiteLogin	430074
144	sheridanjk@msn.com	$2a$10$td04OT8IDfT7CvwoKDKWEeNgi7yaP4u.kOpsrKG9po0i7Y7DMz1WG	\N	\N	\N	0	\N	\N	\N	\N	2014-06-16 22:40:32.924259	2014-06-16 22:40:32.924259	John	Sheridan	WebsiteLogin	430457
145	james.f.ward@walgreens.com	$2a$10$HcH/7DA587At0kO57C6UOOMCoD7cNpbRe36U/hQD5Yj3PMAmuhume	\N	\N	\N	0	\N	\N	\N	\N	2014-06-16 23:23:27.052818	2014-06-16 23:23:27.052818	James	Ward	WebsiteLogin	430516
96	alan@impdigital.us	$2a$10$Qjydd8iAmOO3X3ZLAiApvO/BIRtxUtp8hXWxVopwTrR4KKRpuSg7i	\N	\N	\N	0	\N	\N	\N	\N	2014-05-28 16:44:29.674053	2014-05-30 15:30:59.650099	Alan	Gerstein	WebsiteLogin	430187
146	robin.y.schwartz@gmail.com	$2a$10$R2.iCEDZGWcCxcLD7sW/y.Z86iuXdhKE3f7dSuhVdxAumTsfmIhJG	\N	\N	\N	0	\N	\N	\N	\N	2014-06-16 23:30:52.917787	2014-06-16 23:30:52.917787	Robin	Schwartz	WebsiteLogin	430446
126	jbib@aol.com	$2a$10$Er1MindBPY4EjW/6/w1Kg.lyk/QKbIQhLd8rt4m6Iq7ZoxUBdnMoK	\N	\N	\N	0	\N	\N	\N	\N	2014-06-12 21:35:19.418687	2014-06-12 21:35:19.418687	James	Beatty	WebsiteLogin	430023
147	rmayerjr@embarqmail.com	$2a$10$RGOJimDsVmNbfztel.dR.OTpVkQTCcRPShY2efNkMdu3FzIRDeAiC	\N	\N	\N	0	\N	\N	\N	\N	2014-06-16 23:31:43.880321	2014-06-16 23:31:43.880321	Robert	Mayer	WebsiteLogin	430325
148	maab313@yahoo.com	$2a$10$Hjv4dUglvODXAIEW0.NspedlCX7Qlp6E3RbmHH.a..gVEiaSxOp/6	\N	\N	\N	0	\N	\N	\N	\N	2014-06-16 23:32:51.936086	2014-06-16 23:32:51.936086	Marc	Beard	WebsiteLogin	430022
149	stevecsubak@yahoo.com	$2a$10$hwJJz2kOl0sMl/AlW5Czf.ChGaFdbiKpmLnbnsnnL69bI/1sWwYkS	\N	\N	\N	0	\N	\N	\N	\N	2014-06-16 23:36:40.806434	2014-06-16 23:36:40.806434	Stephen	Csubak	WebsiteLogin	430111
150	lshehwen@gmail.com	$2a$10$BhnyYyTbmmaooltEjx0sk.nM/JZjuO7pjroMGt4SmM9kVLlyxPkjO	\N	\N	\N	0	\N	\N	\N	\N	2014-06-16 23:48:27.187857	2014-06-16 23:48:27.187857	Lindsay	Haimowitz	WebsiteLogin	430208
151	rxru95@yahoo.com	$2a$10$/04q4ymIEpS4WfagvmiXwu7W278AiorB90k4VlN3Px6WEuxHThhUO	\N	\N	\N	0	\N	\N	\N	\N	2014-06-16 23:54:12.737295	2014-06-16 23:54:12.737295	Carrie	Corboy	WebsiteLogin	430108
152	pep157@optonline.net	$2a$10$ksFiBb9G6yH1hcOVILHjZu7OA9zQgsc8rAgp.ey8iuocdoFkEf3yy	\N	\N	\N	0	\N	\N	\N	\N	2014-06-17 00:08:43.812439	2014-06-17 00:08:43.812439	Priscilla	Bath	WebsiteLogin	430020
127	moemyat@pharmacy.isu.edu	$2a$10$zuxLDxkcsfs2/9zWVkK52ucIxhzF2gDTNZTNHjeVtH6fnfomZHMzW	\N	\N	\N	0	\N	\N	\N	\N	2014-06-16 18:31:34.034151	2014-06-16 18:31:34.034151	Ma Myat Myat	Moe	WebsiteLogin	432635
128	mbliss@wedgewoodpharmacy.com	$2a$10$ZOvIPba/apQWykpSgAAUeuYPfy3S4vFh6uMlRFDgjw0VRfck7smDO	\N	\N	\N	0	\N	\N	\N	\N	2014-06-16 19:22:34.250396	2014-06-16 19:22:34.250396	Marcy	Bliss	WebsiteLogin	430038
129	sat820@aol.com	$2a$10$d77pZ3VYmhSZssxH/bKtJ.NgmgJK2HXN/WQra7DdfA0aoIMxwMTpa	\N	\N	\N	0	\N	\N	\N	\N	2014-06-16 19:30:21.756035	2014-06-16 19:30:21.756035	Sandra	Tarallo	WebsiteLogin	430493
130	arendabaghian@gmail.com	$2a$10$EXPHJqNZtKvuhs4pyn.51.abqh4Hr.AdfcdhEH.jSv4OcLpmxP5am	\N	\N	\N	0	\N	\N	\N	\N	2014-06-16 19:40:01.690064	2014-06-16 19:40:01.690064	Aren	Dabaghian	WebsiteLogin	431391
131	angel.fowlertaylor@novartis.com	$2a$10$rKbxMHyxviBDJFRlr48Dn.oYmBIZwgJOzJvt9JxRUZEXMB9JWPkfK	\N	\N	\N	0	\N	\N	\N	\N	2014-06-16 19:40:41.622956	2014-06-16 19:40:41.622956	Angel	Fowler Taylor	WebsiteLogin	430174
118	smilroy@optonline.net	$2a$10$alCv8WLebwMd8mpYgIJfo.z3tsDXM58JhalnrP6tGzQMG.2kjFXYi	\N	\N	\N	0	\N	\N	\N	\N	2014-06-01 00:15:21.87851	2014-06-01 00:15:21.87851	Scott	Mylroie	WebsiteLogin	430355
119	haroldbobrowrp@gmail.com	$2a$10$GC8HcgoK2J3QD/zxaecTkufLjwos0IemyiW5ZPtVZfR2a6A/WxDCC	\N	\N	\N	0	\N	\N	\N	\N	2014-06-01 16:12:15.654549	2014-06-01 16:12:15.654549	Harold	Bobrow	WebsiteLogin	430043
120	domenic.diprimo@walgreens.com	$2a$10$XirPHmp4mmBJzID52gSwGuirNzfcOCqXH3QbLqlxlwUNSPTqLafwO	\N	\N	\N	0	\N	\N	\N	\N	2014-06-02 18:37:45.99845	2014-06-02 18:37:45.99845	Domenic	Diprimo	WebsiteLogin	430129
132	john.colaizzi@pharmacy.rutgers.edu	$2a$10$SrnvweC9chYRcB8rltA.h.ZnruUtRVE6DLAsEFUt01Y5fnKfDX8H6	\N	\N	\N	0	\N	\N	\N	\N	2014-06-16 19:49:07.171052	2014-06-16 19:49:07.171052	John	Colaizzi  Sr.	WebsiteLogin	430098
122	johnpower1@comcast.net	$2a$10$vWU6Jivb3wQm1XNWuR4k/.YRlz7/o.LXl5f7ZY8nNmq1o/I3/2E/C	\N	\N	\N	0	\N	\N	\N	\N	2014-06-05 14:58:31.919479	2014-06-05 14:58:31.919479	John	Power	WebsiteLogin	430409
123	ischwartzrx@yahoo.com	$2a$10$sRyidWpqhs2z/89yJrKr6..d54C6LvqPuBToIFzNSoyMp/VsCuBFW	\N	\N	\N	0	\N	\N	\N	\N	2014-06-05 16:02:00.944501	2014-06-05 16:02:00.944501	Irwin	Schwartz	WebsiteLogin	430443
124	dtbsunday@gmail.com	$2a$10$bW9l0WBn9nEOv6kPKFqVye2hhIKU7U2QVBpM4vV9v8s7s6hVlsYoe	\N	\N	\N	0	\N	\N	\N	\N	2014-06-05 23:32:35.248372	2014-06-05 23:32:35.248372	Domenica	Trombetta	WebsiteLogin	430502
125	robertm387@aol.com	$2a$10$H6TmWIRTJ3z8wRhXHwPX/OlcUtKkAQZQ5aRJMIan0mQ.gIGK2aooy	\N	\N	\N	0	\N	\N	\N	\N	2014-06-07 21:07:38.249643	2014-06-07 21:07:38.249643	Robert	McNulty	WebsiteLogin	430332
133	rbrown@atlasflasher.com	$2a$10$7liNwmOGNTtXW1eTSbeyG.r6SDvTUi3fuEVzJcX6QhqlrtFMn1Zmq	\N	\N	\N	0	\N	\N	\N	\N	2014-06-16 19:54:03.39153	2014-06-16 19:54:03.39153	Ryan	Brown	WebsiteLogin	430059
134	mb12262@yahoo.com	$2a$10$.ZwzYvQ4iCX5BXC38hTNpuDmNBa2AnkzTmg6VvGXf006WV4pKj84.	\N	\N	\N	0	\N	\N	\N	\N	2014-06-16 19:59:11.670911	2014-06-16 19:59:11.670911	Marianne	Bious	WebsiteLogin	430035
153	ramar040@optonline.net	$2a$10$D9/2NzxptHmOD2i5mHIFA.vGhgyQMaf6eJqItnlIwJEkHsNy7fO/u	\N	\N	\N	0	\N	\N	\N	\N	2014-06-17 00:23:16.559139	2014-06-17 00:23:16.559139	Ruth	Marietta	WebsiteLogin	430320
142	dimplicity@yahoo.com	$2a$10$Q3YD0ISzju03m.LookLrS.w7YZXWl9VGmu6FvzGNImkzJfbx7b.qm	\N	\N	\N	0	\N	\N	\N	\N	2014-06-16 21:53:18.451905	2014-07-17 01:12:47.617479	Dimple	Shah Steeber	WebsiteLogin	430451
135	katiedonghii@gmail.com	$2a$10$JQlO5BA7pxq3xt0QhChHDuI5lOyxJpym1eoeN/KPUWpSS9cR9Qkoy	\N	\N	\N	0	\N	\N	\N	\N	2014-06-16 20:23:03.71246	2014-06-16 20:23:03.71246	Katie	Kim	WebsiteLogin	430260
136	rms318@verizon.net	$2a$10$CRftq6IW6IG5hkjKKmk9IeAVBNX4SRBj29iV2sQQNNySkOfRK33uu	\N	\N	\N	0	\N	\N	\N	\N	2014-06-16 20:49:52.198458	2014-06-16 20:49:52.198458	Richard	Shalhoub	WebsiteLogin	430455
137	krags1@aol.com	$2a$10$qd8bBST/W9H7DFAYKiZhX.Y2iqX55BKT3PmXyvZ/SMeGz/rYLsfLu	\N	\N	\N	0	\N	\N	\N	\N	2014-06-16 20:57:52.579026	2014-06-16 20:57:52.579026	Ronald	Kubacki	WebsiteLogin	430278
138	jkrupa@shire.com	$2a$10$dKhBafBN9t4Y9s9i/EOgfuGl2ZNzoYO27QsSUomKsu0OkgOi6WTLu	\N	\N	\N	0	\N	\N	\N	\N	2014-06-16 20:58:47.290023	2014-06-16 20:58:47.290023	James	Krupa	WebsiteLogin	430277
139	jakecohen@aol.com	$2a$10$LoaacF44fqijhmxsVOmzbe.JTxi3wgsORxE.hI1PTAyMz20.h2ICm	\N	\N	\N	0	\N	\N	\N	\N	2014-06-16 21:10:04.808945	2014-06-16 21:10:04.808945	Jacob	Cohen	WebsiteLogin	430096
140	denise@haworthapothecary.com	$2a$10$GWAnkR1BpUBWRlGRlOOaK.ppwudhMyKg0br.Y0UmVCgpj/12zB.Za	\N	\N	\N	0	\N	\N	\N	\N	2014-06-16 21:41:54.259467	2014-06-16 21:41:54.259467	Denise	Hayes	WebsiteLogin	430216
154	bobandbobbi@comcast.net	$2a$10$EcRJg2.VZf3Hqx9cltAp.ukrI5AFgR0OQhqsX7QdN43115uxFxTTe	\N	\N	\N	0	\N	\N	\N	\N	2014-06-17 00:31:30.69488	2014-06-17 00:31:30.69488	Robert	Fusco	WebsiteLogin	430178
141	paarth999@aol.com	$2a$10$fjRMBjBxMtneDkgW8r9Ese.Lx9i.DMG/YvfF0Gy1wkNWUxwsczm6a	\N	\N	\N	0	\N	\N	\N	\N	2014-06-16 21:45:50.120034	2014-06-16 21:45:50.120034	Sachin	Shah	WebsiteLogin	430453
143	nicole.daniel0189@gmail.com	$2a$10$Igwmo1ajYQoDoj9s1tJyQe7DOAslODGVHcpH31AQhEJoM83Z7kHci	\N	\N	\N	0	\N	\N	\N	\N	2014-06-16 21:58:48.161986	2014-06-16 21:58:48.161986	Nicole	Daniel	WebsiteLogin	430117
155	jwchin53@gmail.com	$2a$10$e4Lpv4lvqtSSjLFdT.5xAOpoU0COmLIrH2/EHylJlXyOXRxkjcUFa	\N	\N	\N	0	\N	\N	\N	\N	2014-06-17 00:38:55.299899	2014-06-17 00:38:55.299899	John	Chin	WebsiteLogin	430086
156	rxsuziq@gmail.com	$2a$10$l6EvW2NrIGlYyH5gsJmeVOpGXY404Hd0zqHHEQEhhlUxnBvZzc2mm	\N	\N	\N	0	\N	\N	\N	\N	2014-06-17 01:13:58.447925	2014-06-17 01:13:58.447925	Suzanne	Young	WebsiteLogin	430534
157	koh_rp@hotmail.com	$2a$10$Y9AHgz.p15QUCewWZayuzuEVQSs.2kDisnuBdYWfo9ilxsQfXKUfK	\N	\N	\N	0	\N	\N	\N	\N	2014-06-17 01:30:35.027296	2014-06-17 01:30:35.027296	Kenneth	Hodge	WebsiteLogin	430225
158	ullfindkb@rediffmail.com	$2a$10$SaR7z14aVKs.Z/cxWWbX8ejP5O5EYGgyEtCQ8uvFJ4YHgVgFQvY9O	\N	\N	\N	0	\N	\N	\N	\N	2014-06-17 01:46:27.539439	2014-06-17 01:46:27.539439	Ketankumar	Patel	WebsiteLogin	430379
159	a.grover@usciences.edu	$2a$10$rIXGt9VOvhBk7SNi.OngNuT8cnm8RR7lttaSJT3rHl7eG6xb/U0SK	\N	\N	\N	0	\N	\N	\N	\N	2014-06-17 02:00:56.590881	2014-06-17 02:00:56.590881	Anisha	Grover	WebsiteLogin	430201
161	nidhijain07@gmail.com	$2a$10$dtRBJxtnQkLZ1HRB/DZIveZe0IDnlUogqjUrCzlmEC/8gwgmdmyZS	\N	\N	\N	0	\N	\N	\N	\N	2014-06-17 02:39:38.025141	2014-06-17 02:39:38.025141	Nidhi	Jain	WebsiteLogin	430239
160	philscripts2001@aol.com	$2a$10$fAQYl2ckWwdNHxn4TCzrkeRefxtkIAwG0hAZbwoxnKdOmzsrhHlHm	\N	\N	\N	0	\N	\N	\N	\N	2014-06-17 02:12:48.021261	2014-06-17 02:12:48.021261	Michael	Barnett	WebsiteLogin	430014
162	lhlipman@optonline.net	$2a$10$JdH8f0C5cIufhhXQBcJijOp/cYtvaGXpaNnegVLHxRDN850sPUbTu	\N	\N	\N	0	\N	\N	\N	\N	2014-06-17 04:20:24.554247	2014-06-17 04:20:24.554247	Leonard	Lipman	WebsiteLogin	430298
163	dandi1988@verizon.net	$2a$10$n5t6/gbBSlsphYfuH/ngTeOq5PXJiIFPNOcY3Ple90VCL8m50zHC2	\N	\N	\N	0	\N	\N	\N	\N	2014-06-17 10:46:12.967171	2014-06-17 10:46:12.967171	David	Secouler	WebsiteLogin	430447
164	ccpconsu@aol.com	$2a$10$zcuHxEKwVaZv6qGdVg7kdu6PR5/SQqT6jhoND8VC0Mj/OKToqK57G	\N	\N	\N	0	\N	\N	\N	\N	2014-06-17 13:25:16.760572	2014-06-17 13:25:16.760572	Steven	Zlotnick	WebsiteLogin	430541
165	jwalkerrph@comcast.net	$2a$10$/IgibbXDw5KrE9XszSSBC.8Ib7GBoZwYRpXNj4IKCMSSm15ZtyvQS	\N	\N	\N	0	\N	\N	\N	\N	2014-06-17 14:36:10.402634	2014-06-17 14:36:10.402634	Janice	Walker	WebsiteLogin	430514
166	alanarno@aol.com	$2a$10$yw/nu1QBV7HVR289tGQftuQjLKH24l1f1BY4KwSCAP3FPIea1tgx.	\N	\N	\N	0	\N	\N	\N	\N	2014-06-17 16:48:11.731149	2014-06-17 16:48:11.731149	Alan	Arnowitz	WebsiteLogin	429998
167	anmarypk@yahoo.com	$2a$10$J01a4CXgATqHfJubDMo4gedQ5C/6yHuB5yXkR1uKSoQL2fZD2.MkS	\N	\N	\N	0	\N	\N	\N	\N	2014-06-17 19:26:42.286036	2014-06-17 19:26:42.286036	Annmary	Paul	WebsiteLogin	430390
168	billchamberlin@verizon.net	$2a$10$G4B3jozEwKoQfLo.NMQhTOOk0SzvqHMyVGUKMmr.XN1G29N4m2P/G	\N	\N	\N	0	\N	\N	\N	\N	2014-06-17 19:40:27.005574	2014-06-17 19:40:27.005574	William	Chamberlin	WebsiteLogin	430080
169	jfora53@yahoo.com	$2a$10$E1bJpYXR16U0qe8uvMSRneUE7W8z.SpGWCqSZP7CxzglFp136FkQe	\N	\N	\N	0	\N	\N	\N	\N	2014-06-17 19:56:18.895978	2014-06-17 19:56:18.895978	Jeffrey	Forrer	WebsiteLogin	430173
170	neelie537@aol.com	$2a$10$Nz591NErDTfStzsybTEoseI/oxEGQAAqzqlL28U.4yGHWPHYTmfn2	\N	\N	\N	0	\N	\N	\N	\N	2014-06-17 20:06:42.679955	2014-06-17 20:06:42.679955	Eileen	Fishman	WebsiteLogin	430169
171	azimnes@aol.com	$2a$10$bhSigZXlnAsrqAUsys554eLF3oVJtw5G4jDaQlwXwg9U8MMRsLbcq	\N	\N	\N	0	\N	\N	\N	\N	2014-06-17 20:45:31.500226	2014-06-17 20:45:31.500226	Constantine	Zimnes	WebsiteLogin	430539
172	jon.k.barlow@gmail.com	$2a$10$dklfQ3m35nNqQujDGA6JB.bzyK738ba5Mnxe2r1nFbOIMIZVH6Lqa	\N	\N	\N	0	\N	\N	\N	\N	2014-06-17 23:59:08.865936	2014-06-17 23:59:08.865936	Jonathan	Barlow	WebsiteLogin	430013
173	lolofigueroa@hotmail.com	$2a$10$Hvle2N6PpvpurYdMyXT/Tew0jfqXyRoTbgAVKhpq0/zCGHKpN2o8y	\N	\N	\N	0	\N	\N	\N	\N	2014-06-18 02:58:23.420752	2014-06-18 02:58:23.420752	Teodoro	Figueroa Santa Cruz	WebsiteLogin	430165
174	rlspiv@aol.com	$2a$10$aq2t2WbPEj5kYKlpqG3EbuHztmYi2rC0nanrNw/zoULBR4UlP2CXW	\N	\N	\N	0	\N	\N	\N	\N	2014-06-18 03:35:31.763012	2014-06-18 03:35:31.763012	Robert	Spivack	WebsiteLogin	430479
175	kcls1@aol.com	$2a$10$IE2Yx01UQcXdOFjtzLlKj.HkWs7Pr2ISPSNPUhPV2N4STl2ubuuaK	\N	\N	\N	0	\N	\N	\N	\N	2014-06-18 11:04:20.847267	2014-06-18 11:04:20.847267	Katherine	Suskevich	WebsiteLogin	430486
176	cait.e.mcca@gmail.com	$2a$10$KwPJkvzRhLiAhnf.GRE0XuH9MAgPjDIhQORz3vyHMnZv/Cpn4Heqi	\N	\N	\N	0	\N	\N	\N	\N	2014-06-18 14:21:05.034192	2014-06-18 14:21:05.034192	Caitlin	McCarthy	WebsiteLogin	435127
177	rxbill@optonline.net	$2a$10$NUU9CCodfkyvwcJTipYur.mv8/fAXdPpqtVHZ7yxmpFFlRftJ01cG	\N	\N	\N	0	\N	\N	\N	\N	2014-06-18 16:38:52.725532	2014-06-18 16:38:52.725532	William	Wilkins	WebsiteLogin	430522
178	h.schwartz@usciences.edu	$2a$10$lmzTY1bElwBsUWGJXAtk7.9RT4TDCLLQdFVAERLwSHgCh1yKLks72	\N	\N	\N	0	\N	\N	\N	\N	2014-06-18 18:03:38.451229	2014-06-18 18:03:38.451229	Henry	Schwartz	WebsiteLogin	430442
179	mark@jspharmacy.com	$2a$10$9shgORDG.wK.UW.C.Rdba.pr7YcZLhpIbAfTDGjmyL5IXYR1xqgSy	\N	\N	\N	0	\N	\N	\N	\N	2014-06-18 19:17:42.272046	2014-06-18 19:17:42.272046	Mark	Taylor	WebsiteLogin	430494
180	millers15@me.com	$2a$10$sW2rLlS.SeLalUNwatbbj.QHv.eXygFrvTfYq5uBj8QgveqhiVtPq	\N	\N	\N	0	\N	\N	\N	\N	2014-06-18 19:18:59.054769	2014-06-18 19:18:59.054769	Douglas	Miller	WebsiteLogin	430341
181	brianj.catton@gmail.com	$2a$10$qz2We9eV9AWDVYLXdpFvj.BEe7nRk2dN7QlR4u.eO5ATZTapSw7mS	\N	\N	\N	0	\N	\N	\N	\N	2014-06-18 21:56:45.171523	2014-06-18 21:56:45.171523	Brian	Catton	WebsiteLogin	430077
182	pennyhancox@hotmail.com	$2a$10$WdmFYGrafY2YRL8wZo.p7OH3tnO9Y7Vo9v4.OJ/0528EojvJfRrce	\N	\N	\N	0	\N	\N	\N	\N	2014-06-19 14:09:12.507949	2014-06-19 14:09:12.507949	Penelope	Hancox	WebsiteLogin	430211
183	drgbogodo@msn.com	$2a$10$WF2ejqzDiSUwNqpRtplWeu/FMLmMEkovZdVDcOqn7cYUVtMZ3jB8.	\N	\N	\N	0	\N	\N	\N	\N	2014-06-19 15:06:18.796127	2014-06-19 15:06:18.796127	Dolly	Ademodi-Gbogodo	WebsiteLogin	429983
184	ami.simunovich@gmail.com	$2a$10$8yc/4lLTZRibIZrH7p.Mg.4EgRKnC8zAhPYmm8JaDa93x0ppvojlG	\N	\N	\N	0	\N	\N	\N	\N	2014-06-19 17:11:58.386926	2014-06-19 17:11:58.386926	Ami	Simunovich	WebsiteLogin	430467
198	druggist@pobox.com	$2a$10$SSeA.vNizIVe7SMDzhE4UeyY0pk2m.GMq5GMSrUMknbOnA1fbZRvC	\N	\N	\N	0	\N	\N	\N	\N	2014-06-23 22:38:31.565228	2014-06-23 22:38:31.565228	Jeffrey Alan	Septimus	WebsiteLogin	436436
185	sheiladave@aol.com	$2a$10$Qi6Oe0J7WJ1FRAxODdIZNOshbeOUHkfty3Vbt7GIa.rdi6l9NhNi6	\N	\N	\N	0	\N	\N	\N	\N	2014-06-19 19:21:29.334444	2014-06-19 19:21:29.334444	David	Seligman	WebsiteLogin	430449
195	ski.bumz@verizon.net	$2a$10$hJ0DL8nKRDnLz2AYAHeo4umYEgBYs164gxqU2AmkOevy7w1clNVsO	\N	\N	\N	0	\N	\N	\N	\N	2014-06-21 20:54:50.031267	2014-06-21 20:54:50.031267	Barbara	Piercy	WebsiteLogin	430403
186	teprx@aol.com	$2a$10$wbJ9HYkRFKeKqOfdiEbKOOn0UkFP7yNeRI5kkWF5Y8vAEGuCMrirG	\N	\N	\N	0	\N	\N	\N	\N	2014-06-19 20:29:04.192549	2014-06-19 20:29:04.192549	Elyse	Tepper (Rabin)	WebsiteLogin	430498
187	swathantri_kandi@student.fdu.edu	$2a$10$c9vAlhlp4j06KPi0j8nOm.n7PtLelP9duKW/NBLodnDAgsBYF9bt6	\N	\N	\N	0	\N	\N	\N	\N	2014-06-19 23:07:55.102115	2014-06-19 23:07:55.102115	Swathantri	Kandi	WebsiteLogin	430246
188	rbcrp@aol.com	$2a$10$x3xUgk0Nim8CSfliNpgxIeTzutbBqUvayV8vjotG840FYCc0qVzyW	\N	\N	\N	0	\N	\N	\N	\N	2014-06-19 23:59:55.988156	2014-06-19 23:59:55.988156	Richard	Coniglio	WebsiteLogin	430101
189	misch2@comcast.net	$2a$10$lYf9NFOQlyGbI10FWdCRle.ni8PeoCIWdBI1Sxbc4hQGHkGVjH8h2	\N	\N	\N	0	\N	\N	\N	\N	2014-06-20 02:13:53.351719	2014-06-20 02:13:53.351719	Howard	Mischne	WebsiteLogin	430345
190	scotrph@verizon.net	$2a$10$psCT4lDJO0n3hUoVnoFsD.NK2hwO7adPyo4eCw2brLGXcoUbogx/y	\N	\N	\N	0	\N	\N	\N	\N	2014-06-20 10:09:07.400749	2014-06-20 10:09:07.400749	Arthur Scot	Barthold	WebsiteLogin	430016
191	wisameldinesmael@live.com	$2a$10$r7TE5Xg4i0OkGJrnuzhKUuNtTQSbrdKNQS7vBIWCzSXbECI505rh.	\N	\N	\N	0	\N	\N	\N	\N	2014-06-20 11:36:20.663118	2014-06-20 11:36:20.663118	Wisameldin	Esmael	WebsiteLogin	430155
192	wcl3761@aol.com	$2a$10$KgLqslQoyd4uPF1RLdMO7OTL4F74Mcs2SCyECNf6A/SED0OhOGeNe	\N	\N	\N	0	\N	\N	\N	\N	2014-06-20 12:53:08.489161	2014-06-20 12:53:08.489161	Wai Chee	Leung	WebsiteLogin	430291
196	chris-gargiule@att.net	$2a$10$7JvAXm8uJW4SnkeQYRAmoeCcCAoHfv7tJFs3RctBhBFP2iq6JQrum	\N	\N	\N	0	\N	\N	\N	\N	2014-06-22 17:53:40.371857	2014-06-22 17:53:40.371857	Christopher	Gargiule	WebsiteLogin	430183
197	cipigoldenberg@gmail.com	$2a$10$CtD49AOOkUyuEcJHApF6Hu3VcGE248XqkF18zaGx7F1YGH3kAAFzC	\N	\N	\N	0	\N	\N	\N	\N	2014-06-23 14:14:38.570553	2014-06-23 14:14:38.570553	Cindy	Goldenberg	WebsiteLogin	430191
193	jimgiusti@aol.com	$2a$10$dB6OOd8SaV0CEDSNA1ydE.SwHsghWDTkwoZASZSIs.bM.VZAm2mK.	\N	\N	\N	0	\N	\N	\N	\N	2014-06-20 14:44:06.924949	2014-06-20 14:44:06.924949	James	Giusti	WebsiteLogin	430189
194	bdobrzynski@saintpetersuh.com	$2a$10$eLFEAZkhxwBzYxLhpHrvzed87VItAYHot6B8xlhYiMKHYQGQ5975W	\N	\N	\N	0	\N	\N	\N	\N	2014-06-20 16:23:03.574231	2014-06-20 16:23:03.574231	Benjamin	Dobrzynski	WebsiteLogin	430134
199	ojkalson@yahoo.com	$2a$10$zMLC10BE/Rietxb1l5EGYOK4nvO2m6S7t9kHd/Tx01VjRwmAgE24q	\N	\N	\N	0	\N	\N	\N	\N	2014-06-25 00:10:12.072037	2014-06-25 00:10:12.072037	Albert	Koomson	WebsiteLogin	430268
301	hmsrph@verizon.net	$2a$10$lWHCwAOHl97X3Sc.q9p/4.s9DcA6o5/KsBcZbQSX6x3v7HXoqQ0sO	\N	\N	\N	0	\N	\N	\N	\N	2014-09-12 17:26:48.975751	2014-09-12 17:26:48.975751	Howard	Shulman		460073
200	scmoorerp@yahoo.com	$2a$10$wX7L4tUj.4ad19GFv5Wad.oR/8sPrEYoyD57BBPkga9UuyiJBNnvS	\N	\N	\N	0	\N	\N	\N	\N	2014-06-25 00:28:07.562605	2014-06-25 00:28:07.562605	Sandra	Moore	WebsiteLogin	430350
201	dpeters.ics@gmail.com	$2a$10$7xKW0LvSR8NKUSO7n0DM3OcUebhVXBTpy92Omlt/fMFnvUtTaCej6	\N	\N	\N	0	\N	\N	\N	\N	2014-06-28 14:11:05.115041	2014-06-28 14:11:05.115041	Damian	Peters	WebsiteLogin	430398
202	vanessa25pharm@hotmail.com	$2a$10$fZXg3ToJwWtSiCVFljAuE.vOP/E1FzbSk.aMynsDPChPBlrVTe8/O	\N	\N	\N	0	\N	\N	\N	\N	2014-06-28 21:47:43.384454	2014-06-28 21:47:43.384454	Vanessa	Rodriguez	WebsiteLogin	437869
305	aobianwu@aol.com	$2a$10$aZ4CmIbIo9og1Js6xD.LGOtqly3jlO/R3z47.xzZ5xC.BFE4JMxAe	\N	\N	\N	0	\N	\N	\N	\N	2014-09-13 01:09:50.465608	2014-09-13 01:09:50.465608	Azuka	Obianwu		458083
203	tovashulman13@gmail.com	$2a$10$nADIlzRN2bHqCvJNBEqPOuYkic1qlANRDnMEbFfZc55Dt/WsN0Tfu	\N	\N	\N	0	\N	\N	\N	\N	2014-06-29 15:49:59.141797	2014-06-29 15:49:59.141797	Tova	Shulman	WebsiteLogin	430462
207	pharmnj10@yahoo.com	$2a$10$gEiwZnZhX8mM8LY8kY28Ge6ku5WIhul7SscHBBOnhXgHSVmsYnAKO	\N	\N	\N	0	\N	\N	\N	\N	2014-07-02 20:05:06.360318	2014-07-02 20:05:06.360318	Francis	McCabe	WebsiteLogin	430327
208	jeana.parmi@yahoo.com	$2a$10$HqpN1XmR5.m0RzjcpSvG..IHQAqNR8/J2uf8Wf2J3PU4a9SfPJXka	\N	\N	\N	0	\N	\N	\N	\N	2014-07-03 15:18:19.23384	2014-07-03 15:18:19.23384	Jeana	Russo-Parmi	WebsiteLogin	430435
210	semenike@optonline.net	$2a$10$uFYpHhSmkDwHs9vOdNppVe1SqlPn5IwVoh4NRsrca5nVOX75SrEZa	\N	\N	\N	0	\N	\N	\N	\N	2014-07-04 15:22:04.84624	2014-07-04 15:22:04.84624	Sam	Emenike	WebsiteLogin	430151
211	stacyz97@yahoo.com	$2a$10$Now.Li8B0IDZaq1dsRSY/e3T3vjDAoF//0RNcY.AwbcjuirapebCS	\N	\N	\N	0	\N	\N	\N	\N	2014-07-05 16:03:57.253622	2014-07-05 16:03:57.253622	Stacy	Zubrick	WebsiteLogin	430544
215	blisspharm1@gmail.com	$2a$10$SAWybJHtWQxs2qbw8ZJKEOJvpTVyoGVLOkD.7UW9pqcJrGbEvtGr.	\N	\N	\N	0	\N	\N	\N	\N	2014-07-09 11:25:32.915804	2014-07-09 11:25:32.915804	Robert	Bliss	WebsiteLogin	430039
204	malbala@yahoo.com	$2a$10$7AYOtf5dHVUYqxanCYL0IecDcTiMFF2JN8AZO8f..0/qe0E6SkJ3C	\N	\N	\N	0	\N	\N	\N	\N	2014-07-01 09:28:30.139089	2014-07-01 09:28:30.139089	Michelle Lynn	McCarthy (Albala)	WebsiteLogin	430329
205	irizhanovsky@yahoo.com	$2a$10$kbO4oPVDrjqrngHknIDEweuHfQyXhPVJT2Hg.eK17Jan5FpHb3Ms.	\N	\N	\N	0	\N	\N	\N	\N	2014-07-01 16:07:15.698749	2014-07-01 16:07:15.698749	Inna	Shneider	WebsiteLogin	430461
206	moriam.okereke@gmail.com	$2a$10$Gs3LjYSRe4Ps/.7aKnWB8OkSW1okbqS7eDr2lGh9oOflcZotB.vae	\N	\N	\N	0	\N	\N	\N	\N	2014-07-02 18:12:17.07057	2014-07-02 18:12:17.07057	Moriam	Okereke	WebsiteLogin	439781
209	mamta.karani@gmail.com	$2a$10$iy06r8FGvE049nmvEhYDZue1IpQer3YoiT6r7bafAzSnHmlOv3nXK	\N	\N	\N	0	\N	\N	\N	\N	2014-07-03 22:10:12.965256	2014-07-03 22:10:12.965256	Mamta	Karani	WebsiteLogin	439988
212	shalinrpatel@gmail.com	$2a$10$KGrD2Fsx9xLNMrD7vC0GmOY8PujTTf9WsZkrPFwieIpAJ5DWf2UOO	\N	\N	\N	0	\N	\N	\N	\N	2014-07-08 10:50:59.073676	2014-07-08 10:50:59.073676	Shalin	Patel	WebsiteLogin	430388
213	snehapatelsoni@gmail.com	$2a$10$S9MimU7rv9VZTxiwPXF7WuyPrRSGXqC.pKtWtk4oqwFGom0RFWf6C	\N	\N	\N	0	\N	\N	\N	\N	2014-07-08 16:34:14.395046	2014-07-08 16:34:14.395046	sneha	patel	WebsiteLogin	440845
214	nd6275@gmail.com	$2a$10$XWukrDriduiuIlhijVpkQuUzEIOVAXswemak5DG/8OSdKdBVjPuxy	\N	\N	\N	0	\N	\N	\N	\N	2014-07-08 19:05:14.769828	2014-07-08 19:05:14.769828	Neema	Zawacki	WebsiteLogin	441132
240	christian@goldmail.etsu.edu	$2a$10$npt58fI6uvzkP1lGm56qu.6sWkhvFerE5lxsO4BOZG6xGkhwtFSWy	\N	\N	\N	0	\N	\N	\N	\N	2014-07-28 16:42:58.66585	2014-07-28 16:42:58.66585	Ashlei	Christian		440871
241	glevansrph@gmail.com	$2a$10$nFuMWgBm8OpJShoTFDfWweVoGkFIGyLO/z.N9mljoxoCeg2gCXkva	\N	\N	\N	0	\N	\N	\N	\N	2014-07-28 19:28:27.859752	2014-07-28 19:28:27.859752	Genevieve	Levans		446587
242	nwanyanwu@hotmail.com	$2a$10$/28HGhUY0sjSBnQnzaZ/pOYwHQCIGsnsw8wiP941rh9euIPjAdEGu	\N	\N	\N	0	\N	\N	\N	\N	2014-07-28 21:50:57.921786	2014-07-28 21:50:57.921786	Joy	Onugha		446564
216	dchibli@yahoo.com	$2a$10$5Eis8Nlv1UBPEmJpWbiIC.zOfQ5Qdboc3EHk7afuiQl9U8L0mkpp6	\N	\N	\N	0	\N	\N	\N	\N	2014-07-10 18:21:43.292532	2014-07-10 18:21:43.292532	Dani	Chibli	WebsiteLogin	441809
217	tonyqi33@gmail.com	$2a$10$IL02.u5kjwAJ9Jl5i/2Nh.el7DhQRDCC4YsHmKov2czNCWpL/ln6e	\N	\N	\N	0	\N	\N	\N	\N	2014-07-10 21:06:10.638915	2014-07-10 21:06:10.638915	Tony	Qi	WebsiteLogin	430414
218	mrappe@mail.usciences.edu	$2a$10$evKA1uby4NC9/rE6xoTgV.uR0ya/gFL.XChQqBG/Fsk/kh8qnk6i.	\N	\N	\N	0	\N	\N	\N	\N	2014-07-12 01:36:15.202199	2014-07-12 01:36:15.202199	Matthew	Rappe	WebsiteLogin	441775
219	lisarx11@hotmail.com	$2a$10$WeRwoKO4.h/nklBkk.qvven3NdggOtiD0Sq1F/O7Swe6pR5yyUSdm	\N	\N	\N	0	\N	\N	\N	\N	2014-07-13 13:29:37.485635	2014-07-13 13:29:37.485635	Lisa	Rodriguez	WebsiteLogin	441817
220	marysol.bishara@gmail.com	$2a$10$69Q.DB1CwueDc5uqmUbnGuPtUtUQQJWqzjAgYcxaKz7M060jbpRI6	\N	\N	\N	0	\N	\N	\N	\N	2014-07-13 17:25:26.465131	2014-07-13 17:25:26.465131	Marysol	Bishara Diego	WebsiteLogin	430036
221	dmcestone@peoplepc.com	$2a$10$EfO3XbzBkl5pfBm.2wSEH.aQaDZTxK4cb8JRmy4Dd6kbMLTvItiZS	\N	\N	\N	0	\N	\N	\N	\N	2014-07-14 17:21:12.090424	2014-07-14 17:21:12.090424	Donna	Cestone	WebsiteLogin	430079
222	leibfried2@hotmail.com	$2a$10$ho4HA2ntlVV49CCs6pT7uOIiu/lQWTVrBq4.cIGVH5tdKKsPa1xVi	\N	\N	\N	0	\N	\N	\N	\N	2014-07-15 17:30:02.702243	2014-07-15 17:30:02.702243	Maria	Leibfried		444520
223	jolsakow@fdu.edu	$2a$10$YddBSRyOLcqbw7M6vUiTiOKeHK/X3JEftQyBqOzqUI8CK0qkkLNQ.	\N	\N	\N	0	\N	\N	\N	\N	2014-07-15 17:40:18.378888	2014-07-15 17:40:18.378888	Jennifer	Olsakowski		432703
224	onwukajc@yahoo.com	$2a$10$bFhU9BxFodBvIl.ZsPLxUu9qz/J5p98tUMx4tD19wGgorRax5ezYG	\N	\N	\N	0	\N	\N	\N	\N	2014-07-15 19:18:08.713142	2014-07-15 19:18:08.713142	Jacinta	Onwuka		444668
225	liyahw@gmail.com	$2a$10$NcI6/Rm4TnV.QloK.4i11OqXEN8NCXdn.kTmQxxwArpNQ61usddr.	\N	\N	\N	0	\N	\N	\N	\N	2014-07-15 23:31:12.121872	2014-07-15 23:31:12.121872	Jentora	White	WebsiteLogin	444772
243	mcebula@mail.usciences.edu	$2a$10$Cf2hoLfDKcuRFHvHuBiq6.zeVLaBjhUr3TSZwr.bLfkpxNGb5ZmoS	\N	\N	\N	0	\N	\N	\N	\N	2014-07-28 22:34:50.939659	2014-07-28 22:34:50.939659	Marcin	Cebula	WebsiteLogin	430078
244	angela.lubrano@ymail.com	$2a$10$/UlGsa.KhR/Jt1FR3DcdqemE67weycyRqPFqbqRqus8sIf5ld5kla	\N	\N	\N	0	\N	\N	\N	\N	2014-07-28 22:39:19.604939	2014-07-28 22:39:19.604939	Angela	Lubrano	WebsiteLogin	446314
245	jpliskin@verizon.net	$2a$10$N4/SwAEyW//2lOSxtMI6QuObn7FGBHpCR04XPPM1qmWbAg/Np3qSy	\N	\N	\N	0	\N	\N	\N	\N	2014-07-29 01:20:50.796656	2014-07-29 01:20:50.796656	Nancy	Pliskin	WebsiteLogin	430404
226	hayeon.na@gmail.com	$2a$10$TUr/gBpswYsiS4SunNTfxOYYdkz8qwfqbZ7l2482D8ZXY/Pp25M3e	\N	\N	\N	0	\N	\N	\N	\N	2014-07-18 22:24:40.506322	2014-07-18 22:24:40.506322	Ha Yeon	Na	WebsiteLogin	445009
227	tud33765@temple.edu	$2a$10$Ciz2WOvB4Hh7PwNiczOPRuK7SQEyXWQX6AlQWSqW99UkPMqsdxC9i	\N	\N	\N	0	\N	\N	\N	\N	2014-07-19 14:43:19.365164	2014-07-19 14:43:19.365164	Maryah	Haidery	WebsiteLogin	430207
228	madhavi.3362@gmail.com	$2a$10$Oeje2hdF5T2aezzLBKU2AOZzm/mW8DoA83qkZTSMMu7k1w1nYB6LS	\N	\N	\N	0	\N	\N	\N	\N	2014-07-19 18:35:14.434479	2014-07-19 18:35:14.434479	Madhavi	Patel	WebsiteLogin	430381
246	riverdog12@verizon.net	$2a$10$5KrURpmCQiva6PYGmIwHbedbi7D0ZCl0R1LxsrWkUkx60iHpTn0TK	\N	\N	\N	0	\N	\N	\N	\N	2014-07-29 12:14:51.921943	2014-07-29 12:14:51.921943	Michael	Soroka		446588
229	vbrett1@its.jnj.com	$2a$10$yTarfZyexd8IOAQrTMdlDuGx4PE0jKE4eTSqpuU3ZYTn.JKe4O.7S	\N	\N	\N	0	\N	\N	\N	\N	2014-07-20 22:19:57.525109	2014-07-20 22:19:57.525109	Vincent	Brett	WebsiteLogin	430050
230	ashleydusak@gmail.com	$2a$10$9h.7ci7vt2UJZj67oSgMfecafreY0qt0w4JzXEHAgt2nUZZJts62W	\N	\N	\N	0	\N	\N	\N	\N	2014-07-21 12:58:27.620841	2014-07-21 12:58:27.620841	Ashley	Dusak	WebsiteLogin	441729
231	lnuzzio@gmail.com	$2a$10$04GFif.CbYweRkFolcoNmelCy.PBRui0NboNY.bmM.dQosjpFl1GO	\N	\N	\N	0	\N	\N	\N	\N	2014-07-21 14:11:42.392084	2014-07-21 14:11:42.392084	Linda	Nuzzio		445368
232	joellekuron@gmail.com	$2a$10$v5jJQ52.r92nHHB8psmnaurHlOs7Am5lrhw6NKIGtu5xW5JkLbyqm	\N	\N	\N	0	\N	\N	\N	\N	2014-07-22 06:14:22.372224	2014-07-22 06:14:22.372224	Joelle	Kuron	WebsiteLogin	430279
233	jaklin.hanna@rutgers.edu	$2a$10$66yroza.1gwCSnowhL4jfOB6WIwnqOQBGbhN6.SRodvvr5oRNAxlK	\N	\N	\N	0	\N	\N	\N	\N	2014-07-22 19:48:18.249731	2014-07-22 19:48:18.249731	Jaklin	Hanna	WebsiteLogin	445228
234	ggangoli@gmail.com	$2a$10$avJBf362S/iBDCdJcYc8JuQEISJ/EgG5lWIiiSkcDJ6CpCPCoC1Ey	\N	\N	\N	0	\N	\N	\N	\N	2014-07-23 03:44:46.526389	2014-07-23 03:44:46.526389	Gaurav	Gangoli	WebsiteLogin	430182
235	rebeccanjoe@hotmail.com	$2a$10$6edQrIPpejxvKDMlCCe3pOMw3q.aaAdV7FVFIEmwKjcuKQP1D/yvm	\N	\N	\N	0	\N	\N	\N	\N	2014-07-23 12:31:52.077644	2014-07-23 12:31:52.077644	Rebecca Sue	Hinkle	WebsiteLogin	430222
236	berk1627@verizon.net	$2a$10$sX2ePHbAYnM7HJJWTOL6MuttcEz1Es6tdKWx1xbgS6PSintE9nIIy	\N	\N	\N	0	\N	\N	\N	\N	2014-07-23 14:16:08.499397	2014-07-23 14:16:08.499397	John	Berkenkopf	WebsiteLogin	430030
249	rich_em@msn.com	$2a$10$DJ5FEgzvJ4YXuP2v06fSh.g9rHOC/.Mu6onOKkBeag8Ye5fIi6uy6	\N	\N	\N	0	\N	\N	\N	\N	2014-07-31 00:46:03.591677	2014-07-31 00:46:03.591677	Richard	Adamecs	WebsiteLogin	429981
237	famatullah1001@gmail.com	$2a$10$zH7QOYkGDkLXNoL.98UO.OFX8vryOnuC2u/Wjxo3GPEE.XxVzUZXi	\N	\N	\N	0	\N	\N	\N	\N	2014-07-26 18:05:26.67009	2014-07-26 18:05:26.67009	Farihah	Amatullah	WebsiteLogin	441742
238	csilvestri.rph@gmail.com	$2a$10$V.T38EoBjn6MYShZHEeJFuw3Ez1gmEHI/7EVjbjBChLZAuf9oCZ4q	\N	\N	\N	0	\N	\N	\N	\N	2014-07-28 02:26:38.49677	2014-07-28 02:26:38.49677	Carmela	Silvestri	WebsiteLogin	430466
239	cpagonis@mail.usciences.edu	$2a$10$ItkyG3K99go6phTTHithuOgx47TLr2Rnes79yUphSw6rqMIJD8joi	\N	\N	\N	0	\N	\N	\N	\N	2014-07-28 14:43:42.702975	2014-07-28 14:43:42.702975	Christina	Pagonis		445369
247	shara.rudner@gmail.com	$2a$10$mWhdYuv6ShPx1ICDCcKHF.b4n/gPGqcGH3Ja8HaTrqD7GSI/9r//K	\N	\N	\N	0	\N	\N	\N	\N	2014-07-29 14:18:35.782347	2014-07-29 14:18:35.782347	Shara	Rudner	WebsiteLogin	430431
248	jim@valleypharmacyrx.com	$2a$10$fUvAWQ0dorntc6YJnNCNI.bQqEUVQUKACjwCI1tIbwR0SOKGik72e	\N	\N	\N	0	\N	\N	\N	\N	2014-07-30 18:18:04.807789	2014-07-30 18:18:04.807789	James	Cammarata		450959
250	jimmoore08550@verizon.net	$2a$10$ZYYOCk.h3CZP.Xb3rMZNXOBXg0KaP/5JYoZtQFRylMRHFcZXIUCvC	\N	\N	\N	0	\N	\N	\N	\N	2014-07-31 11:42:23.188781	2014-07-31 11:42:23.188781	James	Moore	WebsiteLogin	430349
251	jlam415@gmail.com	$2a$10$2mbtaEmwdXLWt86R1mLxtux/1iFTDnlaiUhN24vUYp37nzsEY2QSi	\N	\N	\N	0	\N	\N	\N	\N	2014-07-31 14:17:57.274109	2014-07-31 14:17:57.274109	Jenny	Lam		451022
252	nilamp220@gmail.com	$2a$10$3Y.h19QaNpqxghuIdarLJOcGXO37qLc4nKlQtMHoOelrMRYQ8YPYa	\N	\N	\N	0	\N	\N	\N	\N	2014-07-31 15:00:58.087995	2014-07-31 15:00:58.087995	Nilam	Patel	WebsiteLogin	430384
257	marion.borbely@gmail.com	$2a$10$IXX5ZVERfeJm8TSiLdx/YuAIkaf5Rt6gkRO7vJTqWZuOh0nE3rQqy	\N	\N	\N	0	\N	\N	\N	\N	2014-08-01 14:41:58.408048	2014-08-01 14:41:58.408048	Marion	Borbely	WebsiteLogin	430047
263	tub55051@temple.edu	$2a$10$e6hWfRTGfa1BKZAd4U6qtezkkUrwyO6cuMvXlDj0gHkL6RjMa1lTG	\N	\N	\N	0	\N	\N	\N	\N	2014-08-04 22:08:26.627678	2014-08-04 22:08:26.627678	Sneh	Patel		451439
266	ann@thevillagepharmacy.com	$2a$10$1KV4P1WFsyAL0Fv1MLOwa.erzX6Pd3qgKVv6b0uWtfrhNwmCB7srS	\N	\N	\N	0	\N	\N	\N	\N	2014-08-08 15:36:24.726802	2014-08-08 15:36:24.726802	Ann	Ervin	WebsiteLogin	430154
253	ecurtin@pharmacareinc.com	$2a$10$t8lwTIc.pJ1jfsiC5OAtw.8HoDJ8u8SFl9eMGryK6XyQcF.WR8/gu	\N	\N	\N	0	\N	\N	\N	\N	2014-07-31 16:18:38.0732	2014-07-31 16:18:38.0732	Edward	Curtin		451047
254	hmartrx@aol.com	$2a$10$WA9YPipjFDwjA/wETHpJ2e4fMwJSOJrKgOAwubaSogJxnC187EZLS	\N	\N	\N	0	\N	\N	\N	\N	2014-07-31 18:01:29.662232	2014-07-31 18:01:29.662232	Harlan	Martin		451065
255	lberger1180@yahoo.com	$2a$10$JJfsAoSPkhUzPRW5lSLxD.hhAGuqTHSybP9PzjOF5U8Qj1E618t.m	\N	\N	\N	0	\N	\N	\N	\N	2014-07-31 21:53:30.322427	2014-07-31 21:53:30.322427	Leon	Berger	WebsiteLogin	430028
256	annmathew_92@yahoo.co.in	$2a$10$Nq2/XwnfY.l71hCKobQozO5hX2dxXtVZtUHCyn.45An9vmcidVyYK	\N	\N	\N	0	\N	\N	\N	\N	2014-08-01 03:23:53.14386	2014-08-01 03:23:53.14386	Annemarie	Mathew	WebsiteLogin	451164
282	hlbrph@optonline.net	$2a$10$iGfmVBlUWvHYAobeymTqB.sjkkMzk9E88TlpuwXKxBekjdQTunmme	\N	\N	\N	0	\N	\N	\N	\N	2014-08-27 19:23:49.843915	2014-08-27 19:23:49.843915	Howard	Bleznick	WebsiteLogin	430037
283	antoniofarmacia@aol.com	$2a$10$HB5ZHys6EYlppzVLsIqkc.zJx8rUU38N9c5zTU7/BV.F5WQeCnu7i	\N	\N	\N	0	\N	\N	\N	\N	2014-08-28 14:31:00.492382	2014-08-28 14:31:00.492382	Anthony	Inguaggiato	WebsiteLogin	430233
258	larrykessler@live.com	$2a$10$KJGfyBAlnwG3W2KGpq8oSevSgx/a.cg3Kq7nszhG.PFbHVXmudyVq	\N	\N	\N	0	\N	\N	\N	\N	2014-08-01 17:00:59.890542	2014-08-01 17:00:59.890542	Larry	Kessler	WebsiteLogin	430254
284	dmiller@millerspharmacy.com	$2a$10$rLs9K5PXksscRcDrCoupAOi3Xvkoplsia1AV2Gj20BxDWhnKTODBC	\N	\N	\N	0	\N	\N	\N	\N	2014-08-28 19:38:33.77718	2014-08-28 19:38:33.77718	David	Miller	WebsiteLogin	430340
259	javierrodriguezrx@gmail.com	$2a$10$wNiMoIhz03ZdKu2Vu3EWXeI63DABSv4D5PBMypO4DAqUg2KGfzmyO	\N	\N	\N	0	\N	\N	\N	\N	2014-08-02 01:39:36.13043	2014-08-02 01:39:36.13043	Javier	Rodriguez	WebsiteLogin	430425
260	askrx@verizon.net	$2a$10$KnCTwJhljDiNn7f/oUp7KOJwOCiZuxvs.vo0XecxsW1Ki4te.LtX6	\N	\N	\N	0	\N	\N	\N	\N	2014-08-02 02:48:58.476884	2014-08-02 02:48:58.476884	Andrew	Kessler	WebsiteLogin	430253
261	smooth1256@yahoo.com	$2a$10$mBX7lU8SoIMYFAweBvVhXejVjq7SKfBlknfYIs454yqqevtiQNocq	\N	\N	\N	0	\N	\N	\N	\N	2014-08-02 09:52:08.456696	2014-08-02 09:52:08.456696	Rita	Fritz	WebsiteLogin	430177
262	djsaul@aol.com	$2a$10$oHkylcCqY.3kNVhGx.2ETuaFBZ23GlGuhdnGykSPRQ7MjWPs4suwK	\N	\N	\N	0	\N	\N	\N	\N	2014-08-02 22:44:55.985808	2014-08-02 22:44:55.985808	Denise	Saul	WebsiteLogin	430439
285	donna.vitale1@verizon.net	$2a$10$0VXbpLRj80bwO/vaYV5/zuiU1QJi59ZoSdUffuo9obnBLzoaEJU4C	\N	\N	\N	0	\N	\N	\N	\N	2014-09-01 20:20:12.461053	2014-09-01 20:20:12.461053	Donna	Vitale	WebsiteLogin	430509
264	akaewen@netscape.net	$2a$10$DkwZj8JejxDRhjmnsOek1eJyyui5NV3krQ4AhWXkDYrMhAYtHoAsi	\N	\N	\N	0	\N	\N	\N	\N	2014-08-06 00:35:30.600494	2014-08-06 00:35:30.600494	Andrea	Armino-Ewen		451602
286	mgleeson@acuityhealthcare.net	$2a$10$gr6uUhUySgf8yZAOHmztueuf4jHGM0LxWos8bLlXSJo8QquVQfw4K	\N	\N	\N	0	\N	\N	\N	\N	2014-09-03 17:41:09.533137	2014-09-03 17:41:09.533137	Megan	Gleeson		458390
287	tua82118@temple.edu	$2a$10$YsWa5OSO052Wam5sbRWISuYMMWMg.Vg9TA0mHnlz4wJaKqTOiK/zW	\N	\N	\N	0	\N	\N	\N	\N	2014-09-04 14:23:12.114707	2014-09-04 14:23:12.114707	Arun	Mohanan	WebsiteLogin	458470
265	cmegalla0613@gmail.com	$2a$10$/PzXVHfnreZDzYo0Ktj.u.E5fxcr6FPAw/17I21GJpWXpBSFOUmfW	\N	\N	\N	0	\N	\N	\N	\N	2014-08-06 23:52:58.850266	2014-08-06 23:52:58.850266	Christine	Megalla	WebsiteLogin	451726
288	jldabronzo@gmail.com	$2a$10$M/Zzsxy6UU4ciroWMdUPxeaJkYxM0FMbfrs9PEGMGFRK.iYFIaZnO	\N	\N	\N	0	\N	\N	\N	\N	2014-09-04 19:53:54.380231	2014-09-04 19:53:54.380231	Joseph	DaBronzo	WebsiteLogin	437408
289	mgrx1812@student.fdu.edu	$2a$10$2H/ORsOX.9ySlyk3VvMXKebXTGV/QQX7mHPnwivN7u3KdVxrKQNFa	\N	\N	\N	0	\N	\N	\N	\N	2014-09-04 20:28:17.685439	2014-09-04 20:28:17.685439	Manishgiri	Goswami	WebsiteLogin	430196
290	rphlc99@aol.com	$2a$10$YTUggSRJMqdWG.yoLwSHzufAsIUxRn5gx15NflfCstD/UmS6W6gqe	\N	\N	\N	0	\N	\N	\N	\N	2014-09-05 15:54:25.584828	2014-09-05 15:54:25.584828	Lorna	Cabral		458654
291	medicap@msn.com	$2a$10$NbDxZEOo0rIQYMJjZBihPuAdg83MZLc0vmEfk7YyFIJM33DVf42w6	\N	\N	\N	0	\N	\N	\N	\N	2014-09-05 15:56:34.776595	2014-09-05 15:56:34.776595	Jay	Greco	WebsiteLogin	430199
267	mikerashti@gmail.com	$2a$10$hpzqeV467iklBF6NHI9W9eNz0apuZI4lMUd8R8seOyw4px21MMU2.	\N	\N	\N	0	\N	\N	\N	\N	2014-08-12 18:36:41.66445	2014-08-12 18:36:41.66445	Mike	Rashti		452685
268	hansen1553@verizon.net	$2a$10$lz4SFerxwH.4/Y2OnMVpjOqBWg6j36hb1kVdfGQEw/TBx9B23osnC	\N	\N	\N	0	\N	\N	\N	\N	2014-08-13 22:08:39.12732	2014-08-13 22:08:39.12732	Kerri	Hansen	WebsiteLogin	451385
269	kenwmeier@gmail.com	$2a$10$vPJZFvIoouUhh6zxa0ien.EGw6cBnIsSbpyAIOFLNVvXaGVXNza8y	\N	\N	\N	0	\N	\N	\N	\N	2014-08-14 21:15:07.050591	2014-08-14 21:15:07.050591	Kenneth	Meier	WebsiteLogin	430334
270	elizabethnolte@yahoo.com	$2a$10$fOjuO5q3HaiQnNE7h05G9u90EjHpbVuW3DoTb8a2ARCFf738QNV.2	\N	\N	\N	0	\N	\N	\N	\N	2014-08-15 21:34:10.653637	2014-08-15 21:34:10.653637	Elizabeth	Bailey		452651
271	aleshia.johny@gmail.com	$2a$10$ukxbPEjtcpkrRACVZqtk.Oev0P8kNrpRDiC33Mo.8aqcDiWpbWWR6	\N	\N	\N	0	\N	\N	\N	\N	2014-08-18 15:07:44.743402	2014-08-18 15:07:44.743402	Aleshia	Johny	WebsiteLogin	453541
292	masrir@hotmail.com	$2a$10$pFRW3/Xwn2mESQbQjv9UMueCEuuDf90FXQp4zVePvx4tYNsU4F2kq	\N	\N	\N	0	\N	\N	\N	\N	2014-09-08 14:11:27.759392	2014-09-08 14:11:27.759392	Reama	Masri		458904
272	erjacobson@gmail.com	$2a$10$/ise5fDpek1hxy3sV3nbQ.y.9qhabzgvlmsAtSPxu1YRRdm.J63eS	\N	\N	\N	0	\N	\N	\N	\N	2014-08-18 19:41:44.87379	2014-08-18 19:41:44.87379	Eric	Jacobson	WebsiteLogin	453835
273	dino7650@aol.com	$2a$10$SKP.X0eQWH5nBHE0jeCv9eNmhM3yp1IHo9JUpERdczh5ur1vESts6	\N	\N	\N	0	\N	\N	\N	\N	2014-08-18 22:07:35.361479	2014-08-18 22:07:35.361479	Fred	Hecht	WebsiteLogin	430217
274	mcutie2010@gmail.com	$2a$10$EFCIMbGqMb2.jwWFgBxjrOB6fdxrOzdDSFZgW58KUU4UN/VsQ1TmC	\N	\N	\N	0	\N	\N	\N	\N	2014-08-20 18:01:58.497615	2014-08-20 18:01:58.497615	Maria	Cutie	WebsiteLogin	430112
275	savona.kaitlin@gmail.com	$2a$10$0dDbfelnkJFF9UiY08NmY.LXsmjIb6Pz6l4w2nIQGUHDWe7oe1yjG	\N	\N	\N	0	\N	\N	\N	\N	2014-08-21 17:46:51.432087	2014-08-21 17:46:51.432087	Kaitlin	Savona		453904
276	isrxivan@aol.com	$2a$10$OlZgEUAimXYA7Byedql9k.JS6cuHwmWOjLQ6F3FM8nIoxM0YUQqkm	\N	\N	\N	0	\N	\N	\N	\N	2014-08-21 17:55:46.956402	2014-08-21 17:55:46.956402	Ivan	Saiff		454650
277	lwgrama@aol.com	$2a$10$bhpJVnipTxsTj.5M66f1dOzRAQ2Rjz7LUtVErqugiGq1PVTGwg2i.	\N	\N	\N	0	\N	\N	\N	\N	2014-08-22 14:36:51.978812	2014-08-22 14:36:51.978812	Louis	Grama	WebsiteLogin	430197
278	agrzib@wedgewoodpharmacy.com	$2a$10$n8k6JZU/3HtTYrdXXhBsseeSW.gY9ZIFFAgISxhmWbMxwxrHbnXQG	\N	\N	\N	0	\N	\N	\N	\N	2014-08-25 17:13:50.03833	2014-08-25 17:13:50.03833	Anthony	Grzib	WebsiteLogin	430203
279	davkozmo@yahoo.com	$2a$10$48K2ugRK/U3DGtfV05SXzuyPr/VuaKcZh8Cl9c5yRqPJd9f179wK2	\N	\N	\N	0	\N	\N	\N	\N	2014-08-25 19:57:54.365684	2014-08-25 19:57:54.365684	David	Kozloski	WebsiteLogin	430272
280	dominickzinna@gmail.com	$2a$10$rDdKqtuXRrThs7mFo/i36.ef1Fv9KJweDAx4rLTY.mbhYeoOD6kNK	\N	\N	\N	0	\N	\N	\N	\N	2014-08-25 23:13:23.721782	2014-08-25 23:13:23.721782	Dominick	Zinna	WebsiteLogin	430540
281	gwbsr22@verizon.net	$2a$10$tqcz51KeW37wu1nHHnwZ0O4FfDOcYIAZE7rpnGgQl29J8Un2aaT9y	\N	\N	\N	0	\N	\N	\N	\N	2014-08-27 15:02:13.530564	2014-08-27 15:02:13.530564	George	Brown	WebsiteLogin	430057
295	veenabarthwal@hotmail.com	$2a$10$8xzu9V9WoJCeVuXVMuPPkupI3l1V.L8foQNwJ8.nVfT/s0ilfo5Ku	\N	\N	\N	0	\N	\N	\N	\N	2014-09-09 12:20:46.82017	2014-09-09 12:20:46.82017	Veena	Barthwal		459148
293	mctighe612@yahoo.com	$2a$10$4r/FUUj.4v2m8AA990JdZuLhalaFSwkeg4EIzDzaPJz7.BifcQeV2	\N	\N	\N	0	\N	\N	\N	\N	2014-09-08 15:23:37.41126	2014-09-08 15:23:37.41126	Dawn	McTighe	WebsiteLogin	458689
294	dbauerlein1439@mail.usciences.edu	$2a$10$7Fb/vvbhKxiKEl2wpFGvB.0zq3DmJYpXTSq2Q48S4chccWBMxHHJG	\N	\N	\N	0	\N	\N	\N	\N	2014-09-08 20:58:44.103525	2014-09-08 20:58:44.103525	Deanna	Bauerlein	WebsiteLogin	458602
296	jgerbasio@aol.com	$2a$10$iqeYqgMJ7ZJTRKdFHOK3re6dP/CeYmMsyhE8iGfYlBZkRm1vPEUO6	\N	\N	\N	0	\N	\N	\N	\N	2014-09-09 15:12:08.602367	2014-09-09 15:12:08.602367	John	Gerbasio	WebsiteLogin	430185
297	krcigna36@gmail.com	$2a$10$.pnFjXYuoPbocln.PKvAW.ffo0Mw327/f1GBT1Gix4BKBpKFkKNzi	\N	\N	\N	0	\N	\N	\N	\N	2014-09-09 21:05:44.140653	2014-09-09 21:05:44.140653	Kimberly	Cigna Garrett	WebsiteLogin	440201
298	anita.ramnath@temple.edu	$2a$10$6ZETtHFZ72I.sqx20PCKiepjBik15nm5i/HQPmAQUl4bnyM8COGge	\N	\N	\N	0	\N	\N	\N	\N	2014-09-10 01:08:24.684594	2014-09-10 01:08:24.684594	Anita	Ramnath	WebsiteLogin	430419
299	lynndat@comcast.net	$2a$10$Jc9RqTuA1hLMo1utniFCNeheTFMkB4JeaezIgFaJBa5KC49tJXME.	\N	\N	\N	0	\N	\N	\N	\N	2014-09-10 15:05:08.052535	2014-09-10 15:05:08.052535	Linda	Dattilio	WebsiteLogin	440857
300	alan.lu@temple.edu	$2a$10$xR3dvszEg93Sfs9xEcpaR.fEvgNLYof.nfurTqZ7kGSI3F6HGxvNi	\N	\N	\N	0	\N	\N	\N	\N	2014-09-12 01:45:04.053576	2014-09-12 01:45:04.053576	ALAN	LU	WebsiteLogin	458643
302	tuf24437@temple.edu	$2a$10$3oX5izvfeD2qCMoMaXbtOOiWuhhIMybSA/hOAm35wKjMgYjhw5RG.	\N	\N	\N	0	\N	\N	\N	\N	2014-09-12 18:11:52.174686	2014-09-12 18:11:52.174686	Jessica	Cicale	WebsiteLogin	459682
303	jvjohn86@optonline.net	$2a$10$EIqJc7O.u/9HAn.5ZS0XWelTsGQJROxDh1n0bLYOIjWxiKG8XvZai	\N	\N	\N	0	\N	\N	\N	\N	2014-09-13 00:40:31.735152	2014-09-13 00:40:31.735152	Joy	Johnson	WebsiteLogin	459738
304	ipbgruth@gmail.com	$2a$10$OYSZKHjJinU.VDd787WARuEUa2MqNljMPpUD.YjK0WoN6HkgIZ7j6	\N	\N	\N	0	\N	\N	\N	\N	2014-09-13 00:46:08.37297	2014-09-13 00:46:08.37297	Ruth	Dailey		458416
306	tuf09058@temple.edu	$2a$10$ffFltrJrlCj1aGsX.cOhLOm82c537G97MaNmL6ueWCZlLp/AjIfK2	\N	\N	\N	0	\N	\N	\N	\N	2014-09-13 04:21:30.917612	2014-09-13 04:21:30.917612	Sophie Hien	Le	WebsiteLogin	459989
307	millie.rajyaguru@gmail.com	$2a$10$6K5vr/7HukzEIJj8gJ3AfeCujZDllVbAcBXavSWHYYHaklP5r4kLa	\N	\N	\N	0	\N	\N	\N	\N	2014-09-15 01:46:56.010951	2014-09-15 01:46:56.010951	Millie	Rajyaguru	WebsiteLogin	430417
308	tuf07256@temple.edu	$2a$10$D.DAgAyZXALs0xOpVbIabuTs0sDvtCEDkA6Vnecmash897usRef7a	\N	\N	\N	0	\N	\N	\N	\N	2014-09-15 02:56:14.071086	2014-09-15 02:56:14.071086	Jin Rong	Huang	WebsiteLogin	459891
309	nandrx@earthlink.net	$2a$10$Nk0DCERSQPMqOQs.rATR8OLeDDsaqco0UcamP3E3kKQsci2VuN7Ha	\N	\N	\N	0	\N	\N	\N	\N	2014-09-15 11:35:43.603413	2014-09-15 11:35:43.603413	Nancyann	Davis	WebsiteLogin	430119
310	brossi@fdu.edu	$2a$10$pJHljdkUp8BcsoosDHenReP.fX6APvFyP/bg3G1x/EkGS84MsPUN6	\N	\N	\N	0	\N	\N	\N	\N	2014-09-15 15:51:17.815843	2014-09-15 15:51:17.815843	Barbara	Rossi		460328
311	tue79466@temple.edu	$2a$10$n0qK4kAip0pBcJa8fxXeAusUi2LoZIsx4VCNl1OS1zFQ9M/YtEvnK	\N	\N	\N	0	\N	\N	\N	\N	2014-09-16 04:21:44.669526	2014-09-16 04:21:44.669526	Erika	White	WebsiteLogin	460293
312	lucreciacampisirph@gmail.com	$2a$10$1YYtWx40GySos/k6EojjXu4vNvgtNEDdWR/dAuBawUsWw5.LkVeUe	\N	\N	\N	0	\N	\N	\N	\N	2014-09-16 14:58:40.427082	2014-09-16 14:58:40.427082	Lucrecia	Campisi		460522
313	suejmcc@yahoo.com	$2a$10$JUmIQsLeCpRI/hskxWa8Ief1rmQYPVHZNFwsmD2n0TxGnJjAtkXHG	\N	\N	\N	0	\N	\N	\N	\N	2014-09-16 15:20:46.991936	2014-09-16 15:20:46.991936	Suzanne	McCormick	WebsiteLogin	430330
334	margaret.adesola.alabi@gmail.com	$2a$10$aa2jklEFALqagg4KTD2cpuR9Xek1Q2it01o4HwnWyo12TauvoampO	\N	\N	\N	0	\N	\N	\N	\N	2014-10-06 14:38:43.542354	2014-10-06 14:38:43.542354	Margaret	Alabi	WebsiteLogin	468415
314	sislam1215@mail.usciences.edu	$2a$10$xo42r5ugCXW3Z3/.wEuwRe7CVZPjvIcK.dLCiQcCtQKCcdaCA0jFK	\N	\N	\N	0	\N	\N	\N	\N	2014-09-17 18:27:39.008642	2014-09-17 18:27:39.008642	Shadman	Islam		461162
335	cs.deshpande@gmail.com	$2a$10$wSyfFsVO46s2PWYyXS9V5.5vwzNpg9CkATur3Gfwj9H1WB3TJB0na	\N	\N	\N	0	\N	\N	\N	\N	2014-10-08 14:29:10.753624	2014-10-08 14:29:10.753624	Chandrashekhar	Deshpande	WebsiteLogin	470484
315	rshah1314@mail.usciences.edu	$2a$10$omaKoYZj8/3lPavNNx63WebBwEomMGJ2AzAKWxevGHtjw6HSeM4V.	\N	\N	\N	0	\N	\N	\N	\N	2014-09-20 12:56:59.96755	2014-09-20 12:56:59.96755	Radha	Shah		461168
316	myhanhdo123@gmail.com	$2a$10$qEvKKTqLxW0gqm8Vqh6xW.3UBmBlvFHbipfD2MSkNL.VWCF8F2fy6	\N	\N	\N	0	\N	\N	\N	\N	2014-09-20 14:15:41.492831	2014-09-20 14:15:41.492831	Myhanh	Do		461720
317	clementc88@gmail.com	$2a$10$Ao57bMEOE136t2n9qWEXsOekLWj7jehVPA9z70C66RDGr1LOtb3Ny	\N	\N	\N	0	\N	\N	\N	\N	2014-09-20 19:01:56.278533	2014-09-20 19:01:56.278533	Clement	Chen		456334
318	tzvimobile@gmail.com	$2a$10$8ZMbJy4C7eTp19oNObtVP.VHMq7LN4fxi4GPxwm0D4pExa14c2Kt.	\N	\N	\N	0	\N	\N	\N	\N	2014-09-21 20:43:43.817534	2014-09-21 20:43:43.817534	Howard	Goldman	WebsiteLogin	430192
319	mficano@ufl.edu	$2a$10$B.M9vaTMfoMVuv4L4ZVWqO9drMhOZ9pdX8QrWpJSxiFMbYe6GifH2	\N	\N	\N	0	\N	\N	\N	\N	2014-09-23 22:20:50.911813	2014-09-23 22:20:50.911813	Maria	Ficano	WebsiteLogin	430164
320	chancellorpharmacy@gmail.com	$2a$10$XPA/TorYLKtjBbLo91Xka.mqGwWZoPMjINHo7A.DZHos5GcAuPfhO	\N	\N	\N	0	\N	\N	\N	\N	2014-09-24 16:52:09.280748	2014-09-24 16:52:09.280748	Rasesh	Patel		463512
336	tsaraffian1@verizon.net	$2a$10$4Wj0mtDYAjSMmI4N/prI6eKuiV/1mMgqsLdJmZtGE3YJqY2kjeSHW	\N	\N	\N	0	\N	\N	\N	\N	2014-10-09 17:17:17.427731	2014-10-09 17:17:17.427731	Thomas	Saraffian		438907
321	vmmosquera@msn.com	$2a$10$h7UyWclomEqZCOwq0w/obOvKw.C4yMiW1DcS8uptVCA1X3CtDXQce	\N	\N	\N	0	\N	\N	\N	\N	2014-09-24 18:08:42.268617	2014-09-24 18:08:42.268617	Victor	Mosquera	WebsiteLogin	430351
337	info@easypharmacy.com	$2a$10$lfLmkbI1EjTZAkh8d.4OSenhidfPYGmU/S.IfJFof24kk3.OkPtJi	\N	\N	\N	0	\N	\N	\N	\N	2014-10-10 15:25:00.337421	2014-10-10 15:25:00.337421	Kiran	Parvatrao		471189
339	sshiliwala@gmail.com	$2a$10$t8QDKRbmHycjlxLQFBX8JuWl4GR4dCt9k6vBscrF7vtGpHQhuW9DO	\N	\N	\N	0	\N	\N	\N	\N	2014-10-17 01:19:04.836213	2014-10-17 01:19:04.836213	Shabbirahmed	Shiliwala		458364
340	cieslik.julia@gmail.com	$2a$10$ggzd73MUnzGNFhGfZik8XeChnoK6VYy7Aq9b8H1ECGOGdlHfpm1V.	\N	\N	\N	0	\N	\N	\N	\N	2014-10-24 13:28:37.369783	2014-10-24 13:28:37.369783	Julia	Cieslik	WebsiteLogin	439782
322	edelisaoak@optimum.net	$2a$10$RHDrvf7v0Ocs1nI6u.BA9u9deOJj6Oe460o4NxXrmnViDdBh/Su4S	\N	\N	\N	0	\N	\N	\N	\N	2014-09-26 18:05:16.321511	2014-09-26 18:05:16.321511	Eddie	Peron	WebsiteLogin	463085
323	tblissw@aol.com	$2a$10$7t20bBr8GjmvbvUE6vhzgeY2Ix1V3GywNJgrdQbTAlT85WYpOa6nK	\N	\N	\N	0	\N	\N	\N	\N	2014-09-29 15:47:11.698375	2014-09-29 15:47:11.698375	Therese	Walker		463740
324	michellevizzi@gmail.com	$2a$10$YPth4/THE9mFmVZXrZoUT.xp8lvCwjDH9u3kkRK2zP5arGXG2jMXy	\N	\N	\N	0	\N	\N	\N	\N	2014-09-30 01:21:35.346461	2014-09-30 01:21:35.346461	Michelle	Vizzi	WebsiteLogin	430511
325	lvisc@optonline.net	$2a$10$7GA5rWqJfno2V8B6b2wsR.7QFCOZ2.wkSiB6t8vhaxXVfpMaqhxdm	\N	\N	\N	0	\N	\N	\N	\N	2014-09-30 09:51:27.015527	2014-09-30 09:51:27.015527	Laura	Viscovic	WebsiteLogin	461286
326	lalit.chopra@mallinckrodt.com	$2a$10$AOpix9JAhv69XSb6PYYufuD4Qh5gX1DpMoJlqu5zjXyzrgzxR5as.	\N	\N	\N	0	\N	\N	\N	\N	2014-09-30 14:41:18.528085	2014-09-30 14:41:18.528085	Lalit	Chopra		467059
327	randallr989@gmail.com	$2a$10$2l7MrHJNH8O1XUDcuHwCpe0.Yb.4K9IrCuY29bomJhAgD6SJA6KsG	\N	\N	\N	0	\N	\N	\N	\N	2014-09-30 15:15:36.410253	2014-09-30 15:15:36.410253	Randall	Richardson		460542
328	paolaacv2@gmail.com	$2a$10$H7ywD5XfAfa6JJe5IhLP5O8ngVx4VkOyrMfx2538zJ3sXnnfOt9di	\N	\N	\N	0	\N	\N	\N	\N	2014-09-30 17:54:01.521856	2014-09-30 17:54:01.521856	Paola	Acevedo		467118
329	ann.siu@my.liu.edu	$2a$10$8pzW3B85FRO70fERerpAlumfGnd345MBvJXjoT82RryBp2PWDdyQy	\N	\N	\N	0	\N	\N	\N	\N	2014-10-01 03:17:34.219214	2014-10-01 03:17:34.219214	Ann	Siu		467108
330	trung.le@my.liu.edu	$2a$10$oGnLQ/wRaLqhrHkYcvINGu0Q7/FBZJ6u3.lnuyGidkvNwgX79vrge	\N	\N	\N	0	\N	\N	\N	\N	2014-10-01 18:21:15.669863	2014-10-01 18:21:15.669863	Trung	Le		467107
331	barbara1451@hotmail.com	$2a$10$Ha5ta/H1P4Uu8.VbehlNSuYlCNZ9vcmF14ZyzskbSMlhxEzS9IRlq	\N	\N	\N	0	\N	\N	\N	\N	2014-10-02 14:17:36.125631	2014-10-02 14:17:36.125631	Barbara	Paladino	WebsiteLogin	430372
338	tue81557@temple.edu	$2a$10$eCM2ei9OiIKPd8xbhhwvpuMwXmRNtObB7dVs1tUjcTyWHjFua3XPu	\N	\N	\N	0	\N	\N	\N	\N	2014-10-16 10:48:13.461663	2014-10-16 10:48:13.461663	Kevin	Dunn	WebsiteLogin	430144
333	trung.pham@my.liu.edu	$2a$10$2nZL7FuBPYlzIqj/pNCt1.mt266jXamv6gWk7dnRMvfQChGerfZkq	\N	\N	\N	0	\N	\N	\N	\N	2014-10-04 04:27:30.46519	2014-10-04 04:27:30.46519	Trung	Pham		467113
342	lchuang5@gmail.com	$2a$10$nRbLt1stRj4sCvhz8OU7guNqvHz5F1Ik/dXKTlp78.Ai7QjuZjNpG	\N	\N	\N	0	\N	\N	\N	\N	2014-10-29 22:18:02.631472	2014-10-29 22:18:02.631472	Linda	Chuang	WebsiteLogin	474095
341	vjain096@gmail.com	$2a$10$b6VDjAXe8Fvh0XY/XAap1.3nkicWORilZ26.E8eSqHuP8VUFRALmG	\N	\N	\N	0	\N	\N	\N	\N	2014-10-29 18:16:52.827642	2014-10-29 18:16:52.827642	Vishal	Jain	WebsiteLogin	430240
345	mehunterpharmd@aol.com	$2a$10$CZVTVQJSHwj9ahjlo3K4zux2y5VGwZmmsbJMIFzEptYWJNgvzM4qe	\N	\N	\N	0	\N	\N	\N	\N	2014-11-10 02:23:11.773743	2014-11-10 02:23:11.773743	Mary Ellyn	Hunter	WebsiteLogin	430231
343	lmgrx71@gmail.com	$2a$10$zO/GnwEAEVAeDCLwteRzjOCl8sJZR5r/UjM2e/vX8vD0EPDhEjTLe	\N	\N	\N	0	\N	\N	\N	\N	2014-11-04 01:52:08.112561	2014-11-04 01:52:08.112561	Lisa	Germann	WebsiteLogin	430186
344	pharma_sharma@yahoo.com	$2a$10$UORwe9LRZBagyC9IDAFEweA8QAIG.X.dfWVsUDcJyp09xvGIEsaJK	\N	\N	\N	0	\N	\N	\N	\N	2014-11-04 19:25:10.181815	2014-11-04 19:25:10.181815	Lakshmi	Sharma	WebsiteLogin	477027
347	je.katz@wingate.edu	$2a$10$9HE.LWC.MrpzA.5hAnLKWeah2ZZ7uJagngJb3xBP1enMkqZuymEuy	\N	\N	\N	0	\N	\N	\N	\N	2014-11-13 14:40:01.219311	2014-11-13 14:40:01.219311	Jeffrey	Katz	WebsiteLogin	430250
11	njpha@njpharma.org	$2a$10$kZj7mzfv8sW7RJ5nyAZkyOVOHyVeeLKvaJTIK.xB4YVSKxWyg/.cC	\N	\N	\N	407	2015-03-25 14:01:01.571656	2015-03-24 23:38:57.702013	47.19.73.146	74.105.78.216	2014-05-27 03:09:58.991996	2015-03-25 14:01:01.57349	\N	\N	\N	\N
346	llpcrph@gmail.com	$2a$10$ukURJQt/Sjr7YP.tfUgyQuEy/SOq13F2ZkNe5dmDApKQjxwjl1fR2	\N	\N	\N	0	\N	\N	\N	\N	2014-11-11 16:09:03.60474	2014-11-11 16:09:03.60474	Lisa	Poon Chuk	WebsiteLogin	479879
348	marybh330@gmail.com	$2a$10$yn1oR7weRWqEyMpdL8kdteukcd7iXZ3XjR1gmabw./eskgHjVojmW	\N	\N	\N	0	\N	\N	\N	\N	2014-11-26 14:43:24.443512	2014-11-26 14:43:24.443512	Mary	Burke-Hopke		482495
349	ngpsomas@me.com	$2a$10$FFa2EFAbwAWK3SMIi59eLOwGUx7stglnIV3Dw.8MOD59N1wQZCfp2	\N	\N	\N	0	\N	\N	\N	\N	2014-11-28 22:30:35.675404	2014-11-28 22:30:35.675404	Nicholas	Psomas	WebsiteLogin	430411
350	pfrank66@hotmail.com	$2a$10$UhSZCpzl4q3aj46oHxfh6eJpEP5eRJTb2gqpDtl9HhKrNKcb0KG6S	\N	\N	\N	0	\N	\N	\N	\N	2014-11-29 17:01:27.968864	2014-11-29 17:01:27.968864	Peter	Franklin	WebsiteLogin	430175
351	vishnu21@student.fdu.edu	$2a$10$Ipjq2Mp3P1IYrYlZnpaJc..pwoLK7H8dKlVtpMw8J/XAlFZ3wuaq.	\N	\N	\N	0	\N	\N	\N	\N	2014-12-01 17:08:58.921615	2014-12-01 17:08:58.921615	Vishnu	Patel	WebsiteLogin	482443
365	meliriv86@gmail.com	$2a$10$Ie2vH8npW6pT8CvFFfboceA9ZiQ1dScOncPMQ2FFOiisyX9n2yjse	\N	\N	\N	0	\N	\N	\N	\N	2015-01-14 00:32:17.479899	2015-01-14 00:32:17.479899	Melissa	Morcos	WebsiteLogin	488993
366	prasa@rasagroup.com	$2a$10$HWUMqfUmFhtcHIbwftGVye3BwQB.gjAnY4oytZdb5ilQVs9bEvNFO	\N	\N	\N	0	\N	\N	\N	\N	2015-01-14 15:48:00.245115	2015-01-14 15:48:00.245115	Paul	Rasa	WebsiteLogin	430420
332	dufleid39@optonline.net	$2a$10$NWYHlmR7r6Fvfo97lDBdS./bHHXdfD1PoaBsZQWqpg4lEaF3fQeYq	QFy_QR2QFV4szLNcQm-B	\N	\N	2	2014-12-09 22:17:26.224314	2014-12-09 22:16:49.285978	67.85.7.126	67.85.7.126	2014-10-02 14:44:21.593524	2014-12-09 22:17:26.704475	John	Dufleid	WebsiteLogin	430142
352	pnociolo@gmail.com	$2a$10$5o8UG2RzeZD6ahx70fxYL.8l7EFt3rj3uHPF0YpL8k/TGckZ6Fl0C	\N	\N	\N	0	\N	\N	\N	\N	2014-12-15 17:10:22.205938	2014-12-15 17:10:22.205938	Paula	Nociolo	WebsiteLogin	483715
353	sam_merz@hotmail.com	$2a$10$HXXqskHLnUkYMbXwCZLRFOP6p0EpFkk7N6EQXSkABBQSt.2UrhMiy	\N	\N	\N	0	\N	\N	\N	\N	2014-12-15 18:02:31.83417	2014-12-15 18:02:31.83417	Samuel	Merz	WebsiteLogin	485461
354	skyerbrand@msn.com	$2a$10$EynPEaYWxX5FhHPKcr4zu.vgpYGJXMg.p2Yn/KS4PUhvso05x.e1S	\N	\N	\N	0	\N	\N	\N	\N	2014-12-21 02:39:46.746646	2014-12-21 02:39:46.746646	Nicole	Skyer-Brandwene	WebsiteLogin	430472
355	ehmoulton@gmail.com	$2a$10$nDs70HyTMRdJaOv/5m1Fouq0QWwsy24JNN9xhz5hNYVoJNNBRpwvu	\N	\N	\N	0	\N	\N	\N	\N	2014-12-22 15:40:21.83786	2014-12-22 15:40:21.83786	Elizabeth	Moulton	WebsiteLogin	430352
356	lisadeberardine@yahoo.com	$2a$10$sQuZx1NwPT44losIawEOhez1hrp4nNAxHJNjoSrCJdwXtiyMNN66G	\N	\N	\N	0	\N	\N	\N	\N	2014-12-28 15:25:32.773477	2014-12-28 15:25:32.773477	Lisa	DeBerardine	WebsiteLogin	430122
367	pinal91@gmail.com	$2a$10$1vwjrd/JQf/zSrcc96ZMCejC13yxcQ2.uUTQKwXmbmQja4HnlsxAu	\N	\N	\N	0	\N	\N	\N	\N	2015-01-15 19:57:40.723619	2015-01-15 19:57:40.723619	Pinal	Patel	WebsiteLogin	490574
368	chaudhari.devesh@gmail.com	$2a$10$CNzhABrnM34h.diPh1FIT..z75Q5Pru5G.J3AdFJK5W/TvE9UPOzu	\N	\N	\N	0	\N	\N	\N	\N	2015-01-15 21:12:16.929926	2015-01-15 21:12:16.929926	Devesh	Chaudhari	WebsiteLogin	490488
369	taffet389@aol.com	$2a$10$kf.bjXDegeZztTz7s3.7g.jizp894EsAcb9GeK58wwIfGppAhWRKe	\N	\N	\N	0	\N	\N	\N	\N	2015-01-21 00:58:03.52588	2015-01-21 00:58:03.52588	Cynthia	Mohar-Taffet	WebsiteLogin	430348
370	bill.adamshick@aol.com	$2a$10$vqhdXFbHwI94AePI8c20YuswJ9Sya66XpDHGuLjBABM/6/p6sfzt2	\N	\N	\N	0	\N	\N	\N	\N	2015-01-21 19:54:43.34112	2015-01-21 19:54:43.34112	William	Adamshick	WebsiteLogin	429982
91	martinfour44@comcast.net	$2a$10$gg2yrZsEiSmbilE1Jydltep8a92juQubam5JgeYcAOVv0oLWbjLke	Vwyyuf4jCbx31Dyyy397	\N	\N	4	2015-01-02 15:39:09.784793	2015-01-02 15:37:27.72912	98.221.215.95	98.221.215.95	2014-05-28 13:34:25.697288	2015-01-02 15:39:09.786676	Lawrence	Martin	WebsiteLogin	430322
357	mei.liao@comcast.net	$2a$10$.CJ3EmMEcuuIn.0W28anCukFS0Qhz3ri7LSdMmdeeoqCXcYI4oOCq	\N	\N	\N	0	\N	\N	\N	\N	2015-01-05 03:14:46.355514	2015-01-05 03:14:46.355514	Mei	Liao	WebsiteLogin	474119
358	devilbean@yahoo.com	$2a$10$5vAtmpvHymVFk2No.xX.UurIz2Ev0atmeubl9m2I5S0YPg6Jlp6my	\N	\N	\N	0	\N	\N	\N	\N	2015-01-06 22:17:51.229389	2015-01-06 22:17:51.229389	Jillian	Hocking	WebsiteLogin	430224
359	jtpdua1202@gmail.com	$2a$10$.CPogq/O4fJci/oO72xXj.BlSlACSZro1FWRqcMktUN1bwrlc3Sq6	\N	\N	\N	0	\N	\N	\N	\N	2015-01-08 03:28:43.857914	2015-01-08 03:28:43.857914	Jeanette	Dua	WebsiteLogin	430140
360	veerareddy5@comcast.net	$2a$10$VL9JbRecavILs4rAWfwYZu8lygUCjiQ/a5d9gr9gzenpOAZyHHsGm	\N	\N	\N	0	\N	\N	\N	\N	2015-01-08 04:09:49.020183	2015-01-08 04:09:49.020183	Veera Reddy	Nadakatla	WebsiteLogin	430356
361	jeffz129@hotmail.com	$2a$10$CPipASmBX5Qzph40OFdVvOfC2R/wHNoLtf78S9XehhYAeY/cl8W/O	\N	\N	\N	0	\N	\N	\N	\N	2015-01-09 04:01:19.656411	2015-01-09 04:01:19.656411	Jeffrey	Zeilberger	WebsiteLogin	430538
362	strongmedicine4@hotmail.com	$2a$10$dVGtJnT5Q3tpek.KQYeZyeXIekN.p9DWEMXNhBpZbd4keJQUcDTwG	\N	\N	\N	0	\N	\N	\N	\N	2015-01-12 13:56:06.619254	2015-01-12 13:56:06.619254	Gaetan	Panarello	WebsiteLogin	430375
363	mzungu81@gmail.com	$2a$10$SAKK9YNJklu/AC/YDjaZHeky2QnEHwfR/Tki8GSwjRuUCEty4WA.6	\N	\N	\N	0	\N	\N	\N	\N	2015-01-12 19:04:58.662004	2015-01-12 19:04:58.662004	Celia	Sloan	WebsiteLogin	489720
364	ashraflatif@sheefa.com	$2a$10$B1kEfIwjEQ71sZlcuuUDaestzknXiC1lpTuPONM9zkwDX1EkIUOqe	\N	\N	\N	0	\N	\N	\N	\N	2015-01-12 20:09:14.430709	2015-01-12 20:09:14.430709	Ashraf	Latif	WebsiteLogin	430283
371	gabrielabernat@me.com	$2a$10$QsY0OeO.qSJKOm61u5gd8OF5XrGhO2LrKQfhQT/hrke35bBf4MY1S	\N	\N	\N	0	\N	\N	\N	\N	2015-01-24 16:51:28.91922	2015-01-24 16:51:28.91922	Gabriela	Bernat	WebsiteLogin	494551
372	mshah33@student.fdu.edu	$2a$10$T8Zry7/Z86/Cq5YDdSghVeDNWmRu22jzjI2mHx/vG.PDQUhYQZ7fa	\N	\N	\N	0	\N	\N	\N	\N	2015-01-24 16:52:01.860317	2015-01-24 16:52:01.860317	Mruga	Shah	WebsiteLogin	494299
373	prr0306@gmail.com	$2a$10$GE9bCpQqKb.kDNnOrpKFcediODyfntMXUADLCZKDxDTONWkZCtXpq	\N	\N	\N	0	\N	\N	\N	\N	2015-01-25 00:16:21.00105	2015-01-25 00:16:21.00105	Priti	Pathak	WebsiteLogin	446812
374	tootsie2@gmail.com	$2a$10$7XW78UPdFsnFTDlesihbCeJ.F6xhc2tgTxhnY57cDrdVsVEo3opqO	\N	\N	\N	0	\N	\N	\N	\N	2015-01-28 15:17:37.252635	2015-01-28 15:17:37.252635	Marina	Kolesnikova	WebsiteLogin	494461
375	drnkardos@gmail.com	$2a$10$sW/EtTqmb8Qn5kSPxZO4IeoMCk55aTNISFJjeJRlPiyhvodTzrJ9i	\N	\N	\N	0	\N	\N	\N	\N	2015-01-28 15:25:46.781646	2015-01-28 15:25:46.781646	Nelson	Kardos	WebsiteLogin	430249
376	marilia.faustino.88@gmail.com	$2a$10$Y6NmWQrIaZrM6eeKAHxUOeUhmnAv5s4k3n.6.nR2ZlvegsMyV9366	\N	\N	\N	0	\N	\N	\N	\N	2015-01-29 17:19:43.153717	2015-01-29 17:19:43.153717	Marilia	Faustino		495479
377	tchongmu@student.fdu.edu	$2a$10$CqBfAy5Iliy4nh3XMv65wueQLz187aWHGZWgdCcpThVhhh72Wcoyy	\N	\N	\N	0	\N	\N	\N	\N	2015-01-30 23:22:37.931281	2015-01-30 23:22:37.931281	Thomas	Chong-Munoz		467077
378	woojin.yoon09@stjohns.edu	$2a$10$erE4DLuCeRux/8z3UHb78OdiG.Rv9czObI0cmu.w2f0jfnEbgStcO	\N	\N	\N	0	\N	\N	\N	\N	2015-01-31 00:01:52.175443	2015-01-31 00:01:52.175443	Woojin	Yoon	WebsiteLogin	430531
379	anjanapatel81@gmail.com	$2a$10$3tbUvkOArNWFJqyzIfAmruh.alM6/wD9IDQGK91DXsA5aYi7J4WU.	\N	\N	\N	0	\N	\N	\N	\N	2015-02-02 22:48:49.686499	2015-02-02 22:48:49.686499	Anjana	Patel	WebsiteLogin	496168
380	victoriano.diaz@my.liu.edu	$2a$10$jxC9XkQ9idCTAQj16JiMHuoTGjlWgqeFHYD16uYv7kLRmvCKOPOka	\N	\N	\N	0	\N	\N	\N	\N	2015-02-03 16:29:42.295247	2015-02-03 16:29:42.295247	Victoriano	Diaz	WebsiteLogin	494570
381	meulo@aol.com	$2a$10$M4EXRMUr25TdwwqsxeBShOv0qcczqUHwK14eYCJiJy.t9lpvItuC6	\N	\N	\N	0	\N	\N	\N	\N	2015-02-03 17:55:40.000579	2015-02-03 17:55:40.000579	Michael	Eulo	WebsiteLogin	430156
382	pmhane@gmail.com	$2a$10$j2eO2eXyxRoAYY9mc37I7uxIrfFZztIyNhJt1p/u6LSZDr7MaN1Am	\N	\N	\N	0	\N	\N	\N	\N	2015-02-04 22:35:07.527559	2015-02-04 22:35:07.527559	Patricia	Hane	WebsiteLogin	430213
383	linda.lum@bms.com	$2a$10$g1wJr5SLsVLbNjlcCva.s.sSLT61goTnFRfMjGo38mRoUXo40tzZa	\N	\N	\N	0	\N	\N	\N	\N	2015-02-10 21:55:11.502786	2015-02-10 21:55:11.502786	Linda	Lum	WebsiteLogin	430313
384	maulenbr@gmail.com	$2a$10$pJvm.nEd8KPjZTO9V.Bamepovs4GBt.euEyi/UrvYYdHAu8vCsnZu	\N	\N	\N	0	\N	\N	\N	\N	2015-02-12 15:59:28.425352	2015-02-12 15:59:28.425352	Brittany	Maulen	WebsiteLogin	483620
385	msdanilack@yahoo.com	$2a$10$ZUrJCaAuPXNA.iPboXGVqOnLzEBRCZT0Ew/LLgGxfv3s5wtqUEW4q	\N	\N	\N	0	\N	\N	\N	\N	2015-02-12 23:45:23.670745	2015-02-12 23:45:23.670745	Susan	Danilack		455682
386	emerik_azores@pba.edu	$2a$10$Hk7ZbvyWzZN6BO54Ts9piOACJzR9xvfDznOBP/fVM.4MhKyl/D05y	\N	\N	\N	0	\N	\N	\N	\N	2015-02-13 15:07:25.343768	2015-02-13 15:07:25.343768	Emerik Zekiel	Azores	WebsiteLogin	498673
387	ydun17@gmail.com	$2a$10$UaqvS5nm70aM.uaOM5FIAONJLnIgxIUY.xhMu1WDqhnUu2XJZAcTe	\N	\N	\N	0	\N	\N	\N	\N	2015-02-17 00:25:59.628211	2015-02-17 00:25:59.628211	Ying	Dun	WebsiteLogin	498434
388	igots2bme@comcast.net	$2a$10$MPbC3BBm.CFRfuWvLdCAPOQ/ywCp7igZRS07m.8z71htc6xYNO29G	\N	\N	\N	0	\N	\N	\N	\N	2015-02-17 03:17:47.239073	2015-02-17 03:17:47.239073	Eric	Pullen	WebsiteLogin	491137
390	tud53641@temple.edu	$2a$10$UXUL5i3JLmnj/PD3OMhKq.pLIlje94CAdpFSxv1fKWA2.3NnvMC06	\N	\N	\N	0	\N	\N	\N	\N	2015-02-17 20:29:54.067457	2015-02-17 20:29:54.067457	Daniel	Jamison	WebsiteLogin	499324
389	houranig64@gmail.com	$2a$10$GE48RBj4YC5zTNcUaF0ttuDqmScvjZPXH0.YGdg3wX1Orop5NiU/6	\N	\N	\N	0	\N	\N	\N	\N	2015-02-17 17:29:28.839394	2015-02-17 17:29:28.839394	Ghassan	Hourani	WebsiteLogin	499190
391	terrymalanda@aol.com	$2a$10$nthyDS7CT4/t9G81mQ340e8tpOUcDebpCzj8z4U9gIz5LBrN9fzba	\N	\N	\N	0	\N	\N	\N	\N	2015-02-22 16:00:04.498494	2015-02-22 16:00:04.498494	Teresa	Malanda	WebsiteLogin	498087
392	mdp99@aol.com	$2a$10$u9isQ5pXsCykb7yZhfOo2.tcw0fhQDI8SwxGGakTaJcVc3lC4Auq6	\N	\N	\N	0	\N	\N	\N	\N	2015-02-26 03:51:32.14569	2015-02-26 03:51:32.14569	Mona	Patel	WebsiteLogin	430383
393	jpt618@aol.com	$2a$10$bIGSCwUIMINhGCX0VVS1/utHlNM68S2ArUTDRm.NJHoIctkD//jDe	\N	\N	\N	0	\N	\N	\N	\N	2015-02-28 02:33:09.306479	2015-02-28 02:33:09.306479	Joseph	Tarallo	WebsiteLogin	430492
394	dbong@comcast.net	$2a$10$3p7YVYOptbgO3LhCOse7F.MlfIjdE0bOeE6V6UF21/8vJ9N.1ZGsO	\N	\N	\N	0	\N	\N	\N	\N	2015-02-28 16:39:46.27196	2015-02-28 16:39:46.27196	Dawn	Sanderson Bongiovanni	WebsiteLogin	489495
395	mthyvalappil@gmail.com	$2a$10$wlcOoPfxFnDCTU2dNS5GJ.0xJQ7KMqTlz.KT488ijl1OER2sKgP3C	\N	\N	\N	0	\N	\N	\N	\N	2015-03-04 03:29:28.938589	2015-03-04 03:29:28.938589	Martin	Thyvalappil	WebsiteLogin	514318
396	bijal27@hotmail.co.uk	$2a$10$DjyEtX1mYpVVENSxGPKlueQX5K7fRlFpbo2Y9lr8BZYWgoftqbWle	\N	\N	\N	0	\N	\N	\N	\N	2015-03-05 17:27:45.596244	2015-03-05 17:27:45.596244	Bijal	Amin	WebsiteLogin	514657
397	drdudick@optonline.net	$2a$10$EcvZMr2f.etHYJr.RV3a/em0RVt7zqanDGzyygX3D0xxCtpkE..Ke	\N	\N	\N	0	\N	\N	\N	\N	2015-03-05 17:28:17.180664	2015-03-05 17:28:17.180664	Mark	Dudick	WebsiteLogin	514916
398	ljoseph22@hotmail.com	$2a$10$jRMGRy9RSPVeqDEH4I1jZesdbAxUI.qcN.uhiC.TJIIA1KAtui9QW	\N	\N	\N	0	\N	\N	\N	\N	2015-03-07 03:20:28.859803	2015-03-07 03:20:28.859803	Laiju	Joseph	WebsiteLogin	515184
399	dalmedogang@gmail.com	$2a$10$RupSPZW0ULDMot/aOAyOL.25pt31TnNVj.UMv/dzouj86X9JqoQNW	\N	\N	\N	0	\N	\N	\N	\N	2015-03-07 04:48:29.061292	2015-03-07 04:48:29.061292	Deborah	Allen Dalmedo	WebsiteLogin	515136
400	knalasco@gmail.com	$2a$10$.7u0CKP7UtewtNBNY6KotuFoGRVm6AS1/ctEqUAze.iP0Dz4FB7jC	\N	\N	\N	0	\N	\N	\N	\N	2015-03-09 17:38:32.38403	2015-03-09 17:38:32.38403	Kenneth	Nalasco	WebsiteLogin	515867
401	noha.sedik@gmail.com	$2a$10$R0rllV3p3bWt7w0dB3Hn8eAWlqrnWKDvZUxNFAG8qEdvSE9pe/OBO	\N	\N	\N	0	\N	\N	\N	\N	2015-03-10 02:18:21.348771	2015-03-10 02:18:21.348771	Noha	Sedik	WebsiteLogin	430448
402	crystande@yahoo.com	$2a$10$3mOyUJAkQHVfHBxX2vh9Fex.lw1WD/QFqPJuU362Unf6fCrMuKG/S	\N	\N	\N	0	\N	\N	\N	\N	2015-03-11 00:28:32.756961	2015-03-11 00:28:32.756961	Crystal	Anderson	WebsiteLogin	496095
403	nikki17rph@yahoo.com	$2a$10$LeVXxxnihFBVji6exJWoFu0hRPhFZ2R0Fd3YupnH8ZK2geAeZkYTG	\N	\N	\N	0	\N	\N	\N	\N	2015-03-11 13:47:44.578883	2015-03-11 13:47:44.578883	Nicole	Burlew	WebsiteLogin	471106
404	marie2lyn@yahoo.com	$2a$10$Qe6sjWBE2WNIKif4DicbuuWnfCzmWyKv88mrQtYrugfHKjhz3b6d.	\N	\N	\N	0	\N	\N	\N	\N	2015-03-12 02:28:56.804432	2015-03-12 02:28:56.804432	Widlyne	Ruffin	WebsiteLogin	430432
405	jackiemelebird@gmail.com	$2a$10$F.4TKvKfkgav/xRCl33lmel7RmYzAvZ0XbT4apndmUVerLMyc.y0K	\N	\N	\N	0	\N	\N	\N	\N	2015-03-12 12:31:22.09909	2015-03-12 12:31:22.09909	Jacqueline	Kaufman	WebsiteLogin	514153
406	lmalinisg@aol.com	$2a$10$CBMH7BU51oX8QES.sJfUPOJ261Xi6/w8EDuPV/Hx2MtdE.4p/kQhG	\N	\N	\N	0	\N	\N	\N	\N	2015-03-14 13:36:58.916214	2015-03-14 13:36:58.916214	Lyle	Guillen	WebsiteLogin	501020
407	apliura@gmail.com	$2a$10$Tqllde5nKcCuLL8OatIZ/.zbBjX5aEk4D4uYk2ViX32Yop/ehZBte	\N	\N	\N	0	\N	\N	\N	\N	2015-03-18 21:22:30.008303	2015-03-18 21:22:30.008303	Algimantas	Pliura		500673
408	shreyak84@gmail.com	$2a$10$nwBATK/lQq3UUDpR/hfMTeKNRShzBylFZ3anbT/jUPhYWtAjRP9RW	\N	\N	\N	0	\N	\N	\N	\N	2015-03-19 00:37:55.852131	2015-03-19 00:37:55.852131	shreya	khambhati		515582
409	m.pirretti@kennedyhealth.org	$2a$10$xLt18ugnlWUk0GcAg7CDrujsjYJvxY3V5qPnbsN9w/R7D9fmsFFJC	\N	\N	\N	0	\N	\N	\N	\N	2015-03-19 16:48:54.98125	2015-03-19 16:48:54.98125	Maria	Pirretti	WebsiteLogin	515198
410	jdsmitty03@yahoo.com	$2a$10$jNi94vNXiFEPJ9tphxPrAuvtpBEbTvc4wk5GHJTf7mF4O3gJtutmi	\N	\N	\N	0	\N	\N	\N	\N	2015-03-19 16:55:32.122844	2015-03-19 16:55:32.122844	Jason	Smith	WebsiteLogin	516980
411	kingrio8@aol.com	$2a$10$NvoHmdNkGOuy7foE64tpcOc9xJamxqM.7rs32jdi6VdNbG1s2Ghbu	\N	\N	\N	0	\N	\N	\N	\N	2015-03-22 15:25:32.429522	2015-03-22 15:25:32.429522	Adalberto	Aguero	WebsiteLogin	515567
412	hgialanella@gmail.com	$2a$10$Vh3UqgzyCyUPSgtXYV62De54x/oRmzCZSh7aeAmOs.cmuNwwCISri	\N	\N	\N	0	\N	\N	\N	\N	2015-03-24 22:48:31.212497	2015-03-24 22:48:31.212497	Henry	Gialanella	WebsiteLogin	520013
413	stvchang@mac.com	$2a$10$rKsj7FZPnfhtBk5Utmf9dOkFCGUGxsmzT2CnBMurHvxNHWjg3PIT.	\N	\N	\N	0	\N	\N	\N	\N	2015-03-25 14:48:12.839529	2015-03-25 14:48:12.839529	Steven	Chang	WebsiteLogin	430082
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('users_id_seq', 413, true);


--
-- Name: award_nominations_pkey; Type: CONSTRAINT; Schema: public; Owner: rails; Tablespace: 
--

ALTER TABLE ONLY award_nominations
    ADD CONSTRAINT award_nominations_pkey PRIMARY KEY (id);


--
-- Name: blog_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: rails; Tablespace: 
--

ALTER TABLE ONLY blog_posts
    ADD CONSTRAINT blog_posts_pkey PRIMARY KEY (id);


--
-- Name: blogs_pkey; Type: CONSTRAINT; Schema: public; Owner: rails; Tablespace: 
--

ALTER TABLE ONLY blogs
    ADD CONSTRAINT blogs_pkey PRIMARY KEY (id);


--
-- Name: callout_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: rails; Tablespace: 
--

ALTER TABLE ONLY callout_assignments
    ADD CONSTRAINT callout_assignments_pkey PRIMARY KEY (id);


--
-- Name: callouts_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: rails; Tablespace: 
--

ALTER TABLE ONLY callouts_pages
    ADD CONSTRAINT callouts_pages_pkey PRIMARY KEY (id);


--
-- Name: callouts_pkey; Type: CONSTRAINT; Schema: public; Owner: rails; Tablespace: 
--

ALTER TABLE ONLY callouts
    ADD CONSTRAINT callouts_pkey PRIMARY KEY (id);


--
-- Name: ckeditor_assets_pkey; Type: CONSTRAINT; Schema: public; Owner: rails; Tablespace: 
--

ALTER TABLE ONLY ckeditor_assets
    ADD CONSTRAINT ckeditor_assets_pkey PRIMARY KEY (id);


--
-- Name: pages_pkey; Type: CONSTRAINT; Schema: public; Owner: rails; Tablespace: 
--

ALTER TABLE ONLY pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: settings_pkey; Type: CONSTRAINT; Schema: public; Owner: rails; Tablespace: 
--

ALTER TABLE ONLY settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: rails; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: idx_ckeditor_assetable; Type: INDEX; Schema: public; Owner: rails; Tablespace: 
--

CREATE INDEX idx_ckeditor_assetable ON ckeditor_assets USING btree (assetable_type, assetable_id);


--
-- Name: idx_ckeditor_assetable_type; Type: INDEX; Schema: public; Owner: rails; Tablespace: 
--

CREATE INDEX idx_ckeditor_assetable_type ON ckeditor_assets USING btree (assetable_type, type, assetable_id);


--
-- Name: index_blog_posts_on_blog_id; Type: INDEX; Schema: public; Owner: rails; Tablespace: 
--

CREATE INDEX index_blog_posts_on_blog_id ON blog_posts USING btree (blog_id);


--
-- Name: index_blog_posts_on_post_url_alias; Type: INDEX; Schema: public; Owner: rails; Tablespace: 
--

CREATE INDEX index_blog_posts_on_post_url_alias ON blog_posts USING btree (post_url_alias);


--
-- Name: index_blogs_on_blog_url_alias; Type: INDEX; Schema: public; Owner: rails; Tablespace: 
--

CREATE INDEX index_blogs_on_blog_url_alias ON blogs USING btree (blog_url_alias);


--
-- Name: index_callout_assignments_on_callout_id; Type: INDEX; Schema: public; Owner: rails; Tablespace: 
--

CREATE INDEX index_callout_assignments_on_callout_id ON callout_assignments USING btree (callout_id);


--
-- Name: index_callout_assignments_on_page_id; Type: INDEX; Schema: public; Owner: rails; Tablespace: 
--

CREATE INDEX index_callout_assignments_on_page_id ON callout_assignments USING btree (page_id);


--
-- Name: index_pages_on_parent_page_id; Type: INDEX; Schema: public; Owner: rails; Tablespace: 
--

CREATE INDEX index_pages_on_parent_page_id ON pages USING btree (parent_page_id);


--
-- Name: index_pages_on_template_id; Type: INDEX; Schema: public; Owner: rails; Tablespace: 
--

CREATE INDEX index_pages_on_template_id ON pages USING btree (template_id);


--
-- Name: index_pages_on_url_alias; Type: INDEX; Schema: public; Owner: rails; Tablespace: 
--

CREATE INDEX index_pages_on_url_alias ON pages USING btree (url_alias);


--
-- Name: index_settings_on_setting_name; Type: INDEX; Schema: public; Owner: rails; Tablespace: 
--

CREATE INDEX index_settings_on_setting_name ON settings USING btree (setting_name);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: rails; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: rails; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: rails; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

